Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF6CC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 04:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3042910E14C;
	Fri,  8 Dec 2023 04:10:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B61010E12E
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 04:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702008652; x=1733544652;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3J7cNxENDZqvwaFKq00Z2XG0qmfBu5Ui4TAtPeDHWpA=;
 b=bDdAobJJaLwx/6iUGF5uqiN+6uUGloBAUjf6ZKIwRhMQSjxjazQAm2Kr
 UgtVqgcOZinf6zls3Pi30pSyYDq+1uJx4Yqj0eXWOnISByl3gR3PX7E6F
 9wH81de/naOFw6E2M/GcfI3at2+GAS8dz2O7YNP6c1VfQxyMvqK2QB8NV
 uyIrRmnBrytigLLYdNfeLiYGqt6i+SeZNiR7cPTLZt7QqlXJZIHPpF+Ty
 IDUTTM/zolk3mzKY4a5Hxshx7W8AGJS/oVlKtjQMcELUgwWsxQzUCj1LY
 cbGJ7ZP+Pc1USzY7Wv6xsJBp9GbC2Ti1HiuKIES22FiqSXZssxJMbIhZQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="7677157"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="7677157"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 20:10:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="945287819"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="945287819"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 20:10:35 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 20:10:34 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 20:10:34 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 20:10:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lr0nJC0lhpcGPePWg6YQGw4MZ3YQBWnFE1aH8xQrZRQVL4ikdEYnZsGWDWYjeyPLV7cOQkcCrcKMy4BH3rzWhSvy3VIwxoksX/x20qcEstXi+A7wkZtiNolgpTF8utFbqcF9XfQHBp13nrnxww3Do3ypb9sU/UMMBBE6dRzd1gwXop0dS+vaEgjsDl01kfRung+QnqHQ8I6oyI8+8akmeuA8bYvgkl1TBqXQl4IDiNUxHAoAGVlPZVhddsYbkRtDNpioAgM1REHKEhy3YFqEnwWaqoD8J0MPsmGhODSDs9Hx3C4l2eTw339zzCMQNEX3ol5794JcSkdC3BVzvBUGIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=paodMYB1fvbrl6MZb2OqgIhsTrhWOUqwPtmuQftY0G0=;
 b=Fv25KXRyTEgKadOwiJScaYUYKz6DUQjQ2jK9ENEASgofo+hxVwjv9ZoexlPyfI9Rfukxrhiwu65xTVPrThyY6WMV0WSyRSmRZtU/hqYipQ+AtQkfzSdc648wWnMNaqpbAlrWdQzP9g7W27Mg1MDyKex8F2fbEJgj//oyqPofymLeJJsvYV82OxXrLNWmF6vNmrAQQNfP83nmRu9xBw72cknAUU4N/+NBNLa/klSzcNLmy0msKV0weTc8DtLApgEZ/6B/GAgo9KbWFSmY2iktdK3ecCBZPKx1VOhUSOK0ZzSmZgPXSNiFqiaMzXlLuKNX6vZPL/eX8Px7sXnSGP7Wbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MN6PR11MB8102.namprd11.prod.outlook.com (2603:10b6:208:46d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 04:10:32 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c%4]) with mapi id 15.20.7025.022; Fri, 8 Dec 2023
 04:10:32 +0000
Message-ID: <ff28dc1f-93d4-4dee-81e6-36ca1842768f@intel.com>
Date: Fri, 8 Dec 2023 09:40:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-xe] [PATCH v4 4/9] drm/xe/xe_migrate: Use NULL 1G PTE
 mapped at 255GiB VA for ccs clear
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
 <20231206043126.984049-5-himal.prasad.ghimiray@intel.com>
 <20231206233731.GS1327160@mdroper-desk1.amr.corp.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231206233731.GS1327160@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXP287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::28) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MN6PR11MB8102:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c401481-6daa-4d7f-5b24-08dbf7a39ed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qs50D1AxCZElXv3rUOfX2shTi+K+QGahHfurk58+FqkfJ3xIlQBPM8ywysh1t9+FwbRq+ScuLXQQAfY2bDvOFmve0ofkQkKeQSVUHT8M0AY45u3UskrvrwB9mm3BJFvtJxXjlrIMaUIh7n8YwF0qutpEhqyj/peSQjjZR3887CY+3BTUR39pHjlF1an5we1P6ZzrR+nvZeva4eooZae/yP5I/6zhEr6iA9cJoJz6lEywF/4O0xP0TfPCU2NlgAXJtLWXuNhkhxXECUO4IZl/OnVoXF5ZdPPAXClb/jXZG7QoN8JOi7nPwjGA6O9BlTaObdG9wDlKua035uLWeNAv5PRRTK3KOWFzabRm6Hyp4m9Zd4z0wIzBd+1ovgyKKCB/RGc7zHQpkYmThbC02Cxr5EaXSs/YfVulIpiQdDIczkW7mCmkZ3aejYOesoWslB4D+MlHZUH0fKSO/BVGLCbQXsPB7dl+/wjB+Yw2nLE/qEOQ8KORNksnSYt9J3xsp5aZx6u8q/QbSy082bUdj5iGkyS66sEYKm/QKo0m4ATss+LFVvl+14EufG2gn7vPZ5t2ysnIoVeRXtAgAB2v2vqoV5IakIsLRK4MpaLY6532vIzxc9gmNEdXBvf91XGKOoXdUuOai+Mve571ieo9l0PCUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(376002)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(66946007)(38100700002)(86362001)(37006003)(66476007)(66556008)(6636002)(31696002)(6506007)(2616005)(26005)(66574015)(83380400001)(6512007)(53546011)(6666004)(41300700001)(36756003)(478600001)(6486002)(316002)(82960400001)(4326008)(6862004)(8936002)(8676002)(2906002)(31686004)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NER0UnlQUU5VTzRTSVdONG1iZE5JcXZaRkZXVEpOZFByUmQ5ZEhCMlhhcmJQ?=
 =?utf-8?B?ZWNqaVhzWjB2VEZaOWlxc2NGcGVQYjYrdEw3ajRvV293bmk5WFZXbXhacU9y?=
 =?utf-8?B?NWxQZnFIWkZDa2FOZ0dxUE5MN1h4Rko4U1NPYzlSREVoQmVPYmZHU2pjTzFJ?=
 =?utf-8?B?Tkc4QTRKcWlIM2dhVitrQkJUY1I4TDZkUTBWaVVvWTNyTjc0TGJGT1EzcXpw?=
 =?utf-8?B?bm4rQ2QzcWZHUG5QR0dlN1lsTGtwa283TzBWK2JyRWZjZVg5S21ZSERNQ05s?=
 =?utf-8?B?cFU1ci9icmRwaUwyWmgxbitHNWowRXlROElpWk9NTkVBY1Q2dTdaTmRMWjdh?=
 =?utf-8?B?QUt0anlxZmttbDVPQkJ6cm83WXNFY3VNbXRIY2lWdzNZaCtzaWdoQWYrb1Bq?=
 =?utf-8?B?b1ZxeUZUelB3aFN3UU01MW9YVDJyU1Y5dUhTNlZNV3lGeFdDZjZ5ZTg5S3ho?=
 =?utf-8?B?MVdqazhKK21LbFh6d3gwZWo1THNzU0J1amFqWVV5bWtSaHZEZHlMdzgzeU9Y?=
 =?utf-8?B?QlRYbkNSWUxqY3ludTRFMmYra2VNTHJCMzNHc1d5MGJJbWsyMUp1V1ZVbDZl?=
 =?utf-8?B?Snc0dDRPZ2c4Y0phSXovb0FMUzRlcTJqaGVuU0tabW5YczNIZHduV3lPN01j?=
 =?utf-8?B?cCtia0w0NU9rRFEwRnNVa1prUUVqSHJ1ejI3QVZEYmcwRXlHSGJkYWJ6dVhX?=
 =?utf-8?B?M3FTZXpVRElDUjN4Qk8yUDViZ2FrVytHalFnUGsvR1U2Um1yS0tQWXZZVUxJ?=
 =?utf-8?B?emVpOTBNbWEySVZUMmh1MVNaSTkyRnVWbmZoZ1BVN1IwVHdMV1hSdldURVhq?=
 =?utf-8?B?QUk3VUJQeDQybnFqRmxpdW1tRVcwcThoTDNIakVNdGdnbitRa2JjdmwyWktW?=
 =?utf-8?B?L2pjUGNhSXk3VWdwZ0plUjR6UXJTL3ZkK1hRTmNFNzZDWXpnejQzVWhjRm9I?=
 =?utf-8?B?cXByNGR4OFJkRzR2Q0FXcXFsTWd1QVZrTmd5RS8yZWZLTUxXNEFvSTJUTkps?=
 =?utf-8?B?TktpeVlPTThJTHhLRWthNUFrc3U1QldVT0trYlRMRHp0eHY4Y01HRWs5TU8w?=
 =?utf-8?B?QzZvRGZ4KzVpSmZmbzB1U3dNZCs3cVpHMXBrWWwwRGxFYld2UFVlaTRKcHcr?=
 =?utf-8?B?U21YNU9icEh2YkU5Sk9kWU9ZaGM4aFVuTzhFMnJ6L0ZXczBHaDFmRzlFYmhu?=
 =?utf-8?B?VlVncEpOTG96akpvdkFjSmp4U1UweEtSRzZ6d3ZscFpYM0ZaRTZlRWZpNVlh?=
 =?utf-8?B?OU83WlF2OWh6QW4wcXF1OEtncDczUklsRmNUUDgyRFduNHJaencrV3VLbmpX?=
 =?utf-8?B?YWQxY0hvYyswTEdHcEJ5Ni9Ub00vY2ZiQ2xkQUEvZVU5Sk1Vb2VUN3hhMnFv?=
 =?utf-8?B?ODN6SlV4MzlHemtXVHdqVEp5VW04UzM2T3RHdUZhUSs4a3A4UG1kNE0wYXlT?=
 =?utf-8?B?V3BTWENuSUs2bGVRSGNYaVprbU9HaGdwTU02cEVYTTA1VDd2TmVTQ3h4RGJN?=
 =?utf-8?B?eFJjRVJQa0FDbWZyMVVOYlI2UjlxaUhsMCtZcWJWcmNnNGlHTmVZV1F3WmlP?=
 =?utf-8?B?WTQvU3dqL0ViNjNmczJ5WW1hYTQ1em5LL2NzbjhyWjZBMHE4eXpFanNLUnZn?=
 =?utf-8?B?KzNQVlBwWFJlUXNzZXNKbGZieXE3VjJOWDFzN2FtVDhHVlpHK1MwbUs2USs1?=
 =?utf-8?B?UXRFTFU2ZStOWWY4amtLM3pibkFybHJjcEhTYWNYMUtHanJTMnlRbTgya0ZK?=
 =?utf-8?B?NHQreVhWN2pIaEVoWUZseXBxOWdqR3dzTWR0d01hQXVJNHhnU283UlU5MGZJ?=
 =?utf-8?B?c0JZaG1pOUdFOGZkZWxWRjJ1RHBJQjE5NWVzZmxzZjVIWGlGdHd3dzlPdlZ3?=
 =?utf-8?B?aWV0bGxOZFFwbnMxcTZHcFhBS0lHV2RpV3VHeXpIU0lEMC9wd0pDZWJEeHhG?=
 =?utf-8?B?c3VTdDZTUVhUOEIxMGtCdkZTM2Mxa01jeEJWQk1YSkt0Z3VZU0FhVWRoRkxF?=
 =?utf-8?B?bGtoYlFUanVLcUgxdjhxMG5hMWRCR3JJaDlhRVRKUUVpR0NhQjNaaGhUbTVK?=
 =?utf-8?B?bmNQREVGTFJEVjhYKzhMY0hZcjExT1ducW1qdHB1OW82RHVwUXMwQ0RVNDJk?=
 =?utf-8?B?U0dkbmtHdjlZcXNtRGx3NWRvWldxMmQ1eDhiajdROFlXOWxibC9UMXpCS2RH?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c401481-6daa-4d7f-5b24-08dbf7a39ed5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 04:10:32.2673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJ9ZAss1BYl1dCy6af1h5vtTRusrkXCQx7qyMWCahxrQGd+E+IP1uLxedGYwQWJ6B6WeJsGSCckK+hm2dR35jVDAeOer64xpJMvoytQNSps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8102
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


On 07-12-2023 05:07, Matt Roper wrote:
> On Wed, Dec 06, 2023 at 10:01:21AM +0530, Himal Prasad Ghimiray wrote:
>> Get rid of the cleared bo, instead use null 1G PTE mapped at 255GiB
>> offset, this can be used for both dgfx and igfx.
>>
>> v2:
>>   - Remove xe_migrate::cleared_bo.
>>   - Add a comment for NULL mapping.(Thomas)
>>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_migrate.c | 65 ++++++---------------------------
>>   1 file changed, 11 insertions(+), 54 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index 7ef068451b59..b4dd1b6d78f0 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -46,16 +46,12 @@ struct xe_migrate {
>>   	struct mutex job_mutex;
>>   	/** @pt_bo: Page-table buffer object. */
>>   	struct xe_bo *pt_bo;
>> -	/**
>> -	 * @cleared_bo: Zeroed out bo used as a source for CCS metadata clears
>> -	 */
>> -	struct xe_bo *cleared_bo;
>>   	/** @batch_base_ofs: VM offset of the migration batch buffer */
>>   	u64 batch_base_ofs;
>>   	/** @usm_batch_base_ofs: VM offset of the usm batch buffer */
>>   	u64 usm_batch_base_ofs;
>> -	/** @cleared_vram_ofs: VM offset of @cleared_bo. */
>> -	u64 cleared_vram_ofs;
>> +	/** @cleared_mem_ofs: VM offset of @cleared_bo. */
>> +	u64 cleared_mem_ofs;
>>   	/**
>>   	 * @fence: dma-fence representing the last migration job batch.
>>   	 * Protected by @job_mutex.
>> @@ -93,13 +89,9 @@ static void xe_migrate_fini(struct drm_device *dev, void *arg)
>>   
>>   	xe_vm_lock(m->q->vm, false);
>>   	xe_bo_unpin(m->pt_bo);
>> -	if (m->cleared_bo)
>> -		xe_bo_unpin(m->cleared_bo);
>>   	xe_vm_unlock(m->q->vm);
>>   
>>   	dma_fence_put(m->fence);
>> -	if (m->cleared_bo)
>> -		xe_bo_put(m->cleared_bo);
>>   	xe_bo_put(m->pt_bo);
>>   	drm_suballoc_manager_fini(&m->vm_update_sa);
>>   	mutex_destroy(&m->job_mutex);
>> @@ -125,41 +117,6 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr)
>>   	return addr + (256ULL << xe_pt_shift(2));
>>   }
>>   
>> -/*
>> - * For flat CCS clearing we need a cleared chunk of memory to copy from,
>> - * since the CCS clearing mode of XY_FAST_COLOR_BLT appears to be buggy
>> - * (it clears on only 14 bytes in each chunk of 16).
> Is XY_FAST_COLOR_BLT still broken on Xe2_LPG?  If not, have we checked
> to see whether there's any performance difference between doing a NULL
> copy vs a regular fill?
Will try to figure out this info.
>
> In general, this pre-existing comment should have been labeled with a
> workaround number so that we could properly track which platforms and
> steppings it applies to and know if/when we could potentially go back to
> using the dedicated fill instruction.
>
>> - * If clearing the main surface one can use the part of the main surface
>> - * already cleared, but for clearing as part of copying non-compressed
>> - * data out of system memory, we don't readily have a cleared part of
>> - * VRAM to copy from, so create one to use for that case.
>> - */
>> -static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
>> -{
>> -	struct xe_tile *tile = m->tile;
>> -	struct xe_device *xe = vm->xe;
>> -	size_t cleared_size;
>> -	u64 vram_addr;
>> -
>> -	if (!xe_device_has_flat_ccs(xe))
>> -		return 0;
>> -
>> -	cleared_size = xe_device_ccs_bytes(xe, MAX_PREEMPTDISABLE_TRANSFER);
>> -	cleared_size = PAGE_ALIGN(cleared_size);
>> -	m->cleared_bo = xe_bo_create_pin_map(xe, tile, vm, cleared_size,
>> -					     ttm_bo_type_kernel,
>> -					     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>> -					     XE_BO_CREATE_PINNED_BIT);
>> -	if (IS_ERR(m->cleared_bo))
>> -		return PTR_ERR(m->cleared_bo);
>> -
>> -	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
>> -	vram_addr = xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE);
>> -	m->cleared_vram_ofs = xe_migrate_vram_ofs(xe, vram_addr);
>> -
>> -	return 0;
>> -}
>> -
>>   static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>   				 struct xe_vm *vm)
>>   {
>> @@ -170,7 +127,6 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>   	u32 map_ofs, level, i;
>>   	struct xe_bo *bo, *batch = tile->mem.kernel_bb_pool->bo;
>>   	u64 entry;
>> -	int ret;
>>   
>>   	/* Can't bump NUM_PT_SLOTS too high */
>>   	BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE);
>> @@ -190,12 +146,6 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>   	if (IS_ERR(bo))
>>   		return PTR_ERR(bo);
>>   
>> -	ret = xe_migrate_create_cleared_bo(m, vm);
>> -	if (ret) {
>> -		xe_bo_put(bo);
>> -		return ret;
>> -	}
>> -
>>   	entry = vm->pt_ops->pde_encode_bo(bo, bo->size - XE_PAGE_SIZE, pat_index);
>>   	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
>>   
>> @@ -265,6 +215,13 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>   			  (i + 1) * 8, u64, entry);
>>   	}
>>   
>> +	/* Set up a 1GiB NULL mapping at 255GiB offset. */
>> +	level = 2;
>> +	xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level + 255 * 8, u64,
>> +		  vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level, IS_DGFX(xe), 0)
>> +		  | XE_PTE_NULL);
>> +	m->cleared_mem_ofs = (255ULL << xe_pt_shift(level));
>> +
>>   	/* Identity map the entire vram at 256GiB offset */
>>   	if (IS_DGFX(xe)) {
>>   		u64 pos, ofs, flags;
>> @@ -618,7 +575,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>>   		 * Otherwise if the bo doesn't have any CCS metadata attached,
>>   		 * we still need to clear it for security reasons.
>>   		 */
>> -		u64 ccs_src_ofs =  src_is_vram ? src_ofs : m->cleared_vram_ofs;
>> +		u64 ccs_src_ofs =  src_is_vram ? src_ofs : m->cleared_mem_ofs;
> Is the 'src_is_vram' check even correct for an igpu?  It seems like
> we're _always_ going to be copying the NULL CCS data now and will never
> be able to copy the real CCS data.
This check is being enhanced for igfx in [PATCH v4 7/9].
>
>
> Matt
>
>>   
>>   		emit_copy_ccs(gt, bb,
>>   			      dst_ofs, true,
>> @@ -1006,7 +963,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>   			   clear_vram);
>>   		if (xe_device_has_flat_ccs(xe) && clear_vram) {
>>   			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
>> -				      m->cleared_vram_ofs, false, clear_L0);
>> +				      m->cleared_mem_ofs, false, clear_L0);
>>   			flush_flags = MI_FLUSH_DW_CCS;
>>   		}
>>   
>> -- 
>> 2.25.1
>>
