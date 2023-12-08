Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957ECC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 05:01:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE6B10E9CC;
	Fri,  8 Dec 2023 05:01:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0AF10E9CC
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 05:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702011699; x=1733547699;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kvhJdhWYtoMN1DB8+kCvyE5pPxRqw+luLwScg8sh6+g=;
 b=R0plgOYoc3UoMht8Rlbpw1ZIXXx1/ky/3qZKzFDfwIRbB3Ld1OJjujbW
 OGNHZRWzzou07lpE7MJJpgydDOsjJ/ablMrx13DZBTGYoOBUrpWqjCvGR
 fJP4o0CHPHxpO5pxS33VEQybZGumT0gIx4RbGBLahppQzkx8eIKeQaqby
 Qwv0Ed3KYhexYrEOw20HEkf2l60FF5sOXhoQSQWkfUtO1l8OZlcbqVVoG
 cXBDLD5CF3TkhpGqbuhcZtpzBHxqgQD6+deL/vTCNAjAeG925GRXBsZad
 vn312G9nqqDVRGWan0v/+3PM+F3lpG9n1aRDgjCnN/2cgNh/WBdhdz433 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="379359826"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="379359826"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 21:01:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="842473805"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="842473805"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 21:01:39 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 21:01:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 21:01:38 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 21:01:38 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 21:01:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4sucBSXtcAXCy2kjapyeV6OtD/u0UQLmzmsnyKH6Hdv27xuzfaRNkJ8/J6ZUQpv74WgaAjg6DrlYoMuYuGVwej0kI8vGVNP0L4tJhc6Ug9fgnrkeW/dr1GZOfVDrzrePfnEO8XsyZunxbkJajK7xdwXF0/AlmX/dF6+hxpvDp5XQkH5Ak3NHsArIPxFeTj8w8XyoC+EyX29MdcvOuHTsdXsO5LAeywGxlmgDv5GSzNLYJgR6ay7tjmyZVyzTB6YdJXxFpgqdry1X8oD4K3mRAd+uQU3V7QUWIHeAay8vgjLm3uQ1eqkGQyMsYsz/1457Lqekzq+g4asnvjkepb2iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XljjTe/5za9eCj8zQjPep44Zb/ZktYW0RR2W3h5Zee8=;
 b=bB5KL6jG6IkfP4BRboebQZH9ZTf2xtctZAdbueLCXNEXxikp87HY/6K61s77OwjdbPjbX4sAFAWDby7rK2ypQeNRLHMbtTdGvL+nL0BEb7nMiMJuV3dwL5luQ7FL7WbZvlcDPtnQI+EwYMz99Pi30kJVt+T2fKnE4119AzzzBtEj4ZaQdf+dG1VDFGejlFRK57Y5N2hE/LN1rdatjdL4tMN0gW1LkHHJRIe0CsQ8dnSmoomGQmiGnYHNZAW+DR+5fkIR0wQNVCRfBSoNmP9bz8snCP8Sh6pHJlGbYM693BkoqbiN/FAYUCQI06yrj83EJkSUvOyx0ffs3MK94TL4/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB8687.namprd11.prod.outlook.com (2603:10b6:8:1be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 05:01:36 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c%4]) with mapi id 15.20.7025.022; Fri, 8 Dec 2023
 05:01:36 +0000
Message-ID: <d6bfe9c9-3f46-4c4d-8677-4b1d6bc05b8c@intel.com>
Date: Fri, 8 Dec 2023 10:31:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-xe] [PATCH v4 6/9] drm/xe/xe2: Update emit_pte to use
 compression enabled PAT index
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
 <20231206043126.984049-7-himal.prasad.ghimiray@intel.com>
 <20231207001437.GU1327160@mdroper-desk1.amr.corp.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231207001437.GU1327160@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::15) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: 54a18ef2-3026-495e-5163-08dbf7aac107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6s03Xc2S4tmx7huIcQ1GGbJ5VOV4gkicY2KvhDZRMGY4hY3Hz8qc+sBoOqgY+oXQMl62TPrcQQzohe246qwb15GI0eMSTWeHNHZnQd6UOzZcZdLX6/qGn42VjtMv7W/jthuGCn6IsNt5Ldeq/K2unXyynQbEBopkoWs8D4J9sKsUfF9/b8JFCxVg1gRgJdC1FWFSeT4fFY2zWFlmaoBiwIi/u8iupZT8tLpU14Zn3m1ukJ7V+94wVCLvbMog+xVjeVnuesQLxC7XcuQEXPBsc2nYVaCC8Z2QsWwTxPUge/r/w1WqgwDgxg5ahQMWmXoR9jXTJ7E+In35qkJ906GWVnUR9y6sv3HK+Z+ymph05a+VLSDGMI/5/4ITZMqQC7hIslu2BeYCpQxe2XrZkEImj/28PNnss8aN/SG4vy5tn48Fkaq6dsBlygpHvDcalx/mXwbYGM9ofCNYFUlvpEYts8juez+u08Le3ubzqunrEkdPNReozllzCbuZx6galB3sg22OWHw/y8PbWfAKBQwP+eTT7jllMwFeMBNnuziTUJ8UzMEe5ZJPIAL7XSUys7jDcjekzkiL7EYEhLgV0Vcw5UaRkNFUo4PjJkT4PAvM3lkiqBXsqln+dAWTkQoszNgBNrPl5J+iumbz932KdwP+Ng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(376002)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(31686004)(6512007)(53546011)(107886003)(26005)(66574015)(2616005)(41300700001)(82960400001)(38100700002)(2906002)(86362001)(36756003)(31696002)(15650500001)(6486002)(478600001)(6636002)(316002)(5660300002)(8936002)(6862004)(4326008)(8676002)(66556008)(66946007)(6666004)(66476007)(6506007)(37006003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXdIQVA4b1F2WVY5YVJ2OEVZSGVibngvRkkzQmtOT3UrUUw1bVpLMVZDWXVD?=
 =?utf-8?B?aUNLcHV6YUNxblh4ZUs0Q1Y3cXd6VUF3RVNtM0x4dVRKamowZGtrNjQzTlZr?=
 =?utf-8?B?WE1KbWZjeWFORURvTWI1TDNJZU5HR25heXVja1FTdWMxSkp6OXgxelNvdGcx?=
 =?utf-8?B?T3lmMTJvRXJOOVFadHM0M0kraXJIOWNqQVFHSzZ3TTBYRzFPeXVmVlhEREdt?=
 =?utf-8?B?NWdIbmJtNS9xcXVqazlPSFlwaUJMZVlPU3BXalFDYkQwWVFlSDArZ1lRZjkx?=
 =?utf-8?B?d25odnVjMGJQNFlwaFlIQy9TSlBBWHRMQ0lTOGZFQ3YzM0Y0NVpGaEYvOS9s?=
 =?utf-8?B?TnR2ODdFN1dCU053MDRLWmt0VzRubElJTUwwVndqaGwvbXplWGdHa2x0Z3Ny?=
 =?utf-8?B?WG9RSENqMnhCRkhSaUZ4Q0w1TmE1Q3RIWWpaeDQ1ZmZsSHdJL2hxcE1Ia0Jr?=
 =?utf-8?B?YW1Qc0V5TGwvUHhyYUdJVUhGUWlPa0RlZ2s5V29KczRmaTRYaVprdC81OVhH?=
 =?utf-8?B?MlQ2UGU3ZGtyMk9WaDVNUXBLR3AxNElMQ2twQTA3WnNRTk53S2tCNzMvNFh3?=
 =?utf-8?B?Tk9QOEw5dGxhTHhhTFpLV3RzTTA2WWpWVFJVQkNUQllGMGZOVDJ0TGpyTjJE?=
 =?utf-8?B?eXQ5RW0ybDQxbGZrSUlLRWxIRkJEbE0yVFpiWVdtMmtMYmZJdHVHbnducm9a?=
 =?utf-8?B?Mkp1NU5LbHNOLzN3S09TK3lLQ081RUtvdXZSbzRxM0hpeHFvUHVST2d2SFlo?=
 =?utf-8?B?WG5RMXo3ejI3dVRBN2huelNLQk5Qa3pUTE1Ic1dSSjhBL25VNk1xTGc0dWV4?=
 =?utf-8?B?cVQ1YVd5SEJ2TE52R3dTYjY5STRXd3JIUzV0anJUalJMaTBDZExPeWVrT0ZP?=
 =?utf-8?B?Y2UyazJPNGZwZjVhN1BDSklLMEVOY0RUVWRjOHBNbEJDSEVOVENxemh4NWlx?=
 =?utf-8?B?R2syQ2xVazNROFNEOXRvYmNXK2lZbWpuTEFIQXhUZDJPN3pGRUJkSzBvSThx?=
 =?utf-8?B?bStXYzFsTml4OUUyK2lUbCt6ZnF1a1RzeVpXM3NrNnJFTCtBMEJGcTV0bndh?=
 =?utf-8?B?cmh0WkkrR2pxNUExRFQ2MC83MlY2SFpNYkZnTGp0NmU2UVYvK3dyd1dJa3g3?=
 =?utf-8?B?NU1tckMxVkMzMGEzVytTVDFlc3BOb2hsRHZma1RYbGFPMmEwMnRlSUlUcHE5?=
 =?utf-8?B?QlZ6L3prQzJlZXBqQlVxOHl1RHNvRzlGeFFjM2x6OEZjcklHQk54WXNVRXQ3?=
 =?utf-8?B?Mk12NERwSWV4RkVxTy9YZkhlUHpOMkYrcTNuVHVaa0tMejBRZkdJdGxQN1ly?=
 =?utf-8?B?Mk9WMHl0TEdGVk9Id3MyVERMUCtGNHdwTDJXRFcvby9kRG5Pb2k2QWQwZnZI?=
 =?utf-8?B?Y1NTNWpQN1UrU2xhbTdiOWNrUXNtb2pkWWF6RmgwVzlaVjJVUXdSK2J5VGZ2?=
 =?utf-8?B?KzI0RmNEb2k4R2gzRTdiWlU0YzFRanNoMm1Jemt6Q3pBd2Y4a3dIK0pycWl5?=
 =?utf-8?B?d1JZdEpRaURVUmhRZmJVM2QwL2NTc2hZMXIzT0VHMDBmdGtLZGJyNVJvLzFI?=
 =?utf-8?B?dzNUV2VrQndLVk5jMUpvWDFWYkhPY1R1WGlHQVhoYW1uODA1MzNnTGpwZ2pZ?=
 =?utf-8?B?R3QvemhyR0RwNzJoVzZFK2Z6elE2ZUtsaWFPU055b2RibVpjNXVvU3JUaXpE?=
 =?utf-8?B?SU51UjM5WGswTU1pbkgyeDJSTnhtWEpSNEl5elNxV1lSdVoydzZrd0N4RzZN?=
 =?utf-8?B?eXBDSGNKQmJpNGJrRVk4SzRqVWhtNkQwbVdXL3BHUWdGOXVWdklmUnd5WmUv?=
 =?utf-8?B?VGprMnJicGxoaWdsK0R0dDdyY0N4VzFYcHdxTERzYXVGaG1FOXFNUCtBSmd2?=
 =?utf-8?B?UHRZQ0d4Q3lSaWRHRHFYdjlSQmRVVTlxb3N2WUpxZ05TTVV2elluaWs0dkxz?=
 =?utf-8?B?bU5ZUEZOTkpzVU5pRzdpQy9rNHRTbUUxNTN6a3hJQkxWWXo3aGZMYmJITWpK?=
 =?utf-8?B?eHhsWjFBMzgvRnBoUFl4MVVTbFNsYW9NdkZiMkJZeFVPbEw0UWczU3JLUmM0?=
 =?utf-8?B?Qm13Uk0wM1MvanBLT1FmT1EveXZVUmFLS2dtZGgybzc4UHlWSU16c3psZ1BB?=
 =?utf-8?B?WXNnanh4R3ppNlpwUlZjWktMcFpuWGZVdng4YTB6V3NrOEJXYkg5ZHM2QXdr?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a18ef2-3026-495e-5163-08dbf7aac107
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 05:01:36.1014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lt39h+UHLYoEJVIfka28yuxfkXvnov9rJMU6CF3T34dwsr26VHxiINXzo2Bm03yEMnPNOh95wsqd4CNlYAkeXfVvrNqfYNXs6DZS9qRmhBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8687
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 07-12-2023 05:44, Matt Roper wrote:
> On Wed, Dec 06, 2023 at 10:01:23AM +0530, Himal Prasad Ghimiray wrote:
>> For indirect accessed buffer use compression enabled PAT index.
>>
>> v2:
>>   - Fix parameter name.
>>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
>>   drivers/gpu/drm/xe/xe_migrate.c       | 20 ++++++++++++++------
>>   2 files changed, 15 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> index 83d6a66ed369..f77477f7e9fa 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> @@ -330,7 +330,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>>   	else
>>   		xe_res_first_sg(xe_bo_sg(pt), 0, pt->size, &src_it);
>>   
>> -	emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt),
>> +	emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt), false,
>>   		 &src_it, XE_PAGE_SIZE, pt);
>>   
>>   	run_sanity_job(m, xe, bb, bb->len, "Writing PTE for our fake PT", test);
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index 98dca906a023..1bfb249680f4 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -416,15 +416,23 @@ static u32 pte_update_size(struct xe_migrate *m,
>>   
>>   static void emit_pte(struct xe_migrate *m,
>>   		     struct xe_bb *bb, u32 at_pt,
>> -		     bool is_vram,
>> +		     bool is_vram, bool is_comp_pte,
>>   		     struct xe_res_cursor *cur,
>>   		     u32 size, struct xe_bo *bo)
>>   {
>> -	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
>> +	struct xe_device *xe = tile_to_xe(m->tile);
>> +
>> +	u16 pat_index;
>>   	u32 ptes;
>>   	u64 ofs = at_pt * XE_PAGE_SIZE;
>>   	u64 cur_ofs;
>>   
>> +	/* Indirect access needs compression enabled uncached PAT index */
>> +	if (GRAPHICS_VERx100(xe) >= 2000)
>> +		pat_index = is_comp_pte ? 12 : xe->pat.idx[XE_CACHE_NONE];
> We should always select the PAT properly for the platform; we really
> don't want a magic number like "12" here.
Sure.
>
> Also, how do we know we want to always use compression here?  Is there a
> reason we select uncached?  Do we need to worry that we're now using a
> non-coherent mapping and may miss updates to the buffer that are sitting
> in the CPU cache?
>
In case of uncompressed PAT hardware  is returning always ccs read as 0.

Have already started discussion on this, will come back with updates.

> Matt
>
>> +	else
>> +		pat_index = xe->pat.idx[XE_CACHE_WB];
>> +
>>   	/*
>>   	 * FIXME: Emitting VRAM PTEs to L0 PTs is forbidden. Currently
>>   	 * we're only emitting VRAM PTEs during sanity tests, so when
>> @@ -722,19 +730,19 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>>   		}
>>   
>>   		if (!src_is_vram)
>> -			emit_pte(m, bb, src_L0_pt, src_is_vram, &src_it, src_L0,
>> +			emit_pte(m, bb, src_L0_pt, src_is_vram, true, &src_it, src_L0,
>>   				 src_bo);
>>   		else
>>   			xe_res_next(&src_it, src_L0);
>>   
>>   		if (!dst_is_vram)
>> -			emit_pte(m, bb, dst_L0_pt, dst_is_vram, &dst_it, src_L0,
>> +			emit_pte(m, bb, dst_L0_pt, dst_is_vram, true, &dst_it, src_L0,
>>   				 dst_bo);
>>   		else
>>   			xe_res_next(&dst_it, src_L0);
>>   
>>   		if (copy_system_ccs)
>> -			emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size, src_bo);
>> +			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src_bo);
>>   
>>   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>>   		update_idx = bb->len;
>> @@ -975,7 +983,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>   
>>   		/* Preemption is enabled again by the ring ops. */
>>   		if (!clear_vram) {
>> -			emit_pte(m, bb, clear_L0_pt, clear_vram, &src_it, clear_L0,
>> +			emit_pte(m, bb, clear_L0_pt, clear_vram, true, &src_it, clear_L0,
>>   				 bo);
>>   		} else {
>>   			xe_res_next(&src_it, clear_L0);
>> -- 
>> 2.25.1
>>
