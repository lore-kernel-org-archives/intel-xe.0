Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015C4109E52B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 02:49:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B5610E91B;
	Thu, 26 Mar 2026 02:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0IU5S6e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C23B10E91B
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 02:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774493381; x=1806029381;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P+Nkoz3PovG4qoeQznTfHoq1Z0rb26aGs9RgLOZQVj4=;
 b=B0IU5S6e64uNKM4cpQK2fSeAYxJnI2OoFDmK0XpZezF6h6oHAnv5Crp8
 UgT6jiDCqSkjy1sI2Po54s5xhKqDAL15s+lFLZpPapA3iWWo3aUfAo0pt
 OkE6eTNM6UCrh+QbrpM7qDr4f2GVjdvXqn9tvGm1AW2qekyYnUfADh4OE
 mEKysTDDgCORX1Gd5+z25Fsl8L4/NXq2hSlPrqhHtpx6Authx0L2ZMq0E
 hbGHDUBnlQ7ACtJZjocnpEgPsJGJkSjXeseVF3YweQ6d7BEhg5BeKvrzk
 siG4V1ufL9jRPkGydLxeEOHEtVaA4Q9MhLjh2SrdyvB2wnW6qiToGSZR2 A==;
X-CSE-ConnectionGUID: djH3xBghSnWGiGHVWFegSA==
X-CSE-MsgGUID: 97+CwQ/5SSKnH2L6VkT/vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86234506"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="86234506"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 19:49:40 -0700
X-CSE-ConnectionGUID: cFRrE0BuQBa1mY5MZjfd6w==
X-CSE-MsgGUID: 6xdl5ZR6TO6wNvDiPPZeWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="220464960"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 19:49:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 19:49:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 19:49:40 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 19:49:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFF/+hlCPbvLE9qjsbWISJYBhydaqwtohsVNRQ5pSLhhgxzto+Y5ikZgynB0w+OFSiJo3KCVdjCAiSc/MPU8Rm4Tf9eawRlsMEDCyS6qtiK181U+XgypgiCvp4XfGKMcztWnNcDatMeJCqKpEtbWoqdgAMRlcXwHTRN+PaPy5dT7lDq+zdV4Ou6JMVrWLZwdQ0XjvvU5MFoLFzgZOYpFgYzH+RDpCrMWexGi1a7i0Y1J685s7jxQgPmcPl6/nl5mFHOEMlarzIl4LvaLXiOA4C9KhFZpzS/wj8Sr1sXNgTCnrRc7Plc10EnpJKu8IyyJYCvzdUq1fSXSYPlM3tuChw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51A22jDBUivptWPyno2BRqT7k4o1NXwwLAXim9X22MU=;
 b=FjI7X4vBFj7VwKXXScZey350fwOddVrFkugr7Qxipuy3k9YXytexTSCYM8QVplsMUeoBod1lnabeoGKQdMfTMSuz+oD0/QsJTws6I8L0ymA9dFT01HaS1lJCRMHPqv94wcXX2Xs2x+8fcI6sQN4VeZFO80LPYvczIK05KxKAL5CezpT1fFSi8delGD+GsAZT9HHDBnZelurds+GjD1S2PzsAzWADGdhh9RYspR+3/TbSsuxBiUpwoVyVvqCs/NHBjvMDfWqgIkaV5isfHF4xjtf7qCqSFlKlvhtXYcJPV14AQdk5iP3wV+Bik6OAj8oPpsWkH8h5Ztlw/qAK4hlnng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5706.namprd11.prod.outlook.com (2603:10b6:610:ed::6)
 by MN2PR11MB4661.namprd11.prod.outlook.com (2603:10b6:208:26b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Thu, 26 Mar
 2026 02:49:37 +0000
Received: from CH0PR11MB5706.namprd11.prod.outlook.com
 ([fe80::30ac:8e5:b7c6:524f]) by CH0PR11MB5706.namprd11.prod.outlook.com
 ([fe80::30ac:8e5:b7c6:524f%4]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 02:49:36 +0000
Message-ID: <62925a4e-88f4-43a9-822c-d0d28937cfa6@intel.com>
Date: Thu, 26 Mar 2026 08:19:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/12] drm/xe/bo: Block mmap of DONTNEED/purged BOs
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
References: <20260323093106.2986900-1-arvind.yadav@intel.com>
 <20260323093106.2986900-9-arvind.yadav@intel.com>
 <acSM//v55wHqdto2@gsse-cloud1>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <acSM//v55wHqdto2@gsse-cloud1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0188.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::8) To CH0PR11MB5706.namprd11.prod.outlook.com
 (2603:10b6:610:ed::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5706:EE_|MN2PR11MB4661:EE_
X-MS-Office365-Filtering-Correlation-Id: 780d47ae-4d37-4daf-f5dd-08de8ae2517f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 3xi9C1tE5dL6gII2eIUxI+Mkou5i198ZTygSLWo14YzkZ7NVHZSS1Ah0jytV8+8r1ANp25s5UfOT9XFDRq5/LmLkDDfXEfxSWBgUOKFs6MpBDp9CUJozMgcy+gBCXmxTMfk1t//4YQ94wO749rBfZqGj//GpedAV+AMCCF6x3rNisrtifFTUsqb14ZFxwR1GOy7loy3R9h7K3WicgfClkpLDwsIZ5JrCEzPmoNH2Zgn/KGIKnho1vB/+bKNE6p/ZKlN0EKsj5l8s3n9w/xrv5630EGTpeixLxU+r5m7LCY2QrNjjg1+8zu9Kpx98D0Hf9PljSEGgHM1nXuvYmxqmWWXoZ3uPrh86aEiiS/1kpDJ60JjMhd3sK8DPDgAIKkNl69ivYE6ORsCqxlh6CRMCq6Y8+2jtHGsn6qkoeV2D2XGa6w/J2xko1GHyfeafTs5VpeT72+k/hEdm7t8coJB9NozjJwiyyHXWBQIjSikqkcfY9ERRmONVySadnbQhYmKmWAifp1hJaR/6Cz7IO/u930ZKuQ9toihmm+KTk2CWC+DmZpSqnCnwQVu/faUwkR5ulF8n3TR5wgi7h1hYq6cxTkXqWE84ArnWK6/uaAz8+0aTWfLS7QKZH3LZTQG/3YheseHicqHYkA6LFUlFQXElsdzMT7q7HR480QxCqpLHIEbbqjzpzjgp3wFnBFxvHNxqQ7al7d3rReeWs1i/m2az7LuCQDNSYZyCePV6XoFmf10=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azNxQVFGMkJVSEw1bTZCUjFPUk41b0YzNk1LU3Y0OVpCV2E4RjczR0FPQ1Jz?=
 =?utf-8?B?VnYvMkpocmZKdXd5ZWYzWlpoOHR3TnpZN3lkT1huS1pMZ3lHS29BYXFva0gw?=
 =?utf-8?B?cVNBVE9yUWFkYis0eG5MUE11eFIvaWxNTWtjaVZHNnFkNGRvSHZ1WEVZelJp?=
 =?utf-8?B?ZVBxWTB0TW5ORlV5U3VIZWo4aXU3NFZocmZmR3RFWHB1Z1ErS2I1dXJFbnJs?=
 =?utf-8?B?c2djamNVVU9wSDFYblB4VEd1bCt6bTZUd0FSaS9Td0p4RlBLUmQ3TUpxMk1P?=
 =?utf-8?B?UkVYcFROb0w0Y04reTZ4a0puaGhrb29uVENiY0c2Q0RkNGJiSjhXOXpVT2xZ?=
 =?utf-8?B?NHd3OG9tamtNQVlwS1ZiSko4aVFPS0FJeE9RdWZLamd5THBic2NuMGQvVUho?=
 =?utf-8?B?d0VzVkJOUjYrdmdhbWltVGtDelNUZXVYSXptc3dtc3Vhc3RNNU9FdmhVVXZX?=
 =?utf-8?B?NE5SRTBUMnB6ZW9YL1FucEVRSnRQVGx4c2NxRlg4ZGkxaFFhODZSV1dURm81?=
 =?utf-8?B?alIwY1VYNktDUjVURmprc2ZaQjl1cVNsbzFQc1Z0ZVIvZkljbjJDVWxINHUx?=
 =?utf-8?B?VFZSVFFCMHVuYXZqaEdMT0NZdE1JMWE5RE5pK2psbVhPZXRYOGk3dVd5ZGdk?=
 =?utf-8?B?MVlXUElwaHhGWnpwcUVNd2ZYU29CWWtoOEVJMGE1RVBWV2dWMXM1TzUxNytG?=
 =?utf-8?B?VWJkTG9QMVNnMndqa0NsZ1czMGc4OWdMZDF2eGNnMVIvWDN1UkxHRDltVllU?=
 =?utf-8?B?RHltMitObVlNa0c1RE55TTJ0ekJIYTYzbE1HY2E2eTk1dzFQb1drNm43anNi?=
 =?utf-8?B?TU5TbS84cG0zQ3JUK0xvcHJSRFZnRDJBUUt2dmxoWHNobUQ0Y1FwY2ZLRzhG?=
 =?utf-8?B?U1loMlhlVGVDNG5qU0k3dW52dGk5NllZTy9YZ1JzRHowVHkwbDhGV0NTOGlV?=
 =?utf-8?B?TVY2dUR0emtNNVNxNEN5MUxpa2pXQXNPTVFnQjdVYU43UTNDNXdBZ0NyY1Y2?=
 =?utf-8?B?SEVjMGVhTjJ1TlUwSlAwYmNESGhGTlM5NmpSTkdmd0ZNWmNXV0hkUVFCQUFD?=
 =?utf-8?B?UnYxbzFya1NuQ0tnVDF0NFpSN3ZVK0RUNVNDQWd0QUt4U2llTWNhaXJYOUR6?=
 =?utf-8?B?dkloUitqZzcwRGRKTCtxYzhXdUxTMVRMS1ZBU3Q1bEkzNnJPVmRXd3Jwb3Fm?=
 =?utf-8?B?cE00VzhWdXB2RUI3dUFMcWtlcGc1YmxnZFlXZ1VTVUs4MkFnY1dEc1M0aTQw?=
 =?utf-8?B?akhLTDNqRjBWNHhRQkpYTTZPY2tyMXF5ZDk2eVJoWFRqYkJxcHBaT0NEdXlB?=
 =?utf-8?B?TUlpZzlDR3lyU2Z0V0JWYlFpOXZWR0VTQktXTTRZcHZRUG5va3BKMWxuNUNo?=
 =?utf-8?B?cjFuV0RRUW5lWVVqNll4aTRpRk9peDF5NDNhTUxGRTFaVkdYWW1lMFJkZUwz?=
 =?utf-8?B?c1pJbHVuZ2hFdUxiVnNQOXpMcTdPT1A3alk4MWoxcCtucHpPNXBKM1JESjNp?=
 =?utf-8?B?RDVYdnNmM1Zsc1Qza2ZtYng3U2RBOElrZlpTQlRiZlJHQUJWbloyZjlnZmlj?=
 =?utf-8?B?WXk1TjZTUXVrTEcyVEhrQ3h0WjJpM3hNQzhKb1BvanM3V1hXbThsTytwVnBW?=
 =?utf-8?B?VTFWTGs0UXJ0RnBGdmhwaXdsMVlXeFdMbUI3VUpXK3hSZlpmV0ZIeGorc01G?=
 =?utf-8?B?ckd1UkRmSndrRnU2d2NWbjJJeEZoc2VlM3lDV1dGTTREaExWcGpkTzFDL1hH?=
 =?utf-8?B?UHFBZVRyNkhGWU9nanNPOTdCdElUUkFYOS96TThHQkUrdG5XcFhaazIrWHlZ?=
 =?utf-8?B?RTZneTF3N29tZlRyMmI5aGhzN3c0aTZ1M0Q3YlpwQ0Fta1ZERUdRM1NXMy9i?=
 =?utf-8?B?V3VmNmZsd2RXOGNRcnlSYWFlUWFzS1E1ZGxISHMvcWxpTW43QzEzcjFxQWI2?=
 =?utf-8?B?eVF6d1RIWVMvYnBDTUNFU3BuZG03b3haOVpidThISjdBaGs2TVZRR2lBaWpS?=
 =?utf-8?B?bnU0aml2RGJieG9LeVorS0NmRmRiVjI5MzUzQnVFUzdRWHdyVXVhS1JHd1VF?=
 =?utf-8?B?V1pNcGdOQ3MvcmYxRDh3YXZRcGxEZytSMGwwWE0xaGhGeGw0dkZ4NW9jb01H?=
 =?utf-8?B?U3Znb1FJY2QrNmhNSkJHVWhNc0phSHdjN1grcmJxTWJiZWpQSm9QVUlxSE5U?=
 =?utf-8?B?TU8wVmM0ZlVhZkE5bUxtZWxjSWhSaGJRbnoxQTU3QXBNdCt4MmFvNVN0eVBJ?=
 =?utf-8?B?T01UY242WmZsOVNZMStDUzJ4TjlKWUJvT0Yxc3lIMUdCNzFWN1JSVVdZMmox?=
 =?utf-8?B?ZzQwUVl6a0IzOFV5eHc4MExjYjBiWWZKS0QvclZucUlvS1ovWTViUT09?=
X-Exchange-RoutingPolicyChecked: JPVZcD4FstMbVGbR0U4lsZi9yyZsrPZt9p2+4Xx5Dmy5g7TyaW5fA88lQe2IhjdpxD/5PulWiMIBnRREDtn3PF9BehvtbtXsdwP9ATC+UiC6eC9pbg7x4Dvu1mChlMrWjmeJpBIdlBFP2N4Xp/6X1iqU+NhsGTncu98mA6vQ/cWogNOouJQhF4JtWlMqo2mpdf93pggQ6fyYzNViidDz3xuTYIja+DTnYuDUKrDMifb2K5X4C1AA5aJ4RtS2BR9iCoWVEi+mZpoW8ShAVgqEN7h+56xjH+z47mh6uVS+uE1Q+EJl6VygcT/iIrfgMCdwfOoP184eI3yPjxVYbg3zGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 780d47ae-4d37-4daf-f5dd-08de8ae2517f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 02:49:36.9509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sUQrAX1d+xoRI5jOXPNHHImCJlStjzdw0jk++p9CbgQpXnbTZjoMIfESejxRbFs9+PzEG35s+yzpUwgXUclekg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4661
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


On 26-03-2026 07:03, Matthew Brost wrote:
> On Mon, Mar 23, 2026 at 03:00:57PM +0530, Arvind Yadav wrote:
>> Don't allow new CPU mmaps to BOs marked DONTNEED or PURGED.
>> DONTNEED BOs can have their contents discarded at any time, making
>> CPU access undefined behavior. PURGED BOs have no backing store and
>> are permanently invalid.
>>
>> Return -EBUSY for DONTNEED BOs (temporary purgeable state) and
>> -EINVAL for purged BOs (permanent, no backing store).
>>
>> The mmap offset ioctl now checks the BO's purgeable state before
>> allowing userspace to establish a new CPU mapping. This prevents
>> the race where userspace gets a valid offset but the BO is purged
>> before actual faulting begins.
>>
>> Existing mmaps (established before DONTNEED) may still work until
>> pages are purged, at which point CPU faults fail with SIGBUS.
>>
>> v6:
>> - Split DONTNEED → -EBUSY and PURGED → -EINVAL for consistency
>>    with the rest of the series (Thomas, Matt)
>>
>> v7:
>>    - Move purgeable check from xe_gem_mmap_offset_ioctl() into a new
>>      xe_gem_object_mmap() callback that wraps drm_gem_ttm_mmap(). (Thomas)
>>    - Use an interruptible lock. (Thomas)
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 26 ++++++++++++++++++++++++--
>>   1 file changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index da18b43650e3..83a1d1ca6cc6 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -2165,10 +2165,32 @@ static const struct vm_operations_struct xe_gem_vm_ops = {
>>   	.access = xe_bo_vm_access,
>>   };
>>   
>> +static int xe_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>> +{
>> +	struct xe_bo *bo = gem_to_xe_bo(obj);
>> +	int err = 0;
>> +
>> +	/*
>> +	 * Reject mmap of purgeable BOs. DONTNEED BOs can be purged
>> +	 * at any time, making CPU access undefined behavior. Purged BOs have
>> +	 * no backing store and are permanently invalid.
>> +	 */
>> +	xe_bo_lock(bo, true);
> You need to check the return of xe_bo_lock if the 2nd argument is true
> as it can fail. On failure, kick the error code to the caller.


Noted,

>
>> +	if (xe_bo_madv_is_dontneed(bo))
>> +		err = -EBUSY;
>> +	else if (xe_bo_is_purged(bo))
>> +		err = -EINVAL;
>> +	xe_bo_unlock(bo);
>> +	if (err)
>> +		return err;
>> +
>> +	return drm_gem_ttm_mmap(obj, vma);
>> +}
>> +
>>   static const struct drm_gem_object_funcs xe_gem_object_funcs = {
>>   	.free = xe_gem_object_free,
>>   	.close = xe_gem_object_close,
>> -	.mmap = drm_gem_ttm_mmap,
>> +	.mmap = xe_gem_object_mmap,
>>   	.export = xe_gem_prime_export,
>>   	.vm_ops = &xe_gem_vm_ops,
>>   };
>> @@ -3427,8 +3449,8 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>>   
>>   	/* The mmap offset was set up at BO allocation time. */
>>   	args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
>> +	drm_gem_object_put(gem_obj);
>>   
>> -	xe_bo_put(gem_to_xe_bo(gem_obj));
> Look unrelated.


Yes, I will revert back this changes.

Thanks,
Arvind

> Matt
>
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.43.0
>>
