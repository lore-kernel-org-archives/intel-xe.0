Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98ECFC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 05:06:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D7410E9D0;
	Fri,  8 Dec 2023 05:06:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C5810E9D0
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 05:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702011969; x=1733547969;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DM4eazefT3NkGKZFskN9wTcoTxCHTgHqYOlOBngRWS4=;
 b=aTbCvWhE0AVQPT9lrlb7D5nFAN+kjjRYeOQvlCU/vXvp3GnUWdZpoWdn
 sUpOKEqZTIMZMTjFYsLmXRO3epFDrrx2xJuUcIetKsltk7ZUU/4CJaryd
 6MiWTURPQ+2HLW/hXlk8fXhZw9qssjh/vtrGPeIcdABF4wkki66i2OW3m
 f7jncqAhyv3zfthG8ppI9oZdbelvFNID+aZM/udPRei7V9bwOHOAJXGrc
 Y0pOm87o0zHQ/5l8p1eRqM+OdmHRCql96aVCk/w5oCQ9pje+mirtdAhDa
 5sgUdh7afXfCUHQHOfpT0GSANmnAYs/+RerfOSN8sCNGdbWEUM0+s6bmY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="393226592"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="393226592"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 21:06:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="19961221"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 21:06:09 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 21:06:08 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 21:06:08 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 21:06:08 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 21:06:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1PAnkGkzGFIsr+wNPEQ0IGfZm9X+r1KZ3Sfo12hQJMQIrUcpDwVfPJxZ5fCAMZ5Kn89rdKcHrB/hsfYyFjWYCRl0N2QoqPJ/WvC4O4g6Tx3CrW/zd51GJNmqNtvp9vohuz8vfF+Z9ptBYxuYZdt4Qzm8cWttHnapYkeDVhFt9d2U9qp7v8GzIILlh0v1k3xps0/MViUYuPJ5Zch8z+cRURuL9VLpyq342byzwEj2nuFWyCMGazJdxtt5DhYTW2Vcpg6v5B/2sa9t6SAnaQxRlbxfIXhtpihbb3Bf64B6I8E5NVZCPLkXv1GM55QVoEFPoS0fL304fq2qooQbKSY4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrAWDo9Mf8Ap+UqlnBfgnVQSAloMvQpwprVcBAQNZiM=;
 b=jjACenCjq4np962M9V18Y3NbscwrKEd9y9lRMU7wqSwMGh+cNj0ICEjnAo7AC8aIBYRPuAQMIzLhK+/YagesehndnZFtrbSwdpZhHo6IjOfmPmop81kOwfaL78SRLmesUhRY9cl7xfD8sivaEFD87+Uke4Qv8pqaTORvU48ggcDc2XoeDH38A5VRr+G1KxeBk5hR9sBPySANBlvp+Gkxw1e84207gje+1efOXpC1/cmsNp5SXnK10k2N/l54DZtuyeEcJVJ3S8fXHuRL8OX+5vEfoa1QUrJsObBPYRYy6H+YNE/KTs7t5vNkO/bOy2KOlKedN+MDj6Kwtd6QzWa66Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB8705.namprd11.prod.outlook.com (2603:10b6:610:1cc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 05:06:06 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c%4]) with mapi id 15.20.7025.022; Fri, 8 Dec 2023
 05:06:06 +0000
Message-ID: <2d4e34eb-075c-458f-87ea-02d6c569105d@intel.com>
Date: Fri, 8 Dec 2023 10:36:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] drm/xe/xe2: Update emit_pte to use compression
 enabled PAT index
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231207091922.1224800-1-himal.prasad.ghimiray@intel.com>
 <20231207091922.1224800-7-himal.prasad.ghimiray@intel.com>
 <ea7ef5d1-c1bc-caac-6106-ab7a5b66d97f@linux.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ea7ef5d1-c1bc-caac-6106-ab7a5b66d97f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0219.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::13) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: 82197f6f-c507-43bc-3b63-08dbf7ab61fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5WTfEOp5jmuyZ9lFaQk9nSR8A00RYPVqIQQXlyOu8HjakaZPqBwqQpL6z+Xd1kA2xqeObp5ePN6LyIZnO5yMfCvN7zxcOeNzgsXwGHPsdfb5RPRjJC0E+rAcnM6H2vmsrkkmLJQFng6qM/eMFTvj8gHePllj0ysb3VIUoaw96W38itx7sQrF0XoZMyT/gNHDyKOjBUVRNOIBCJpbFBh6dzH2ZpAoYGCFohcNHwGYdGnrQFeDEBQy7CK43r90cJNL0wQNZSqER/rSh36lqIOIWPV5+/4eU6ikarNA9BPJHV+NQvDktH07CAfSwlTLSEAH2TNbROcC/BuA+pY3RT/DQEPL5vBAcDetBDPFbTm0Cwto1Biq1N8SxC7FgdU74R+vE4xvvsQER1UAGJtdsHv7MM/dq6xjzkweX0cfSJFsTScfE4u2hdznR59X7FgMcm1lQUuzRCbU69avuL/uQaEF3tzy+0F/Zxl2nPc8XxyWWada2cqOLdM6J3YX8w0hnGj42Lf4DzrRDM0LeeYF54bSzH3hJXh2aM/OI9vc0cfp8A4jvVMsDF64Y6jgv0oDApybSTb9S8AhOQLI0UoHyM5EPUXvDDZ7pk41EhWZnAoJkFBGxY20JSyWHUVCn00IZplIcxpRC7N+WoYLKAFjhVvfww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(136003)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(31696002)(31686004)(6506007)(478600001)(53546011)(6486002)(6512007)(38100700002)(5660300002)(15650500001)(26005)(316002)(86362001)(66946007)(66476007)(66556008)(2616005)(4326008)(8936002)(8676002)(66574015)(2906002)(83380400001)(41300700001)(36756003)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHNNT1E3ckFKaHdUMW04MHk4T054YXYyVTQrOVp3NS85bFRpcFdrcnNCMGRM?=
 =?utf-8?B?QTJQeGFrS25pN21qSlBXSVdZQ2wwOFlLNk5NbUoxVW5OWmFqSnl0RFlHeGxt?=
 =?utf-8?B?TTE3WFh5YlFsemh4L2FyYzNOalc1S3dYdVdhWFVVRzdQK3dWTkE4SjdBdXVm?=
 =?utf-8?B?UmZCY3h1VGNyUjVmQzVGZ09UNk1zVVZuazJqY1lqLzUxM0tRVitsZHl5WS92?=
 =?utf-8?B?Um1zZUNabFQ0blZsVGdRbng5bjViZ0thUkhPSjV0K3lmYXNTYjhvdmRpTysr?=
 =?utf-8?B?RmlJcE1OVlE2UFBYRENDSzJIVFJVSVUwVkJXNWp6MkZ4NTU3U3p4TTVTUXpm?=
 =?utf-8?B?QmJXb0Qwcm0rNHI4VktWcEdqY3FYeFJVejRJU3lHend3Qnd3VEI1YXI4Zm95?=
 =?utf-8?B?YkxoNzExMnQ3NTdrdGEvTjNkd3ZYeEJYVGM0dnhqbjZWV1VlTWVnOU55dkFt?=
 =?utf-8?B?UFdEUVFZanl6dDhhVk9mNDN4WEZIeGVuYUJKaVdxbW0xeHhTTSt2N0pGZFgy?=
 =?utf-8?B?SlpmQTVWT1pMYWRRYkorV0dtUzFuVkY4WDlWQUMzeU56bWtveThiQXkyM21l?=
 =?utf-8?B?SHJwYnUwZXVpUFdTZmlEdTVtd3UyT1M0OS9sblJDZkJSdTlZcnZheWpQVWhz?=
 =?utf-8?B?N2FXaXdsY1pEdDJmNExSWURUWU8yQjVyR3hXNUZYMDY2QzVibzZpZU5HeE9M?=
 =?utf-8?B?c2tkbVhSSFNNeGY4bGRTc0luZ00zYm5YQVpTbW9Vdlg3OFQ0eVcwNHMrVmhn?=
 =?utf-8?B?S2lQd25MeVdvYytNN01Lc1BzUS9kT2xVUWRPa1A2NVY5YmMyRUd4c2pWZnk4?=
 =?utf-8?B?akFPMzVZNGZwbTh0WDQ5b1d2Qk1GSlNhOHAyN2s3aEY4RmJYTHpkbWtNQ3hp?=
 =?utf-8?B?NmhZaFN4MXRzaFhTUGNMSmJHSnZNSTlPTTVCL1lBR3UwcVcybUJYeHJFT0RK?=
 =?utf-8?B?N29NcjRQcHRkMFRCWnptN2JwcGdQdFN5YVFUZzQzZ080WG9ib3hpMzlPMVZj?=
 =?utf-8?B?ckk1cUlZQ0lrcGZaZWdMcXNvb1ZzNitFRWROWlU3Yk9iL3dsbzFoZlZta01J?=
 =?utf-8?B?MmoxWm5BUGdmYndoSk0wV3U3TlNkSzdCK0VYSEtubCtaUUFmTWxwZEF1WFRW?=
 =?utf-8?B?K0NvZFJ1S2ozaHRNdnBwTE5YS2R5YXhFTm4zNUJKenNzdWF1aWRLcDZESG5O?=
 =?utf-8?B?SllVZ3NhNGxndDRmdFhJbkl1Sm1KMFFmWWp5Vm9DN0Q2UnJwUWdSWVNtUjFr?=
 =?utf-8?B?UE1PVlVlc3FYOXdMOVBqZGZKRktoR05zTkROQ3NiMWEzZWdDdlhreDdsQ1VB?=
 =?utf-8?B?KzU3ZytXTm5jUGFka3lqb2NUSzRsUzlQRzVFek92N0xONC9Wa2dFTjgwTDVD?=
 =?utf-8?B?Wk1HSittVkZaT3lTTmNrT09GWmhsekV1SngyVUtMbFZBL090WjRrOGZwSmdO?=
 =?utf-8?B?UThsY2llMHlqNVZGTUJPM1lsRmJhUktsRnFRdWRzUHlqUnBkN2k1Y0p2dlJi?=
 =?utf-8?B?ZWJqNFNGRXBRclVNdndJdEJrakVISEcyVVRUc3lFV1RWZUpaSGFjYXdteXNJ?=
 =?utf-8?B?WVJOSENCVlROZ2RCdXZOZzRMMW1XT3o5SkpuUDNoRjJiTG8rL2VrYWpQcEhG?=
 =?utf-8?B?WFVBQTY1ajJGMDQxbjlmZHdyWUZPZEhlMnY0RnlsN1lDcElXUUVJQUZWVDl1?=
 =?utf-8?B?S2x1RGlmcUFyeEk5a1pFTTBaVjJpUGpycEt6eFhYelFHLzJHNVU3REhSMzhy?=
 =?utf-8?B?dG9qYXdwR1ZQZnBmOENRZkFoV0pPTzRNc1ZsejR1WTFEWXNhVDFObkFLZ25S?=
 =?utf-8?B?cEt4bmVBR1M4cTlOOExwaGRXU0hVRWVzTWhQbEtMN2RBNXFhMWJqTzdoZjhD?=
 =?utf-8?B?WTZVcDBBK3IyNjdwY21CcWVqRkR2Q01xNXZnSVJiTldORjZKR1UxQ1RNVHA5?=
 =?utf-8?B?VjhualZlaUU4UjhWZlZOL0FnT0JKMWhGdlNWNTFyVWwzVnNrV0FqQjJ3NUUv?=
 =?utf-8?B?QVdKZEpwdGNJR2VVS1dJNm9LQ1BVVHhlN1YvTGcxWTF2MFd4bWs0aXZoMFY1?=
 =?utf-8?B?akdvUW8zWE5rZGN2bVRZSXZ2TExxdkowcDc4ZGJ5bFZ2bW9DZXZMd2ZvNU1o?=
 =?utf-8?B?VnFYczJ5UGkwc1NIbGs2dlU0OTAxNERvZU8ydzZ4TzBrc0ZnWVVSTnFZTUZt?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82197f6f-c507-43bc-3b63-08dbf7ab61fb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 05:06:06.1476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQ+/BT8L1DAagwfXDaMAkg5ivaZt4fwEhwoGATbve17RBxstTdMWrP/yLY8sMRFidjPcOChnbTY7pTmJMIZeNiS1Sp7GP2MvRXOJRrckpDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8705
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 07-12-2023 18:17, Thomas Hellström wrote:
>
> On 12/7/23 10:19, Himal Prasad Ghimiray wrote:
>> For indirect accessed buffer use compression enabled PAT index.
>>
>> v2:
>>   - Fix parameter name.
>>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
>>   drivers/gpu/drm/xe/xe_migrate.c       | 20 ++++++++++++++------
>>   2 files changed, 15 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c 
>> b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> index 83d6a66ed369..f77477f7e9fa 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> @@ -330,7 +330,7 @@ static void xe_migrate_sanity_test(struct 
>> xe_migrate *m, struct kunit *test)
>>       else
>>           xe_res_first_sg(xe_bo_sg(pt), 0, pt->size, &src_it);
>>   -    emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt),
>> +    emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt), false,
>>            &src_it, XE_PAGE_SIZE, pt);
>>         run_sanity_job(m, xe, bb, bb->len, "Writing PTE for our fake 
>> PT", test);
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c 
>> b/drivers/gpu/drm/xe/xe_migrate.c
>> index 98dca906a023..1bfb249680f4 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -416,15 +416,23 @@ static u32 pte_update_size(struct xe_migrate *m,
>>     static void emit_pte(struct xe_migrate *m,
>>                struct xe_bb *bb, u32 at_pt,
>> -             bool is_vram,
>> +             bool is_vram, bool is_comp_pte,
>>                struct xe_res_cursor *cur,
>>                u32 size, struct xe_bo *bo)
>>   {
>> -    u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
>> +    struct xe_device *xe = tile_to_xe(m->tile);
>> +
>> +    u16 pat_index;
>>       u32 ptes;
>>       u64 ofs = at_pt * XE_PAGE_SIZE;
>>       u64 cur_ofs;
>>   +    /* Indirect access needs compression enabled uncached PAT 
>> index */
>> +    if (GRAPHICS_VERx100(xe) >= 2000)
>> +        pat_index = is_comp_pte ? 12 : xe->pat.idx[XE_CACHE_NONE];
>
> Please use a relevant define instead of  "12".
Sure.
>
>> +    else
>> +        pat_index = xe->pat.idx[XE_CACHE_WB];
>> +
>>       /*
>>        * FIXME: Emitting VRAM PTEs to L0 PTs is forbidden. Currently
>>        * we're only emitting VRAM PTEs during sanity tests, so when
>> @@ -722,19 +730,19 @@ struct dma_fence *xe_migrate_copy(struct 
>> xe_migrate *m,
>>           }
>>             if (!src_is_vram)
>> -            emit_pte(m, bb, src_L0_pt, src_is_vram, &src_it, src_L0,
>> +            emit_pte(m, bb, src_L0_pt, src_is_vram, true, &src_it, 
>> src_L0,
>>                    src_bo);
>>           else
>>               xe_res_next(&src_it, src_L0);
>>             if (!dst_is_vram)
>> -            emit_pte(m, bb, dst_L0_pt, dst_is_vram, &dst_it, src_L0,
>> +            emit_pte(m, bb, dst_L0_pt, dst_is_vram, true, &dst_it, 
>> src_L0,
>>                    dst_bo);
>>           else
>>               xe_res_next(&dst_it, src_L0);
>>             if (copy_system_ccs)
>> -            emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size, src_bo);
>> +            emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, 
>> src_bo);
>>             bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>>           update_idx = bb->len;
>> @@ -975,7 +983,7 @@ struct dma_fence *xe_migrate_clear(struct 
>> xe_migrate *m,
>>             /* Preemption is enabled again by the ring ops. */
>>           if (!clear_vram) {
>> -            emit_pte(m, bb, clear_L0_pt, clear_vram, &src_it, clear_L0,
>> +            emit_pte(m, bb, clear_L0_pt, clear_vram, true, &src_it, 
>> clear_L0,
>>                    bo);
>>           } else {
>>               xe_res_next(&src_it, clear_L0);
