Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A86CD12671
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 21:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC72210E6DA;
	Tue,  2 Dec 2025 21:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O8s2OkfY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6126D10E6D9
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 21:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764710888; x=1796246888;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rNnat4S2Yk6iK5jz2vkP082uaserkaR61tj1rRPK/+Y=;
 b=O8s2OkfYqxVutdOpimZ07P/rBHPwCncTYn559mfs3fsH/qc98wIJMnLo
 lCIvmCTf4aoSwGPjICN92dxryRDqu0ZmC83G7P2TdKjguHkqeXVeXHo0S
 QHLoWYXeHdtqSVJ6cZ2w1p6RmUnTBirmNmaTMFJPUUZMSNGq3AehdWP78
 ez5OKGBtS1TFdXMR5WLlSbhBcz/BpYNFXxBWOJGPl0Z/48I2igXPelNeF
 pFYtTWlMELqLBOJa/uOKGfP2N8rZCJ9hRttwjcKYCU2cPWFEEGhMdTGjl
 QmlBGx5dzmcOklAu8NPQ/2SBoENMiXmlo0KXOz8sS4QsqGRPu5Hc2woqQ A==;
X-CSE-ConnectionGUID: JE/4wZWwT02L4JCIWPzXzg==
X-CSE-MsgGUID: PzosIf7hRKq9L62qlp3t3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77801267"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="77801267"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:28:07 -0800
X-CSE-ConnectionGUID: 5c64jJzgReWc1KJppNnSfA==
X-CSE-MsgGUID: s2QXbAs4RTOscMhqsM6rYA==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:28:07 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:28:06 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 13:28:06 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:28:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xza4ivM2vRkP68MOdKt7coojDpA+d0FtSEMFShLU4rL/w+C7Ai9Tr9X2Ovhpt+NOOqL5OliMDzqSv+hfS6rf8cyuW9IOmmrx/DHQcyY6DWAR3opzgo3hLHZcpG/CzVQBJkWLFiTO7n+Y/htcpRZDwk5Dm46n0YDo5+Q4H9DvLvExZ0p/PP8ewxkZaHgq2itwBAO+OoTGUkyZnzS7h0caPKt5SWx0rgszDlLUx7/yMJ22NV+5B8M2yXUvPoElyyvomZ7f5tzIoPhTwGEomZGY7I0Z1u/QORffVqnvAzOvuJhW0MdoHC4YZyNhZ1nXGFbFG29snLYe7qnZmwhKC/Spog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNybgJc9gWL2FTVbWSmWg7HtoK4L8KY3LXT2TcuqYv8=;
 b=nIa3wVpGkKay0+ncq4l+v3mC9FMIcghFZ/wjB+r0dZDEC/ru8b+rY55nBpsZoSwMntlggSAhg0gSlh+IZ+FUc5J6LDuSbdfPoxw64v71KhS7ZEAw23VJw1AXiBvxsFHESXBcisbJYDgYjcM61BIGWw21phyDWuuqzscimtZ81S51JiwPvOQk+8wCHl8M3Hs0hV26Nbtmo9CZHconGZBp6BjrB7ZUNfYwzKu7fP6vtw6ozBkeGpQ4ZAG8IStxqeLL0p4SyqiVEHgu+fagrraUSxDx3lnPHiFE/BdnjWs6C1z6imVipidaw5Zgw+kQgDJ0vN3oe+5O3ZWplIiEQBHWzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SA0PR11MB4751.namprd11.prod.outlook.com (2603:10b6:806:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 21:28:04 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 21:28:04 +0000
Date: Tue, 2 Dec 2025 13:28:01 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH v3 10/18] drm/xe/multi_queue: Set QUEUE_DRAIN_MODE for
 Multi Queue batches
Message-ID: <aS9Z4fQoa8VkkB1P@nvishwa1-desk>
References: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
 <20251121035147.766072-30-niranjana.vishwanathapura@intel.com>
 <20251124184935.GB4065316@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251124184935.GB4065316@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0293.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::28) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SA0PR11MB4751:EE_
X-MS-Office365-Filtering-Correlation-Id: 52a92b56-3878-4538-d99e-08de31e9ad69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h2nojzAPWi2tXnClMt33ztUZ2F2BvRcE3sKXTMxbVGoB8BbJdrk7h+GIzJgo?=
 =?us-ascii?Q?XxYRSfflkfXTiZ1zItT58GvulI5unL/vrSspVt3NhNSX3pLLjCDLt+MBOla8?=
 =?us-ascii?Q?kLdSYn5/r9ZlCgfLn9pcYGEMn1EHFV9w3C1v4kWI4iDfjSU072xtzLt63voD?=
 =?us-ascii?Q?v2cRq7TjQehg8q1vtGXQB7kwePksnajqhCjoggVglOL8aNuqCeX9RhIxW9Ro?=
 =?us-ascii?Q?b5QYWgztY4NO74eEJhlRFGsdQ0yR9W0e0RRkAIcTSfjh0l44kTNiebeOLdg5?=
 =?us-ascii?Q?cqFj2RDhefJYsoNDa8it7t/M7NkJRi3bmB7avYxP6nHTqVieONc7qcyGgwVJ?=
 =?us-ascii?Q?poOC4AUts4S/ywgZQxULm8lQuBqczs86BkZ0Ozpxe4xPsOLWGfEIZ2dcTTUV?=
 =?us-ascii?Q?D3nAEky13F1T6QY+1e1qA9A5dausVULqBIR0GidbCu/JcpKz+ZWo6AV/dHQy?=
 =?us-ascii?Q?KRMQi+vHrP2gcpH470d5CGS5YIA8spoTRimF3rYTZuhZDF1O8/j4KFdVlf5y?=
 =?us-ascii?Q?p7/J1nGA953FWaLhsHflLT8b/6wS+PeWJ8P3QL1adWwWXL7AlpoK5B7g5k9/?=
 =?us-ascii?Q?Mq/dvqUE/7Y5NUdsibc4WNOnVloMBY5EvqKj6bzjw+7IQKVI6mepJDrmAdAm?=
 =?us-ascii?Q?pCB4fee27Vd0/fUvL5RaB+/2TxVFwh4SRH4Y88tkejprSgeNZ5SjBKW/1+Ke?=
 =?us-ascii?Q?QTxYQl2ZwDUMhe+c41CiZlWU7MbldOo4u6whQjSZTZbQWBC+LqFxRtyhhmlo?=
 =?us-ascii?Q?k6I24cm98/RvM73AR72xiphnnejpm382nxePRO6otxOoVDdndaLwE2XD8hwi?=
 =?us-ascii?Q?aUup41Oo1wfgAcFhQb0AR8FYei+wBPhhsyuskqKrWwM1XUzgZmiAkkA82/+c?=
 =?us-ascii?Q?N3juVB3OXAfUocdqFDMqRMku3+o7/iCO/5xXX/CugZAQ8c9wsZMxPw8PX9kF?=
 =?us-ascii?Q?CBT/899sQ3yug0aSVhyNyPOgSEZ5buefvfEhOtVrVf/gDWKnL6aTey4Jy3bB?=
 =?us-ascii?Q?L0e5XsAJjlyeJzAsjJBB8xVw7XOwENUyEAL2st/W/+bo47PqjHIKpo64sM2C?=
 =?us-ascii?Q?xBT7miUmYUYysdfS/lglZ36A57e66TNPjFf12ZizCvkCzUjyu1U/2SIUIccQ?=
 =?us-ascii?Q?EVcXJ5cd/OgzxSUsGF9I99E4jCh5WTMyq2Jw5gWxL9Y0ddAsclrGuPpHolNt?=
 =?us-ascii?Q?krtvsLv7t6najlxNgVSyuLwMfA5QwvJhuWqXNVgzJqP/wTX7lArRTkP5J3Ps?=
 =?us-ascii?Q?jM4Hg8rX7Vp5q9lZqwNZRAN4a/SNQjmKhoYoAqiZLJTn60V2qW30d7hZF00o?=
 =?us-ascii?Q?ASwM8JBpnkAmObyvF+B77ydwO2orqSKcduqLHl2Fwu60Z0I2fP78pcxXeC9s?=
 =?us-ascii?Q?V1fyfrjgX+kYjfbE7lLc039H54YrBpLjL6wGEX0UGYPz3RpvbQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Glb5NOq3UoW7XTzI8H7Od7myVeKhl3sLBCyJoQfH+z1zIA1PX/Z24xuSi0lE?=
 =?us-ascii?Q?X6qZk+rfBcNyKYR+2Atw9JbcOT4LcPwYFiiJLyDfpXRLXKsmowPLJrcZGa6J?=
 =?us-ascii?Q?Du2Lx+bMKzMNueKGwymr/j01YsmyAzvx47NDdL/TJps6CN3qMT5bwOhoF7Xd?=
 =?us-ascii?Q?Q2QT3Gbef7CuvGNQRHIJHgnKKYZkLNVfa1DGBg0JZMcfJU+2mtZ1qJzV3dfy?=
 =?us-ascii?Q?zYoOJErAKMtjbPCu0wfPIfbkpCIEyxeutoyEIQyonjeGd703qDPoLiuAOtmq?=
 =?us-ascii?Q?BD7AZMT6E8UPYW2qq+t1G0oBltbDf+sq+FLgB663pANBpUT8NVUx1lctIMPH?=
 =?us-ascii?Q?IB8Euwo3ic0Czbn5idiBrf5Eex66nKvjnn4bHY6KQv17KEOLkHq40MOpZEfI?=
 =?us-ascii?Q?kVozlhk09JW2p+J1re+02Ejr0Z5YRYOk+7n1GozNxW1D3szfZjERN+GosqS1?=
 =?us-ascii?Q?XIC7KxnG7Iv8QWfc2xbT0Sd3P5wi8J8f9hGk7KJNwJRwvR8Ea7QS2XApdO3d?=
 =?us-ascii?Q?aK0aDm4DDxPlowUZVpj5JY7x0YAwZEqPxGnwduU8piNm0k66l/Q8jf9qrBNO?=
 =?us-ascii?Q?lCR/ld08IcDRyiRQ5cbjhg9wl2rLuwackR9n50EEEY9dhk4J9jUrbJ4Gvn7w?=
 =?us-ascii?Q?yiPPsn5Rw8HdHEb3kGqlXqpAxq7+zByw0SYCO+X7JsRIb6b/TUyzBncE63qa?=
 =?us-ascii?Q?n76nj24bur/u+/i0EUCh5bgM8Gnaje9cWlJNSq2/3D3td5Bz+hfiOyve3qaX?=
 =?us-ascii?Q?H/AoBHkJPo8v8+EVAaAcEnlyUmA9jlNAbhP6vs6ZRlKgD5SO5MGmJLc3V0Vl?=
 =?us-ascii?Q?GHWJWNMbj3UMylZTeVZ06P8ePkWYeHjomoHKp5AeckX5TnqUCribbKKaSnSe?=
 =?us-ascii?Q?XlC/QjEFWJGIkGgWdOX/Lq3k1Alrz4XzT1Gopu61JK4bPX/t27rXTpzbhFkK?=
 =?us-ascii?Q?S9yVniPgnmhST/Cu7wXPMrzG2Y3SAF5I+KsmrWOfH7jpq5rQ3H6/A2z56dAa?=
 =?us-ascii?Q?lCroHMYRsP3ztg2jeiTygmSEDbRPyV1swoVcJWU2uyZ/PDIIjiLNArKHnd+z?=
 =?us-ascii?Q?2fVHo8M7XnEo5gykQh7DCK3GNMMOkgURdeAQuWuCWRg15vU4g0L3gw4PBcN3?=
 =?us-ascii?Q?wINmRJ4v+6XpS+v4/xH/onIC1ngGpS1UCmtixGyDCMIMsyL6iwi/47tYL0W4?=
 =?us-ascii?Q?VPKqttcuJi2lhVyadiZ2J5GTSWMPxNHXkjx1hJU6G07E5x7JO5iAh2xNYnRy?=
 =?us-ascii?Q?SsLqao1Ti1KlEq9O+Zr/CTCnKHtcXDHF0PZ84AQ4Ki+vxFx/OsBNcjRh7wwj?=
 =?us-ascii?Q?9pnxtu4TPQgKlrNpqQMhr2R8reSESvRgiu/eKkLjDzZ2dj6gfUkSuOInjgF4?=
 =?us-ascii?Q?2misUSfijVMfGL7FY8uYjI10GEj8h8bMXIf+stjdVhBcyYjl1yRXakhbUzFh?=
 =?us-ascii?Q?glEBl8I0hiY8lETTgVGp3D2APjz7HDvmVeUlfmtWbiRIozASlvhBaRDdK4L3?=
 =?us-ascii?Q?26gi8j1VnL5M9bJXNGMihp6qAwDyULaDa4i6Wr3LGvfS+p8u8KX/49HOOqwI?=
 =?us-ascii?Q?b5GboAGZwNChHEZWkw0yj0UUrWVKHg9rqmRdDfffnOa6F3ZKT4YQQj3iGQ8z?=
 =?us-ascii?Q?EAIIII8RjdiEeoBEmi7yXsE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a92b56-3878-4538-d99e-08de31e9ad69
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:28:04.1828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0grUMJVu8je2967QjGTElCG+fWOGlcxPdfWX5IJCzgHr9xTJaneLggWPxVPQb0C/S2vFF+FHM1mOslPyiENLIww6bxrYqZJzdzQgDy89H+cbqLKZqbqzA/5HFRrDsTFh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4751
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Nov 24, 2025 at 10:49:35AM -0800, Matt Roper wrote:
>On Thu, Nov 20, 2025 at 07:51:44PM -0800, Niranjana Vishwanathapura wrote:
>> To properly support soft light restore between batches
>> being arbitrated at the CFEG, PIPE_CONTROL instructions
>> have a new bit in the first DW, QUEUE_DRAIN_MODE. When
>> set, this indicates to the CFEG that it should only
>> drain the current queue.
>>
>> Additionally we no longer want to set the CS_STALL bit
>> for these multi queue queues as this causes the entire
>> pipeline to stall waiting for completion of the prior
>> batch, preventing this soft light restore from occurring
>> between queues in a queue group.
>>
>> Bspec: 56551
>> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  .../gpu/drm/xe/instructions/xe_gpu_commands.h |  1 +
>>  drivers/gpu/drm/xe/xe_ring_ops.c              | 68 ++++++++++++-------
>>  2 files changed, 45 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>> index 5d41ca297447..885fcf211e6d 100644
>> --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>> +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>> @@ -47,6 +47,7 @@
>>
>>  #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
>>
>> +#define   PIPE_CONTROL0_QUEUE_DRAIN_MODE		BIT(12)
>>  #define	  PIPE_CONTROL0_L3_READ_ONLY_CACHE_INVALIDATE	BIT(10)	/* gen12 */
>>  #define	  PIPE_CONTROL0_HDC_PIPELINE_FLUSH		BIT(9)	/* gen12 */
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>> index ac0c6dcffe15..71f0e19fe8ba 100644
>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>> @@ -12,7 +12,7 @@
>>  #include "regs/xe_engine_regs.h"
>>  #include "regs/xe_gt_regs.h"
>>  #include "regs/xe_lrc_layout.h"
>> -#include "xe_exec_queue_types.h"
>> +#include "xe_exec_queue.h"
>>  #include "xe_gt.h"
>>  #include "xe_lrc.h"
>>  #include "xe_macros.h"
>> @@ -135,12 +135,11 @@ emit_pipe_control(u32 *dw, int i, u32 bit_group_0, u32 bit_group_1, u32 offset,
>>  	return i;
>>  }
>>
>> -static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
>> -				int i)
>> +static int emit_pipe_invalidate(struct xe_exec_queue *q, u32 mask_flags,
>> +				bool invalidate_tlb, u32 *dw, int i)
>>  {
>>  	u32 flags0 = 0;
>> -	u32 flags1 = PIPE_CONTROL_CS_STALL |
>> -		PIPE_CONTROL_COMMAND_CACHE_INVALIDATE |
>> +	u32 flags1 = PIPE_CONTROL_COMMAND_CACHE_INVALIDATE |
>>  		PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE |
>>  		PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE |
>>  		PIPE_CONTROL_VF_CACHE_INVALIDATE |
>> @@ -152,6 +151,11 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
>>  	if (invalidate_tlb)
>>  		flags1 |= PIPE_CONTROL_TLB_INVALIDATE;
>>
>> +	if (xe_exec_queue_is_multi_queue(q))
>> +		flags0 |= PIPE_CONTROL0_QUEUE_DRAIN_MODE;
>> +	else
>> +		flags1 |= PIPE_CONTROL_CS_STALL;
>> +
>>  	flags1 &= ~mask_flags;
>>
>>  	if (flags1 & PIPE_CONTROL_VF_CACHE_INVALIDATE)
>> @@ -175,54 +179,70 @@ static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
>>
>>  static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
>>  {
>> -	struct xe_gt *gt = job->q->gt;
>> +	struct xe_exec_queue *q = job->q;
>> +	struct xe_gt *gt = q->gt;
>>  	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
>> -	u32 flags;
>> +	u32 flags0, flags1;
>>
>>  	if (XE_GT_WA(gt, 14016712196))
>>  		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
>>  				      LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
>>
>> -	flags = (PIPE_CONTROL_CS_STALL |
>> -		 PIPE_CONTROL_TILE_CACHE_FLUSH |
>> +	flags0 = PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
>> +	flags1 = (PIPE_CONTROL_TILE_CACHE_FLUSH |
>>  		 PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
>>  		 PIPE_CONTROL_DEPTH_CACHE_FLUSH |
>>  		 PIPE_CONTROL_DC_FLUSH_ENABLE |
>>  		 PIPE_CONTROL_FLUSH_ENABLE);
>>
>>  	if (XE_GT_WA(gt, 1409600907))
>> -		flags |= PIPE_CONTROL_DEPTH_STALL;
>> +		flags1 |= PIPE_CONTROL_DEPTH_STALL;
>>
>>  	if (lacks_render)
>> -		flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
>> +		flags1 &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
>>  	else if (job->q->class == XE_ENGINE_CLASS_COMPUTE)
>> -		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>> +		flags1 &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>> +
>> +	if (xe_exec_queue_is_multi_queue(q))
>> +		flags0 |= PIPE_CONTROL0_QUEUE_DRAIN_MODE;
>> +	else
>> +		flags1 |= PIPE_CONTROL_CS_STALL;
>>
>> -	return emit_pipe_control(dw, i, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0, 0);
>> +	return emit_pipe_control(dw, i, flags0, flags1, 0, 0);
>>  }
>>
>> -static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int i)
>> +static int emit_pipe_control_to_ring_end(struct xe_exec_queue *q, u32 *dw, int i)
>>  {
>> +	u32 flags0 = 0, flags1 = PIPE_CONTROL_LRI_POST_SYNC;
>> +	struct xe_hw_engine *hwe = q->hwe;
>> +
>>  	if (hwe->class != XE_ENGINE_CLASS_RENDER)
>>  		return i;
>>
>> +	if (xe_exec_queue_is_multi_queue(q))
>
>We probably don't need to worry about converting in this function since
>it's only used by an Xe2 workaround and will be removed completely once
>https://patchwork.freedesktop.org/patch/689424/?series=157804&rev=2
>lands.  If you want to be safe, you could just make it an assertion for
>!multi_queue since that should never be possible on Xe2.
>

Ok, will remove the change here and instead add an !multi_queue assert.

Thanks,
Niranjana

>Anyway, the changes look good overall so
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
>> +		flags0 |= PIPE_CONTROL0_QUEUE_DRAIN_MODE;
>> +
>>  	if (XE_GT_WA(hwe->gt, 16020292621))
>> -		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_LRI_POST_SYNC,
>> +		i = emit_pipe_control(dw, i, flags0, flags1,
>>  				      RING_NOPID(hwe->mmio_base).addr, 0);
>>
>>  	return i;
>>  }
>>
>> -static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u32 *dw,
>> -			      int i)
>> +static int emit_pipe_imm_ggtt(struct xe_exec_queue *q, u32 addr, u32 value,
>> +			      bool stall_only, u32 *dw, int i)
>>  {
>> -	u32 flags = PIPE_CONTROL_CS_STALL | PIPE_CONTROL_GLOBAL_GTT_IVB |
>> -		    PIPE_CONTROL_QW_WRITE;
>> +	u32 flags0 = 0, flags1 = PIPE_CONTROL_GLOBAL_GTT_IVB | PIPE_CONTROL_QW_WRITE;
>>
>>  	if (!stall_only)
>> -		flags |= PIPE_CONTROL_FLUSH_ENABLE;
>> +		flags1 |= PIPE_CONTROL_FLUSH_ENABLE;
>> +
>> +	if (xe_exec_queue_is_multi_queue(q))
>> +		flags0 |= PIPE_CONTROL0_QUEUE_DRAIN_MODE;
>> +	else
>> +		flags1 |= PIPE_CONTROL_CS_STALL;
>>
>> -	return emit_pipe_control(dw, i, 0, flags, addr, value);
>> +	return emit_pipe_control(dw, i, flags0, flags1, addr, value);
>>  }
>>
>>  static u32 get_ppgtt_flag(struct xe_sched_job *job)
>> @@ -371,7 +391,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>>  		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
>>
>>  	/* See __xe_pt_bind_vma() for a discussion on TLB invalidations. */
>> -	i = emit_pipe_invalidate(mask_flags, job->ring_ops_flush_tlb, dw, i);
>> +	i = emit_pipe_invalidate(job->q, mask_flags, job->ring_ops_flush_tlb, dw, i);
>>
>>  	/* hsdes: 1809175790 */
>>  	if (has_aux_ccs(xe))
>> @@ -391,11 +411,11 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>>  						job->user_fence.value,
>>  						dw, i);
>>
>> -	i = emit_pipe_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, lacks_render, dw, i);
>> +	i = emit_pipe_imm_ggtt(job->q, xe_lrc_seqno_ggtt_addr(lrc), seqno, lacks_render, dw, i);
>>
>>  	i = emit_user_interrupt(dw, i);
>>
>> -	i = emit_pipe_control_to_ring_end(job->q->hwe, dw, i);
>> +	i = emit_pipe_control_to_ring_end(job->q, dw, i);
>>
>>  	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
>>
>> --
>> 2.43.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
