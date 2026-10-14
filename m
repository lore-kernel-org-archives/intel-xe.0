Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E35CC6B2C
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 20:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C75110E2D1;
	Wed, 14 Oct 2026 20:01:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3972D10E2D1
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 20:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792008070; x=1823544070;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HYKdD8uQmrOhm224ye+AxUI6FWTygvi88zBOR0PnANc=;
 b=NKZ2h+hbG2uIsjsjU2pewviIEycTQCMQW0GYGjK410wzj6EhcXabVkg+
 KVmX0RTiIXEzyVy7G4rISH3tTVNg2725u73yOlLOrBUCoHAXOjsvO7qj0
 b46hiSAU0AD7vAVG5fRfy3P42+G2FW0qH1I+N+WTImj/LmPwTNyLg6msC
 WvLsns4fpEH1HuHNqW/AsxZnup3AYRFsfrWuhz8cFsb/mHeVPX+8xVWUa
 rIyrt7hJ03FOgVCM6yoUJhitq9uM/WK264abrgIfHRf2+nk8UI4Uci2QF
 lDW8gpcJsak/asecdAlLHrQIltNEOfdtOxDsLSwwCGkivxv8SR+OBaNf6 A==;
X-CSE-ConnectionGUID: GOYX6aNTR7GQXj7YzJZ+sw==
X-CSE-MsgGUID: 1u+8tkVyQ6ynX4E96PotuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="650568"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="650568"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 13:01:09 -0700
X-CSE-ConnectionGUID: NZusStylSWWyR3leZHY7gw==
X-CSE-MsgGUID: 07mRV7xHSKSaXhWkJx1/yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="3261112"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 13:01:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 13:01:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 13:01:09 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 13:01:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftxJRpcp/TfpzihKZU5PL5ygfckZfgnTg+gMvNzhVioZ8KSQqNIfHuuet9CjhcZsNVTtzLjpNaWeKPy1SNJqHWZu2QG5k2Mt+Q4GOYXQbZOaG4zHuIbGe2AsFVqS9e6uYJHNijGW50sj3sBEp7POd+T7VhJZBrsIHDQkvlu1ZqqDNJ25QnhfCYe5O6S3nKdT96929G1zJR8zAYZbs+c6eIomJNoNJO2rIgNdEn9lTdKyvKiRnF1AAdgfXE3JvYEUC5Is8i0H3335kipYFLjdN0StWCc63+w15RGDDzbD00dh+eZxEzulpLlqtC1oKp9fhQ12ql/MOQwYAS0YuzjK0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMm4iHctB4M5orvJw8mmDcbmLSvAXw/ZFK6nU1z6fk0=;
 b=ABrrD0FrCojbEQqyTAia7cVttIXw5UBk/GN2tIs9Vd+e9ubMfW6d7xGHWmm6PHTVcHUF3wcbQXHOAuZrWAM2HEz1Ok+6Kenwrb4B+70FmYONqLxN7NhcJfndPnTcq1L0EXK/SiAfFpKvVkLByg6Hko//JyZIUWm4vFH6mSFCFLib3AUHxtZjWQLxmssuG67oMTzWvbzLDc80VdxnF60aSpdus1aKi0FSJpDDh/nfZ9amV8aSvvetGyMjoiHVHirm0PNOpGRBqjLa6Yz3ik8VLy8RN56PnUMNJJfu6U7owIRYVzU5woej/hVSfPgwbI8Xp6SVh435SSuQAOX7xEFUYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by LVUPR11MB9591.namprd11.prod.outlook.com (2603:10b6:408:3a2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 20:01:03 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%7]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 20:01:02 +0000
Message-ID: <ad5b0905-8786-4217-947b-15cfcda0d96f@intel.com>
Date: Wed, 14 Oct 2026 13:01:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] drm/xe/guc: Make ct_dead_capture available on
 non-debug config
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <aravind.iddamsetty@intel.com>, <mallesh.koujalagi@intel.com>,
 <alan.previn.teres.alexis@intel.com>, <julia.filipchuk@intel.com>,
 <michal.wajdeczko@intel.com>
References: <20261012232907.83649-9-umesh.nerlige.ramappa@intel.com>
 <20261012232907.83649-12-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20261012232907.83649-12-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|LVUPR11MB9591:EE_
X-MS-Office365-Filtering-Correlation-Id: 10452e9e-ea6c-44c6-ac29-08df2a2ddfb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10086099003|22082099003|18002099003|18092099006|10067099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: tsVzfcAqFp4qbGP5xxF150N7aX15i5aSdJso+ou4HOH1t1iPgL9r0na9xqHe3P19BF39EEJ69QARBOiHhll77i5NrxnXFe3D1ScQrT/CkeNSiHYePdYt+TfmJn9XZOLR6l5/GNtzWGG6NM8vMXv9QhX+6KPGNi8mDakKHMzuZXSUWLHfSmoLU13WgBVoMbcpFCN+NMML+/SqQNpWMf748QleFTFMT6ypIOb4E6dWR8yGWFbhNDBdlKaDAf0K8z5BoEpLQLvXOHrf5sdjGwU0l4wRLDX9pYzCUjYKpgGDEXGM1QjNQ0MZwWHTYv0Z+JnlYno9eJtYbhs5G8JtAkGukqIlF1xuxO8JxsphjlxbDEBTVqUaP0uvz+gW6OMtoha05MtGkjUb89gaCCnpmpfkZ7B7GBk7w3n3IbCM7ZJXepu4n2h/aAYYhN4/nJTVYaP1B1+nTtZzToIpa1tVJZovsA8nIxAXTBxyjOPLLa9gw83f8I2USZNnV/svDHnemBfkmu5WaA/zOrOU51MKBbjKOFk6p6MjsnL5I/4nrdn0eZb98h1hsnIml9rzfsvH0FIPWWc3Lu9PsHp+k/h+92Kda1x8dbiwiYyznZtuxK/AdGmOmMdBn6WGqPmj2TpmMAShfw//aHPmC8i5Q4kGPbo9VNQcJfpw9Zn6mCiNyn4Jr94=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10086099003)(22082099003)(18002099003)(18092099006)(10067099003)(11063799006)(4143699003)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2RxMVU2VGlxNUtXYmNkQmlYcHJZTWJNN0VsVW12YlVHeDMyblZ0YTdUQmor?=
 =?utf-8?B?Wks1VUJ2NFk5V2FuN1JuZ2YzVmczc0YzbEJkc1ZCNTdJZFYxN0VmemlVdThm?=
 =?utf-8?B?bDJwSjZ3TW43QnZTWFBIMjRuWGJmc29GcjJ3TmJHYkRadElyQ3lZZ2RyZ0lx?=
 =?utf-8?B?bUhiZ1l2Y1g5YWgwUTc0QkhQTHh0U2V3czRZWFB2YXhnT29MN0lLLzRtOURU?=
 =?utf-8?B?L1FFZ1d2aWl4OXlmaldRYWdmSjhuRUJGVjNtZ09nWjR2THFDdmsrbFFWWkZO?=
 =?utf-8?B?ajBxTEJGODVKaDZTSHJ5a2llQk1UMkdydnBFb3lvQU1GamQ1L1BGSlZGcWhp?=
 =?utf-8?B?WUJ0b3ZOcG1OR2t4Uk80a0RVYWlrWHNZNXhxVTVhMGZ4QjdBNmtkYmJuTUhp?=
 =?utf-8?B?bDdJWE5iNkFMaEJIa0lmaytmZys0VXpuZ1NDN1RZRFlJbmV6RVVHOE1pRm1Q?=
 =?utf-8?B?NThjVGs2Z2lDSzZkMk91cjArNVZrUnltK0tDVGpuQmhQZmZZNC81L0JDQnF3?=
 =?utf-8?B?aTl3ZzZoR2sza1FMK0d2c1ZMRldGMGtyeFBuVFh5VzMyYWFWY3pxV3ZkNklC?=
 =?utf-8?B?ZUVWak9MYjdFRVprY0pSeVRRTnA1ZHdONnlWMHc2VWxKT1ZZVVhoQXNiVTFL?=
 =?utf-8?B?dVBJeXRLdmVhaDNMQW94cnZBSDZUSkJHcDJmVktSa1FYMTlnTEc2TEZZODZr?=
 =?utf-8?B?OTlISWR4bE5KRkRuVENuUEgwcjZ2b0UwRnAyWWFjN3N4U2VkVU05UWFZT1FL?=
 =?utf-8?B?Ky8xbVFieTVYZkJ1R0tsa2dGT0M4eU5YMExlUThkWjFjdHBHR2pOZ1hFLzNi?=
 =?utf-8?B?RFZKYzFtemFiaEVPdXJDbi82cytLeWxvU0lHWUNBNVRwMnFMS0xCY2Z4VWR1?=
 =?utf-8?B?WUhFR2lCUWQ4QkwyTk95UzI4OFJyeWxONTBSVHRldk5MTWtITWphRjVyYXA3?=
 =?utf-8?B?a1NHN3pNV2YvUFpkeGlTU1FqdEh5c0kyM3dQN3VMVkk2V0FlQVVVdWUzRVk1?=
 =?utf-8?B?WGo4L3ZNaHEyVjQyNWJsYnp4OGVKTk11Y1VOWEQzQlZHbkhnZ2ZXbVcwYWxh?=
 =?utf-8?B?MHpISTRoVVNUb242ekZxUjVDQ3JGZElmcnZqbEIrcjNJcHBwWm0rWHhCcGN3?=
 =?utf-8?B?S0dmMXlFZHdldkgvdG9oWnhyUTlIejBFVEZ2dW5abU9TRnpXc0drRXdDQTV5?=
 =?utf-8?B?Mjh3QUgxQWR1Y1lsS3JzVWpPbmRJL2l6bG0zeU93QUw0b1VJTm1SNDRXU0hJ?=
 =?utf-8?B?R3RXUUF5RVVKUUQ0NFQxTk1xTVRjR0huUEtTRkRNdnY2MVFwVXJHTnhiWVBW?=
 =?utf-8?B?WXlXaW9hL0dYemRMdHdoQ2liL3d4bWpGeG1PalFzUzMrT2xIMWlKV0ZiaDZi?=
 =?utf-8?B?SWY2ZFkrSzZqLzNTbWR6MGdtajdmRkhjZGNKQWlmOVVzVEprU2FTMUNidFM5?=
 =?utf-8?B?T3A1Sys3dUQvOHR5T1ZqYWVIWmh1dy9LNkFPQ3QzSmovVk5LYnp1enZxcm9W?=
 =?utf-8?B?b2xFb2VIMTZsVGVFWWZmVDRIQmZib1NPVysyNkJHQXNFSEs4d1NyTU9vay9O?=
 =?utf-8?B?WWU5V2RwRGhmMVNQZGs3N0tESUo2VTFUeWozL2I1RWgzNE9KOXBlNG50enpN?=
 =?utf-8?B?YXJDSVFkVURGOW9ZVnFqWEVVbUFuZCtxYnBMaC9EcDZzL2ZLYUVzYURzQVJX?=
 =?utf-8?B?QU5vSklBd0tPU1JkQ0RtVG9CNW1TK0hFYVpYeVlBZnduajhPUFFuWm9xYkJw?=
 =?utf-8?B?RUZxMVY1T1VkM2pxYXNmb3hVcnMrZDEzdGhCY1JPNXNGNGxNajRQZllBK1Zx?=
 =?utf-8?B?T0YyQTdnU21MY2M1YzVIL1RueVhZWmFlZEdRdC8rUmxzVFlRa1JYdWhKbGU3?=
 =?utf-8?B?L0h0eERXd0xSRDdCeEhtRithR3BSN3pJZkZ3c0o3bnBmNjROb2piWlZFUGZo?=
 =?utf-8?B?SWM3YzNKZGp4M2tsdXVCRHBtbWQvVUNhWUNoMDk5NlJ0a0JNNitXWS9aWXVE?=
 =?utf-8?B?Z3hUZG5lN2d5Z3RzdTJjN0ZoU04wckdVMWNYdUFobEJHc0FQQkxJamwveFFG?=
 =?utf-8?B?V3pFRlRRSEljeHV4SFROaXJhK05HRFEyTDQ4WDN1T1NUYW5BckVnN2hUVEtQ?=
 =?utf-8?B?OHRHclZZVmhYTEc1cmJSL3FDRmRqMmNOeGFSRFlDZ0tXVmdtMlNQNnI4aXdB?=
 =?utf-8?B?bEFnZ25wTVR0UU5KNGVRcjVJK1V4WlY4eGFScWpqa2M1VHRNbTVQQ0Nzalpu?=
 =?utf-8?B?NVpHWFBIMTl6UUxHVmNFUmM2SlVQRCtwR0hkTEZqaE9TSGllbzV1TktUcXc4?=
 =?utf-8?B?dVd3djFPOFFadVBSYnBQeFptVEFZRVROaFVnRDdockcwcndaeEtYWHhGUVN2?=
 =?utf-8?Q?oertnCidTrsZSwFg=3D?=
X-Exchange-RoutingPolicyChecked: hujTy1StfpFGtHMykKNUaPd29KtmV+aGCzsKyAGWJzQvo8fPI4/4gVsiRFwOyxgIM3rTnF0ajKCilYL65wk/FK8KwGO7AF//5epytmS6sE2AH5IIsYU7r6ze6T/o8iOj63SE/YmdwzYdqRfG+2TVnjE3A3roeT6NSgBzEBJaWceP9Vk9/Vp9Q1nksVE+p/de5/QiozrRWOus+02f60wwH+BwBCXJ4dhgvd+ObZBy+RGNy6I/5Ux5wl4yeORZeRrPx/uTaXoOQMQ07yQTLKB28sR/MdP6WseqyA5sm5KCKK8mBEv6cW/2e/XodB/GJs/N0h0uqhee+NhYCnRQhdOxHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 10452e9e-ea6c-44c6-ac29-08df2a2ddfb5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 20:01:02.8599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xC0AwtG9YYzHWOHWJoDK87aaFs4kcOBp44Ly2p4IFvyDc1m7VRckcffPVJO50o78KIHvyZBFMWywS9LxP8scEWUw9+IWETw91LczQOjgQmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9591
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



On 10/12/2026 4:29 PM, Umesh Nerlige Ramappa wrote:
> Define ct_dead_capture for non-debug as well to simplify future
> refactor. Rename it to process_ct_dead since non-debug mode does not
> capture anything.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
> v2: (Daniele)
> - Reorder defines
> - s/ct_id/ct_error_id/
> - s/ct_dead_capture/process_ct_dead/
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 25 ++++++++++++-------------
>   1 file changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 7c2a45fe8ad2..a00b5e761e96 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -59,7 +59,6 @@ static struct xe_device *ct_to_xe(struct xe_guc_ct *ct)
>   	return gt_to_xe(ct_to_gt(ct));
>   }
>   
> -#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>   enum {
>   	/* Internal states, not error conditions */
>   	CT_DEAD_STATE_REARM,			/* 0x0001 */
> @@ -82,8 +81,12 @@ enum {
>   	CT_DEAD_CRASH,				/* 0x8000 */
>   };
>   
> +#define ct_error_id(reason_code)  CT_DEAD_##reason_code
> +static void process_ct_dead(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code);
> +#define CT_DEAD(ct, ctb, reason_code)	process_ct_dead((ct), (ctb), ct_error_id(reason_code))
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>   static void ct_dead_worker_func(struct work_struct *w);
> -static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code);
>   
>   static void ct_dead_fini(struct xe_guc_ct *ct)
>   {
> @@ -162,9 +165,6 @@ static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action)
>   	ct->fast_req[slot].fence = fence;
>   	ct->fast_req[slot].action = action;
>   }
> -
> -#define CT_DEAD(ct, ctb, reason_code)	ct_dead_capture((ct), (ctb), CT_DEAD_##reason_code)
> -
>   #else
>   
>   static void ct_dead_fini(struct xe_guc_ct *ct) { }
> @@ -173,13 +173,6 @@ static void ct_dead_init(struct xe_guc_ct *ct) { }
>   static void fast_req_report(struct xe_guc_ct *ct, u16 fence) { }
>   static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action) { }
>   
> -#define CT_DEAD(ct, ctb, reason)			\
> -	do {						\
> -		struct guc_ctb *_ctb = (ctb);		\
> -		if (_ctb)				\
> -			_ctb->info.broken = true;	\
> -	} while (0)
> -
>   #endif
>   
>   /* Used when a CT send wants to block and / or receive data */
> @@ -2280,7 +2273,7 @@ ALLOW_ERROR_INJECTION(xe_is_injection_active, ERRNO);
>   int xe_is_injection_active(void) { return 0; }
>   #endif
>   
> -static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
> +static void process_ct_dead(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
>   {
>   	struct xe_guc_log_snapshot *snapshot_log;
>   	struct xe_guc_ct_snapshot *snapshot_ct;
> @@ -2387,4 +2380,10 @@ static void ct_dead_worker_func(struct work_struct *w)
>   
>   	spin_unlock_irq(&ct->dead.lock);
>   }
> +#else
> +static void process_ct_dead(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
> +{
> +	if (ctb)
> +		ctb->info.broken = true;
> +}
>   #endif

