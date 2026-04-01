Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E8110FCAF2
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 22:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4558810E7FD;
	Wed,  1 Apr 2026 22:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NOKhu/GL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D97110E7FD
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 22:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775083097; x=1806619097;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=L97fgcBdmZRwo7rPJKwhDo8QzRy8nUF368BfOYTaBnQ=;
 b=NOKhu/GLyE4BWJeztwZd/1QxEpTidNhJzdOdbMWJJEY8lpCYtQtkZ1K0
 jg4JRv7gkXSjff5mFpkIZZHoa9oumtyrRUH34j2AkdQuPmCJs/1iqawGf
 sYgVl3yrehir2pYs2hxg7wiEMpbp1c9DaipCYpY/RR6r8FwzibKpf27Le
 RRZRjS+VWzwL2nMhX8+6mBKEViPr4V0jfCeTzXaib/6EmPaXY3c56RD1T
 KK8MrRIG8HiycH+2dGbBi/oeGkbxYBG6HZpQbhymJK3ce4hds/qZumERZ
 HNKz9nBxmHBtBwF6+JTOfOtpoapTz9xUmcSJAoKGfAF7UkVUjC+fWC2T+ Q==;
X-CSE-ConnectionGUID: w/ZfnYg4T0a8O2p96cBHjg==
X-CSE-MsgGUID: VlUSiWBuRkKQECcdDPZTfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="75310666"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="75310666"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:38:17 -0700
X-CSE-ConnectionGUID: +Qh+f4SFSKSBn3iUodKWjg==
X-CSE-MsgGUID: NgBqySvMSj+t4siWkDqrQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="249854370"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:38:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 15:38:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 15:38:16 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 15:38:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f7Jx3c7WJwRVxKzpaaHeF4vFAu68gIMxxnym20+5wAU3Y8D8nrESXd2GPbRQqmU/ORCPHGxi1n18BFgfuinQ7vlHk5KTRPyc7Mu2VjVJkWjGX9kemfu0Im4mNqyjJHRJzFrnN9usGGOvj8/tWSJwWkIeV/qajzhOZL3LCgHomlfZcRCN2/j1+FKDMCdzKgeHXOjvk8NBOi1AwJ6qGnv0XfAnUTg3uMMgVcDK1sW29z2+SdSfopawusqm6miLVD8/UyJrdU0+uf+5jzjzgZ4WG/dZpJfty3vpioLOWuwScUc032OPoQEWjqKAOGMKgO4lmebkQ0I+Po2xCUb8ny2bjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NWwKwOobDQIxilpu7k9o41wyTgjkWodSmyKdiEgDWAI=;
 b=d9F7VbI7G1bC5F5XjpW72ceTrml16EOwyaAlrl7d8ggjSaEzBdxH8USzWVct0wfO9F4p16RbOnWa6Nk6X06h29dHL1BqgSDRSSO4VynGeAwGOrw7UvKaOl9w4EKWsQQLTbw+kob21NDy3oZq73ylNzANicgZ1k0Je4Qje5OcEyDY4EJchMsRbbkDaIsBzF8pvzcLEbY8YzCLfoSr7wWIluegNEGPiRoHSDLLORnQGkmp9PCC0JqAuk3PcHBTiNioetFgkIOnnEgVUXw4tUjbH4aFw6p4kYx/U5ufHYLd+8SjVd5Li5JJUUZrAbIrYOwEvRIcbHDnlMCy8OLNM4LrVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB4960.namprd11.prod.outlook.com (2603:10b6:a03:2ac::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 22:38:13 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 22:38:13 +0000
Date: Wed, 1 Apr 2026 15:38:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <arvind.yadav@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 06/25] drm/xe: Add XE_BO_FLAG_PUT_VM_ASYNC
Message-ID: <ac2eUdJNXNXOGj6J@gsse-cloud1.jf.intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <20260228013501.106680-7-matthew.brost@intel.com>
 <ac0N8dh5fVvBsLTB@fdugast-desk>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac0N8dh5fVvBsLTB@fdugast-desk>
X-ClientProxiedBy: MW4PR03CA0357.namprd03.prod.outlook.com
 (2603:10b6:303:dc::32) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB4960:EE_
X-MS-Office365-Filtering-Correlation-Id: b42e0b6b-e9ba-475b-3bad-08de903f5bb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: yQ7Xi0Z4rLkgXcr5RBhiOcpscf4SfwmGBeufXSLSQrfsLZpllb61yVh8VRyce56mQU3HiqwzkIDJQVj5v8QyTFFPB1iQejE7a3FDGPsxvjnA0gRGFCvOnk9B+9224yBVElKenKIV5tO9JKWlB1DmGfqWQgvBvZtJgL4I7X9zptf310sCekJhd0kvIjJlTti09fvARgT94fKcL/mZIIbnid9/Mz6Fo9jJE8ppg6lNftBRLPpASmxmRyK5Db8m68TrIvMt9vWg2pRo8/4VvM3tIK8ZIf738qLjY7O7RJ3wddWDRnz7/x6k/Ege9iNvBhwYwtwfhLLHCKLCbhJcYBkwAvLrqxwDIZUrCgfSdz1nCkMGJQUDg1cha+bRWUM+yac5qhzyPxPCuxSfUPYMT37GwDgA7Xc2btEU1Byz1P+gGO2lsyjQWjNSCExaBkiUwcbwkwpuU8XKlOzluyAIkeZ5UidoS0epk6E7wzC5TkJYrM9klMV4F3zvU+XRtJ/8I1ZeQACPvYHFklGhzzcww5zRZ9f3wwDROxqFXj4S0c6FU+3EnNzt8lQbnjesA0bZLvt2qHe4rcBGcAVNw0YIzvuWTPuXJcdlQ0xGdHOCCAxbJ4l41HxVajqJJr0OeaSrCtM6ES1TbWOsSNzgorCxrOCSda24BYLgWmZszUKoEYlufOG0lKzXcGJojr39ARWZttqKdwmEIEATi8dtusLX5C2SRxg8jcHZb7MYY7SFuIrvRqU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUFBTkdIcnM2cnVzbmJJRDl2M2RRZVIvbEo3bkhqZVBQZmRBUXNXNi9jUzVU?=
 =?utf-8?B?VlEzYko3dGJYRWNvVXdvM2tyMkpCMDdjQjBlS1JEUHJBOTFrenRneHd6ZExw?=
 =?utf-8?B?bm5HU0ZaYUZaTkgvcy9VdldFYzZQMkhRbDB4U29hMjNZK21McDRVNDcxbEov?=
 =?utf-8?B?bTZ5VXo3MFRab1JzNzdQVlFId0EwOWo3N0oxcy93WnpDRC9TTjd5aysrOWt2?=
 =?utf-8?B?bU1WZWRFVHhEeDRUSHIvQ2sybm1xYUJ2QUZZZFhVSTVpK3lnbW5wbE5XdUcy?=
 =?utf-8?B?SFBkYlNkU1p1V2Z6TEtpZHJMTlQ2ZTF6TWZLRjVZWkRnMGt3OHppa3ZTYnA1?=
 =?utf-8?B?SUtXaW1oQVBPZ2cvclR2bWRhYlVTWVh0cnZ3TTdSZThVMHZQVTFTcUtGbEJa?=
 =?utf-8?B?UEU1OTNjd3Z2WUl0K1FMdU85bGVsc01lTVRZcjFrYjhUcTlNd1drUUFBbDZh?=
 =?utf-8?B?cTdBTm5pR05JMHFUQk5Qei9pclJaL2R5NTdWekNNRVhoQ3ArQ1dyRDJLdngy?=
 =?utf-8?B?THNyZldiTWI1eHRCNUxPeS9VMkRoS2lXREJTVFVhdlZRSzVXOWFpWlJxYkdq?=
 =?utf-8?B?MjlHd2x2WVdyRXorMUE5NFZrRUVnOXNFdEtRd2REWHpCL0kwNEV0MDlpbldR?=
 =?utf-8?B?VDB2dkowK0w3TWsrL1UvTWZqcnJzZlNkTUZuMkI3SmJpc0FRYUlqYjdmQzg0?=
 =?utf-8?B?L3Z5S2pXbXBYcUsxVVVZRXN5SkxUL2N0ZmVPVFZXMkw5bTZic1pIbGVjSTcw?=
 =?utf-8?B?WWxBTnBEMDRIeVRoZElQTzl1S1FJL1JnaEI4MU1PRWQ5NTdwSk05ZFZJdGhP?=
 =?utf-8?B?Q0YvZ1hMSUUyVkJiVUtHTEhyMXJkaWpsUmlSbExHRVdFMXpPS2syQ3p4Tm5p?=
 =?utf-8?B?Wmt5cDdKV0tSN1ZGYk5LempSY1U3QkdGMnE0YkdpOVFnQUcwZXdYYzJiU09Q?=
 =?utf-8?B?UjNXZldKMGpsdE96c0hMM1NXSi96R0xORDVFZk5mdDhLeFBJczVuNWlRMXR0?=
 =?utf-8?B?aGFTSTV0VmxPMnJZQVZ2V0NRZEFNRmwxVGxwRElaMVMwV0RDcFVxVG5BeFZP?=
 =?utf-8?B?d3RmamlvNjcybURlZ3YyVjloT3VZSXFQdEhhbk5zM0VKNTlqcFB5b2t1bzN6?=
 =?utf-8?B?TmZwa0d2V2F3MnFNYWdMZmJaY2hCbTdsMjhTK1JycTRiR0dCQmZkVUF0cFow?=
 =?utf-8?B?bVdYeXpsSTR3OCs2VnhFTUFtOWl2OG1hRXNJTkRCWkUveC96QVNGdFNnSVB6?=
 =?utf-8?B?TDFFTVlJVGQ3UmNwN0MxbHlMYjh6SzVNaSt5SFI4ZjdmK1M1S1NKQVMxSU1y?=
 =?utf-8?B?UmtSekcrQUJJUzh1UEJVOUtWdWlVUnQyblJscEpSby9zNHZZL09mOVVaQ1dy?=
 =?utf-8?B?bEdWdjZDckVEQlFNMExaeHQ3UllQUWNzWG1wZTNQMFRNdVlDM1JVMjdnY3NZ?=
 =?utf-8?B?Z1Y4TVg0bTVtUkxrOTlHVHNwdnBZZHlGc1p6U210WUxzNmRybE8rYXhxVEtu?=
 =?utf-8?B?N2hqaEdtMWJJUWMzR01pc3BaS2trWXZ1SGQvRDExRVJFSUMxY3U1WU9sRy9z?=
 =?utf-8?B?d1hZQkRYQnI2L1A1MW9KaE9pejVsdktiSzRabFd5WkoxM2NkNDYzcXBKeVRa?=
 =?utf-8?B?dVBQVjVIZXc5aEhnY1ZTQXgrQXdab3JtV0pyd2hmZWhOcDJKbWtxNEZjU2Zt?=
 =?utf-8?B?YkRZMUd2aE1zT1lWNWJBSU9OVm96eTUzdFBDWnA3N21FSzF6NTI4YXpWNm9o?=
 =?utf-8?B?WTRUQ1N3S3BZRG16YmlhUXVIcG5BSWkwMCtEQW45eldEK1lHYkhGeGNFNXo1?=
 =?utf-8?B?TVo2S0t1ZXZUSVBnYWJmdndFd2dXcThxMmJZbFNMV0pUMGRnRUJBcHF5Z0RL?=
 =?utf-8?B?YjRLbmMzN2FYNTc3TEJCcUEzZkRnNDZxNENxcVVvVzA0M0UrRUVRSUN2RUk1?=
 =?utf-8?B?Y3hYZkRtOE0wYjRMcVNqdTBySUZ1ZWRoWWZmUkJiZXRFNURVcHNqRDVmMWha?=
 =?utf-8?B?bE9OUjZwSDg2MFBEL01QVUViUlVFSkR2RFFOS1VPY2k2RzJKaWYwNnFOT3NJ?=
 =?utf-8?B?MEo5a293bS9FRFJnL3lBOUF5eGJQdlo4b2tBR081OE1zcFc0T1ZaMG9NVmha?=
 =?utf-8?B?WmpPeFNZc09zUW4wNmMxQ1BHcnd5Rjdrc0tkcW56UENCSy84TnJLV2ZLM2xi?=
 =?utf-8?B?UUhIRHA4WmNwQnlkRld1dGRFZzc0dnhFQXkwV0c5QzFFTWZNdlczUFIxMkR5?=
 =?utf-8?B?L1BvSlN5cFBRNUJIbnhHT2RVU05rTVVIM29aVEZDakhrUTZmUld2N2tkcHdH?=
 =?utf-8?B?OFdqY0ZxeVl6QUxUS0V2QjV4UzVielBCS0tnL2kyc1FKWU9WdTZ1MmF2aGxV?=
 =?utf-8?Q?jh0AFL38wkNVnpqc=3D?=
X-Exchange-RoutingPolicyChecked: o/A44lfiWJDW0QA3vGyAx3ct9krWsaOs4NozHQPn+sO9JUNJQjKRzC4/J5jpc0GQEti9TctEzbdANUrDFTkjd4CQnUajANcA12z8n4Mm+QsFkXJs4b9/bxEAAXuFJSiMED0YJ/H/82TGf5z5heK33T1NNe3GkIINbvx0XAp2rRlMLBOT8HwF1YRVZrkfBCh6kmdur3Py4ZQi5RROWciY94869SE015bclTOsuqGo1eWBqfAMbK5U8cbelws+xaUZuprTfMT9dakMSX1bAm3qLnQfUxtWl+cNTZ7Gj4feCscXTGTD6QQD1UgvESjFMVTBDYeEsPn/tV20cnJkXY9mPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b42e0b6b-e9ba-475b-3bad-08de903f5bb2
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 22:38:13.0685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yt5c7fN3YZ+FXweg6/wJpm9apW66tat3zWVu0SHo4ljMNFcfvU2RFOYCyE3/eXKQEu8uegoLLdG+ERsmcKGS4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4960
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

On Wed, Apr 01, 2026 at 02:22:09PM +0200, Francois Dugast wrote:
> On Fri, Feb 27, 2026 at 05:34:42PM -0800, Matthew Brost wrote:
> > Add XE_BO_FLAG_PUT_VM_ASYNC, which indicates that an async BO put must
> > also drop an additional reference to the BO’s VM. This is useful when a
> > kernel BO, one that does not normally hold a VM reference, needs to be
> > put asynchronously, ensuring the shared dma-resv object does not
> > disappear before the BO.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c | 8 +++++++-
> >  drivers/gpu/drm/xe/xe_bo.h | 1 +
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 8ff193600443..d4c8ef8ff2c3 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -3567,8 +3567,14 @@ void xe_bo_put_commit(struct llist_head *deferred)
> >  	if (!freed)
> >  		return;
> >  
> > -	llist_for_each_entry_safe(bo, next, freed, freed)
> > +	llist_for_each_entry_safe(bo, next, freed, freed) {
> > +		struct xe_vm *vm = bo->vm;
> > +		bool async = bo->flags & XE_BO_FLAG_PUT_VM_ASYNC;
> > +
> >  		drm_gem_object_free(&bo->ttm.base.refcount);
> > +		if (async)
> > +			xe_vm_put(vm);
> > +	}
> >  }
> >  
> >  static void xe_bo_dev_work_func(struct work_struct *work)
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index bf284ed47325..14be9c1bb09d 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -52,6 +52,7 @@
> >  #define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
> >  #define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
> >  #define XE_BO_FLAG_NO_COMPRESSION	BIT(26)
> > +#define XE_BO_FLAG_PUT_VM_ASYNC		BIT(27)
> 
> If I understand correctly, this flag should only be used in the deferred
> path, which is why it is ignored in the non-deferred path. Maybe it would
> be good to add an assert there to make sure we are not mistakenly leaking
> a VM reference.
> 

I think we'd have to clear the flag here then too as we still get into
xe_gem_object_free + xe_ttm_bo_destroy eventually just not in the
naturnal ref counted way...

But that is probably a good idea though to make sure we don't screw this
up.

Matt 

> Francois
> 
> >  
> >  /* this one is trigger internally only */
> >  #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
> > -- 
> > 2.34.1
> > 
