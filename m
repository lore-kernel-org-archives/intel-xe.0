Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCE5C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 04:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27ED210E9BB;
	Fri,  8 Dec 2023 04:22:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2005310E9BB
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 04:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702009353; x=1733545353;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5J75ewBrOFDqV3XpMDPBa1kO1DraGDuc0zhWp5s/MGw=;
 b=h0whuSutbJO/Cli5ls0Pc+fp26X2WR5hjFZ+bq39F8ktKFDqsPJoem0f
 gqmU8m7BvXQfYI9sJ1CWi1aQMgt4yXmc8xN5jMvSFqoxiCsOVIRo6wtuU
 N7JGai/2RlcFnsfrOcv9gCYGkxZZdV2td+JBqQwAoT1vXaCrjDg8S03sX
 rV+At1iRXBe5qxC6C3k8zQErK9v2zJkCQxU/r5cfcON1nSEzOvm0N0TbO
 eAbz7fU+rfFuKXKopnIAewZzXatG29S2ovpxO0Dz2/laXIPEblhzIX0FB
 0yBseGoi82U0llX2N+WBmJxavnfiOT1QMqxeohax1ponA4ssJsX0Ah91J g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="394094962"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="394094962"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 20:22:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1019209176"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="1019209176"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 20:22:32 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 20:22:32 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 20:22:31 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 20:22:31 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 20:22:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJ/TkSB+2ps2vUznyqxOMR1EmiJYfauNs0LT29qgNTy49VdVhImbAk5t7c2nNJrCKJQAzz/6/hbAUIPrpQjrIJuUHylOBPm3qHP/RYgWt9rGFVxu5T9yxvHB48rMT2lujJDNaBkD5RqLc19l3R78aomWGE75tvmS5KnB8DwEBkeL/KCM7nAgtuTaOAP5sfQvZwY6RDkBW5U1ygnbJZ5t8cRU+SmbB1mWveKw8WEjcSXMpcNPDYfKIlg4HE/8gveqLk4v3pXH8bnl89cZBfyCfOqClNBeXm4VshtLoWhXJEIz2cLVqPjrOiWPgi6f3nMbeX9Mam7nZ5amhz0s+IJv2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhQXgpGoySF4aHRPTVqg/irOrOOAf2ymFe84c3wPifU=;
 b=aq+ei7l16EhK3dkOt6FkDs+z3FzXQVRuSYl+vL8/9rNIAY68zXlECS4PF7DrbwUWgdfpanjBHHiEeqEN7ce3pYtRdmOboSaJS0l0rDaWMcYad4P7MA/2MCkczXAP62RARRl6GNYyEth3L1GeRWuX3NBvt8cXENp8XRajWbrPH0F2cW1nHIsJANuZnI72CdRDfwkus6+W1GB9sTBm9bqrg8f3ZVmq+3ilpASTykS+va4SlRt3s8x66tcXYKx9Xf0CX1/XTqK9RiH5wLEYQcvni8BQTA0CbqBJUwo2OrHURU4rszas4jWmuT+XcNix7ynJpsN9o2VB4dAiEg2ua8EPKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS7PR11MB7952.namprd11.prod.outlook.com (2603:10b6:8:eb::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.27; Fri, 8 Dec 2023 04:22:29 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c%4]) with mapi id 15.20.7025.022; Fri, 8 Dec 2023
 04:22:29 +0000
Message-ID: <988eb0a4-0808-4e3b-812f-9ebd4b413258@intel.com>
Date: Fri, 8 Dec 2023 09:52:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-xe] [PATCH v4 5/9] drm/xe/xe2: Update chunk size for each
 iteration of ccs copy
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
 <20231206043126.984049-6-himal.prasad.ghimiray@intel.com>
 <20231207000146.GT1327160@mdroper-desk1.amr.corp.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231207000146.GT1327160@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0234.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::6) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS7PR11MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c405166-fddd-4974-74ee-08dbf7a54a74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PvznW8w34UqC7uXRpNSlJFQO5mdv6zOrpRFW+HuMbkPc4dTk1FtxdHFXdMpJIT1x+HFl7HhtTI5VBN6ILmmyQlGmLsiPbnyQO+uDxFv21iAa61ZK0oJNKfznfEMNB02jCGuxVv9aM0MMvgRIgJO58Ts7l/MilJIEmjEakQr4jvZV0Zp/hCMBxXSEUD2WQZADUVfbJq0WdIjvo8tEsAN7pBhgfkw9Rfl78FVkvPID1Em7kjex5DMTkjT7WfVk/VaBPyUNhVJkySZfS8zWvgqWcXs/TBXrbEf0owR7U5B0tRUrt8kMDuVU+iQ8TxYBwOb89djyt/N8NMJ2lBvmFPCHrZSjZTg3k2u+WwAXVooaIB6ZwiVN/p7flsz+g6YEAUc7pPMJPwaF/lWZ11FVUp1V20u0MhZIyS452kkUjxhyBYl3TQXe1XCaRoWNHcDz/alGd3CZQXByLQ8+u3vmctP9Pizqvc9Qq+5pwqrxZ/nUA4AhtLijOF/8NQjS4ADdIvnrllnElXREfkF1VO+bbE9XEoeRn6PfPnDO8Vj0YLQ2M9yYznBxMMLtDWT4TnrF/Oc/DjWIVdnixKrVKfNL1WDAYapq175qJMrN8ApDiXsZUDDmCCP0mCIFv84+bS24RpiXDCWZ5P9oR5mmgtLsylJegQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(39860400002)(376002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(31686004)(6666004)(6506007)(478600001)(82960400001)(38100700002)(6512007)(66574015)(26005)(83380400001)(2616005)(53546011)(15650500001)(5660300002)(8936002)(2906002)(8676002)(6862004)(86362001)(41300700001)(4326008)(36756003)(31696002)(6636002)(66476007)(66946007)(37006003)(66556008)(316002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0NlMjhwalR3RHh2dDI5QVhGN0ozQlM1RTg3MnVzTVNKRDYvUnFWZ1BlZ2cx?=
 =?utf-8?B?ekxBOVVhbkdDU2tXVXc5Z3dTYm9Ed3FVODlxOGRiTVI4NmdsUDdLdWgxVjk4?=
 =?utf-8?B?VEdMbndma1liNFJaK05GUkFFeHRVNzFDeUJlMmRKWUhHaGxwMWIwMDg0NWNs?=
 =?utf-8?B?eTYvd3VLNmtlSmpqWHRSNGlibWc2YjRLSVl1UVlYU1VPT2hMaGJMVklyTkJU?=
 =?utf-8?B?STlNelpJZDB4M0tzemJrTExLNlpONzJSRCt1OFFaNmU3ZWdiWmR1cFRBMXFm?=
 =?utf-8?B?VGp2STV3TVd2Rk1SRTd0THdqcmlMcFFkYndyRVZBWlNTLzJFN3BSeFZyZ1FF?=
 =?utf-8?B?VWxVMDJkNnk2NGpqbVlUM1I1RktTTWJ5c1I4elVEM3dtK3h1Mms5UEdpSW9O?=
 =?utf-8?B?ZzZIb1YydXBSU3dMZnZCblI0eDhqeE9rT21xQ21PSjl4aE5QZ2YzU3dBajI0?=
 =?utf-8?B?RExBVUsya0ZGYlRUR2NnR1Z4RTYrbXp5NUs4VS8wT042NFRLUHkrNVhiZjdT?=
 =?utf-8?B?ZC9sQXJhY21oREx4YktCaHBja3Y0dXZzc1hyZVpYYXBkdDE4cDBJOVdXU2Fu?=
 =?utf-8?B?SVBjWWx3TWxza0NrcjVkdEFhblQxaTZZOFNOL0NIWEJMZGZBdFZaRlBmeDJs?=
 =?utf-8?B?NDlzUTNnVFVzdCtlVkZ3VkNMcis3SGdqMFNQWUdFSjUycVI3ZHZmc2tCaWFF?=
 =?utf-8?B?TVVEQk0zaXpGZnBDcFNvV2F6Y0ZacEVHRnpLZXhVS3RKK2NnbUpQVnJKTGFE?=
 =?utf-8?B?dVFhQTA0WG9GeUVUN0lGcEg5S05wMHR0NHFVNlVPbkx2anRzdGFicTNnYXFB?=
 =?utf-8?B?S1RsdWdtam00OWs2TkN5RCtLQkZxZFlPRE5aWkNuVFB5MHBqUis3YnZvVXYr?=
 =?utf-8?B?Rkk0VEVxeVNjTENVSXU0RUNzSHlGK1oxbWtuN3ZiWVMzNW9PSlRla3grMExm?=
 =?utf-8?B?V3N3blhla1o3RFhzbXhTN3JhUS9CK2FBNVR6aThmci9nRmg2NXFRNkh3anFP?=
 =?utf-8?B?K2VCTzJhSm9GYmFrWXdhYzdRdjZXbVNLR3NCZ3BCTk9CY3E1cmg3MjFEb3R5?=
 =?utf-8?B?WHR0Q0w0RmoxeTkxajZaTnBGekdKazNkd0JPNng5WEo4V0hsT2lvYVZBbHNs?=
 =?utf-8?B?elVWdnNDMG9KdW9jZWpKUjJGVmZHWGJmcjRaajgyQWV4bVllaGdqR3l6SmFD?=
 =?utf-8?B?cWZPQU5RSGdBUS9reEJwWkRvVjV3OW5xWnBEa1NYVVhtNG5qOXNEOUlyNjBT?=
 =?utf-8?B?c012UUJPc0xkWklWWFpjelM0WGd4eXo3aHhCWjNBRktkYWlzV1ZJSkFaZzNB?=
 =?utf-8?B?aSswTTBGbGhsVGczbXpCK2RUNVdRYkRWcjVYQ0hUT1NLbDI5dW5VOElyZEhO?=
 =?utf-8?B?K0FENGtyUGl5V1JRYWVTc2hNeGNNcnNCcHdGK2xsQ2N2azEyUkx4NjRMK1dT?=
 =?utf-8?B?YUJ2Vm1KaDN0Zkl1SWpMRW1QRE84SjlsVGhCMWVRQkpSRVNhN3J6QTc5aDcr?=
 =?utf-8?B?cUppZlhjbnhiM3lQQXZVWnBkK21IVS9hdXl5RUxycVcvTWZiNUZOelN1SUJu?=
 =?utf-8?B?eFBFSlNGTHI5ckR2bDdGaTN3VGt3Vlhya0txMVZnQ2E4ZlZnRUM5SVcxM0ZB?=
 =?utf-8?B?MTNJZUlSVTFpTy9EOHplUVN3Vk5jSmNvUTJDQlkyci9nb0o1MFMzS3FpeHlG?=
 =?utf-8?B?Ym5YRlVOenBGajBWcHQ0OTJIMXdoWlp5ai9XcFRRZnFtcDNHUzBDR3dLdnI1?=
 =?utf-8?B?Q1Z6cVVTRUIxeDdERXhMZ2t3VXA0emtRcTd0bStvR0V2ZkJBTUQySURRdEVq?=
 =?utf-8?B?aUw3TGpIaTIrVlF5TjFvenZqOEc1WjZWaCt5QStjKy9PRGZOWFRLNTdhUlI3?=
 =?utf-8?B?am5Dc3h5MzNKTjdQT1dpNzM0enExT0JUeHo0WllOcHVwZmxZQlIzcy90OE5S?=
 =?utf-8?B?S3NGci9nOWJvSzZXaExMS0lPSUxGSWk5WkhMNGtXeUpnSHFRa2ExTkY4bFNk?=
 =?utf-8?B?K1lScURoVkR5VWw2MnpJZ0EyQldnalVyUHdJazdUZ2FIK3JqUkRHd2t2ZzBP?=
 =?utf-8?B?WGJheWo4WnRONW9URy94aWNBYVhGK0l3RDkzRnZGb2FzalJlK2RtNlpPTE1S?=
 =?utf-8?B?SlJibkllWmllU1VRV1BaL2Y3OEZSYXBYM2JiTTdldS9uQlhNQk1GdUx5d3Ns?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c405166-fddd-4974-74ee-08dbf7a54a74
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 04:22:29.7048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gqky5kL2AcSjDS4gyV4j9Jim7bmJeML3TLRt5evJoNdcNvGYFWohxcN0LZK6pw7XRHG9Virrw3X8+WmRKmaDBzm8LWYH2wJEsiGoCtV/PKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7952
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 07-12-2023 05:31, Matt Roper wrote:
> On Wed, Dec 06, 2023 at 10:01:22AM +0530, Himal Prasad Ghimiray wrote:
>> In xe2 platform XY_CTRL_SURF_COPY_BLT can handle ccs copy for
>> max of 1024 main surface pages.
>>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_migrate.c | 34 ++++++++++++++++++++++++++++-----
>>   1 file changed, 29 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index b4dd1b6d78f0..98dca906a023 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -672,11 +672,24 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>>   		u32 update_idx;
>>   		u64 ccs_ofs, ccs_size;
>>   		u32 ccs_pt;
>> +
>>   		bool usm = xe->info.supports_usm;
>> +		u32 avail_pts = NUM_PT_PER_BLIT;
>>   
>>   		src_L0 = xe_migrate_res_sizes(&src_it);
>>   		dst_L0 = xe_migrate_res_sizes(&dst_it);
>>   
>> +		/* In IGFX the XY_CTRL_SURF_COPY_BLT can handle max of 1024
>> +		 * pages. Hence limit the processing size to SZ_4M per
>> +		 * iteration.
>> +		 */
>> +		if (!IS_DGFX(xe) && GRAPHICS_VER(xe) >= 20) {
> Where is the igpu limitation coming from?  The change to expressing copy
> size in terms of pages seems to be a general Xe2 IP change that we'd
> expect all future platforms, both igpu and dgpu to follow.

I added the limitation considering dgfx can have 64 K pages. And then 
limiting size should be decided by

xe_migrate_res_sizes. Will try to make this change more generic in next version.

>
>
>> +			src_L0 = min_t(u64, src_L0, SZ_4M);
>> +			dst_L0 = min_t(u64, dst_L0, SZ_4M);
>> +
>> +			avail_pts = SZ_4M / SZ_2M;
> What does the SZ_2M here represent?  It's not super obvious.
>
> Also, even though you have a comment above, it still might be nicer to
> "show the work" for SZ_4M instead of using a magic number.  E.g.,
>
>          XE_PAGE_SIZE * (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) / ...
>
>
> Matt
>
>> +		}
>> +
>>   		drm_dbg(&xe->drm, "Pass %u, sizes: %llu & %llu\n",
>>   			pass++, src_L0, dst_L0);
>>   
>> @@ -684,18 +697,18 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>>   
>>   		batch_size += pte_update_size(m, src_is_vram, src, &src_it, &src_L0,
>>   					      &src_L0_ofs, &src_L0_pt, 0, 0,
>> -					      NUM_PT_PER_BLIT);
>> +					      avail_pts);
>>   
>>   		batch_size += pte_update_size(m, dst_is_vram, dst, &dst_it, &src_L0,
>>   					      &dst_L0_ofs, &dst_L0_pt, 0,
>> -					      NUM_PT_PER_BLIT, NUM_PT_PER_BLIT);
>> +					      avail_pts, avail_pts);
>>   
>>   		if (copy_system_ccs) {
>>   			ccs_size = xe_device_ccs_bytes(xe, src_L0);
>>   			batch_size += pte_update_size(m, false, NULL, &ccs_it, &ccs_size,
>>   						      &ccs_ofs, &ccs_pt, 0,
>> -						      2 * NUM_PT_PER_BLIT,
>> -						      NUM_PT_PER_BLIT);
>> +						      2 * avail_pts,
>> +						      avail_pts);
>>   		}
>>   
>>   		/* Add copy commands size here */
>> @@ -923,8 +936,19 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>   		struct xe_bb *bb;
>>   		u32 batch_size, update_idx;
>>   		bool usm = xe->info.supports_usm;
>> +		u32 avail_pts = NUM_PT_PER_BLIT;
>>   
>>   		clear_L0 = xe_migrate_res_sizes(&src_it);
>> +
>> +		/* In IGFX the XY_CTRL_SURF_COPY_BLT can handle max of 1024
>> +		 * pages. Hence limit the processing size to SZ_4M per
>> +		 * iteration.
>> +		 */
>> +		if (!IS_DGFX(xe) && GRAPHICS_VER(xe) >= 20) {
>> +			clear_L0 = min_t(u64, clear_L0, SZ_4M);
>> +			avail_pts = SZ_4M / SZ_2M;
>> +		}
>> +
>>   		drm_dbg(&xe->drm, "Pass %u, size: %llu\n", pass++, clear_L0);
>>   
>>   		/* Calculate final sizes and batch size.. */
>> @@ -932,7 +956,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>   			pte_update_size(m, clear_vram, src, &src_it,
>>   					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
>>   					emit_clear_cmd_len(gt), 0,
>> -					NUM_PT_PER_BLIT);
>> +					avail_pts);
>>   		if (xe_device_has_flat_ccs(xe) && clear_vram)
>>   			batch_size += EMIT_COPY_CCS_DW;
>>   
>> -- 
>> 2.25.1
>>
