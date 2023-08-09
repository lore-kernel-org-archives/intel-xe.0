Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B81EB64DD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 09:55:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DEB10E04D;
	Wed,  9 Aug 2023 09:55:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1392110E03B
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 09:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691574923; x=1723110923;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wGhoG44IRQWuvawVXH4AIPxyB9R2wjU9owOm1e3jlhY=;
 b=gH1L4+3xBLUKVCJwwHPdJPiswPd+mvwiLVfuiMVvdcMQle+MRN+GlndU
 b1hpsOM3vzzD8BzyRLLaIhoUrEosUvspo1E/85Qc8eQVyiW41Rr79Ce/l
 P9ApEB5+3H5V0daPhdhxTM8PVR4wvcX7vHUdb2XyA0P500HlBZjkR8Zmo
 KzyPtm5jE0WVCqlg6vWQ6d0p3B0uQBuHkRDKE0/04XUExeGrplSnFHNkW
 tx0+178v4S/eRgcitiAfmLbcOi1CCwbStUF3o/TKiMIVX1Vv1PNEstJk8
 t6uZwMrHYNIqMtjGw+5+RKrIXfw9Q3C47vrRsLkYFMLC+7dBdRaNcsn4e w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369982190"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; d="scan'208";a="369982190"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 02:55:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="821785739"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; d="scan'208";a="821785739"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Aug 2023 02:55:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 02:55:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 9 Aug 2023 02:55:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 9 Aug 2023 02:55:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfFJHYM423t9rXwHhgIXI/vTI6zIzT6N9A04AYaoWlSogG3b5wcp0XNrhNiFxoeRmqWCX7JX8ibXutu+GtuxgOCRnHunoCbJk9a4EUKrkesHWPDlxHQKNJcVAvN3A9CrO8tF0NcCx7MDPrXQpNXzY5CuHMi4XCl8WiEWAmZkPOSBS1oRDl1Hjx/Df+7N1J7Laz1yxA0wlHi97myGGrEDY+m37mNu+i6xM0dN52SRzXWM+AevbtwhY9htPHtGpRGy2ZXdjqsYrK/a4Qtq7Q0gAjcPHTyE007E5IsxNw1NjfR5bXTmDcVWOHDoUh2NzQzU3ViTLFe/2Z6/2k7RjPMcGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TjzGx6JGBdIZsLdk0G8Veyy3Si8uXdn9dmUU/mzn6U=;
 b=nx5bd4LI+GKgF43311L9oxtUei0t58ps5lz/hzA6ngpRy4Ea5Wqz/mgqaocqdVBHNNsOZbspZ5ZWUOwQ62UMISU02tHtPYfs3VNTBJrgwrmDQU5awffLM4Fk8v+3DEUHFl6GzCM98UUTGvVFAEs3PlQ0oBz19XnTGDxYIWE5bcwnPJ3LYX/a5VHf0r2ouw73kPVc+LLLEGgxscDbcmehJyPf3vnkRSGGqs2ttjnJBQc1FC5PKBE4PFjzxSz6CQ49xWfV3Tl0a/KylJemT6nAFtWTGp8uyZh7rNjOTAmii9pFiU6mABgk+ZJM9PAVVRF4xjkDTKNfBjS0ro8na9KqMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by CY8PR11MB7393.namprd11.prod.outlook.com (2603:10b6:930:84::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 09:55:15 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153%7]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 09:55:15 +0000
Message-ID: <95750d7f-df24-a9c5-ab39-86db69767bac@intel.com>
Date: Wed, 9 Aug 2023 15:25:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230808115436.400611-1-aravind.iddamsetty@intel.com>
 <20230808115436.400611-3-aravind.iddamsetty@intel.com>
 <877cq4y8s3.wl-ashutosh.dixit@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <877cq4y8s3.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::10) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|CY8PR11MB7393:EE_
X-MS-Office365-Filtering-Correlation-Id: d1239973-5a56-4a9f-af67-08db98bebab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tZiG7Vi5eiv+B/K7H1DvzPeuCiXNNFHABwzJQQMlQOcvdb/U/P1BNWF7C+Rf2BJcHkya0F+ysUTECH5JrWyOHkcA/sOI+not55B8kDRrBWwWMKdWrLqErLbFBClwECu1dDz3Z16GWjIYXTKBFqPOaIxq4Y4COEkTIxbMDMql7qYqADR5W/0c1xdd7HnFLXNPgi0oXI6Hc9fqy78bu15ZaWi9ujv9W2UsslqpQBNeRHGy0bQIaciGHvNgGqyq65v6wC5Mfiya24pTIU/IMvkfRKCn6QcZRJQh09Hi4iBAUfemPcF5RVLQYTGrPsRcjUrADE7jKvcJ8pDsS4pwtjHASASwwDA9i5t9SF6hbtTMy/LTuuqwg5CMHmFsL4HexR1Z2br6KoEnvoIwpGW+CsneSuN84Xj44xD/PqQRqnTnG6k4LeMqe2ZAAoT7vXEtxfOCVfU7C4Y6FU85zlmgtKN+VMWZFK71CrUiJx73vq2rfAq9QLpKKN2+r6PiuGXNpgqQdNO3Zi+GLJ9TrvsL5JECkHo8G7vCv/gaWGo6MtJkk8X3TSBaZhcSNDjckmYbdawx18kivyn6v0kpA7qp6pA0bxnV5CELz4DREk4Ou2wU8OYnlM1iVI++SwSaxxs3uz0Je3uwdSL5rQrQWTWc8Ky0PA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(39860400002)(396003)(376002)(186006)(1800799006)(451199021)(2616005)(26005)(36756003)(6506007)(53546011)(31686004)(107886003)(6486002)(6666004)(6512007)(478600001)(82960400001)(37006003)(38100700002)(54906003)(66476007)(66946007)(66556008)(6636002)(4326008)(316002)(41300700001)(6862004)(8936002)(5660300002)(8676002)(2906002)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?US9CelBjYUxaL3JaZ0xyN3Vkd1ZmYmY2eHorRmtyL0hpaTNXOVBFS3ZyNHFk?=
 =?utf-8?B?VHhGK0c5eG00YlVjQmpvTHAramJuZHc4cHpBc20xK1NLWWdhQ1h5NXlNYkpF?=
 =?utf-8?B?T1Q2VFNPc0kyOWhQVHVwakJBa0ptaERLbkExZWVhZDhreG1JbVQrS2hQUW5p?=
 =?utf-8?B?U2psd3o4L2hHczdhRHhCNjU0YndDRklNL1FjNndMK2ZsMCt1YmE5K2sxQytT?=
 =?utf-8?B?b0doWUVrYVpWWmtMUnM0VHNJY3VSQUxZKzFzRkJyWEJkQnBpZVYrMHAwS2FW?=
 =?utf-8?B?enNEczNpY2FqQURhYmw2ZXdpWHRnQjNHTGkvVFBPQmFhaHFQRUZNNS9rVEdG?=
 =?utf-8?B?VXlsVVU1YzgrOVY1dnk5RnNoclQzQnIvOUsyT0Z3MHVoVkh6QjVBMXZSTjBm?=
 =?utf-8?B?c3U5UHg1eXlyZGhjaWRxWUhEcDhBbHJtMHBWSUlkV0VLem1ibUlHRDI3MDJo?=
 =?utf-8?B?ZCtIaHp0MlMrcjNVRFk5S2QyVGp0S3NnYnNyMVNyY2ZTeTk3enE0TWRmWHQv?=
 =?utf-8?B?TkxpSnlobDRLSUE4MGdxOVNrakNRUno3N0tRallIRkNtU0NuSStXVXlDQTZP?=
 =?utf-8?B?U2RSZ1RnbjRranh2eGlIRkc3SC90clN5TzBmSFQwY0FDUDFhTStXRFlUbnFz?=
 =?utf-8?B?aTJmSkxRMHNBVldlRTBrejZEZm5MWjVPQkNHUWd3enhiSjNHYVFZUzFrMjNP?=
 =?utf-8?B?dGhDOUsyaldPWHdwTU5KTDdHS1J2dXFmZUhOM2I4VFRkRFZYZjRGa1Z0NFFV?=
 =?utf-8?B?S1lRa1BCdlZ0VTJQQS9vMHlWLzhCckNEYzlNUXVLM3dmeFVvMUZBMVJId2JX?=
 =?utf-8?B?SndpNmh6QzBNUExMUjh2TkUvWS82Sml1NitNQ3E3ZXQ4d2llcEZNN3NLSFJR?=
 =?utf-8?B?SzhwUmpnU0hPMTBPOW5PZlVwdjhmR3dGTmpqZFZ6bUZwUXlWU2VXMTFSSE5l?=
 =?utf-8?B?dzNLYWJNc1ZRRWlYQkxONEdGYTdTL1hjUzdqSVdNMmNQdGZoMlNKWlladWI5?=
 =?utf-8?B?NDA0b1UvWVBhNjBEbXcwNWhuSFRnWVFiOVRwd2J5VWRidk0yZnRiSFdKMGd6?=
 =?utf-8?B?L3pCb01ORmt4Wkg4WDJyUzR4ZUhxcGcycHNyZjFKbDhPMVRSb25FbTF1SFhZ?=
 =?utf-8?B?c0lMVnJzdldDN2E2K2hkOWIrNEd2enl3TGY3Ry9ET0VxM1BqM1dpUVYyTzJE?=
 =?utf-8?B?NzBBcjFHZjBiT0xzN1F5cWRsRGgrZm5nT1Y2Mm1zZ1V6emhiaXQyWlJTc2JI?=
 =?utf-8?B?YjlTUjFpNGt1MFJQVTl3MHI3T2o0ZmxiRCtWcEpoZVpSLzcxRmVWbDRIV0gz?=
 =?utf-8?B?TVEwY0Q0MDdwdEd6bThwcXk5TDlXbXlNOERPTzZMVWU4NmhTVVVwVUJ2TURk?=
 =?utf-8?B?dnhxV016b05JUTR2RUM2N3puR2xubncyc2l6UlIvanl1RjJuOE5tUVRydjVN?=
 =?utf-8?B?SWNwMi9sd3lvKzdGS2R4dGdjVWFrWTllTWlKWFZzVldVSjJFeEsxcnkxandt?=
 =?utf-8?B?T2NLb2htS3NIK284MFhXZ2pmU3RTUStVaFc4REhJS05tMEh3ZUhFeVFPYjdr?=
 =?utf-8?B?VDVPRkdVMFV3aFJ0cGwvYkJGUm9CN0IxaGhvS1RjNXM0QlFkR1R5bE1URFpU?=
 =?utf-8?B?Um5nSEU3REtaUUIzUVdRSmJiRTJoQ2YyY1FJTGtlQ0xUVjYwNm1vTkpWaURT?=
 =?utf-8?B?cmcwMzJJWjdGRmd6anZ2M0JyNlFWM0cwQUREbGN2STRJOUpSbkRaM1NyU21D?=
 =?utf-8?B?QUNLU0NDRUxoSkE4ZW93d2dkT3RJV3Z2dE1IcDdDUmVuYlBETC8zS3Rya0Jx?=
 =?utf-8?B?NHAzN2RFdnNsL0Z0UmVJeGJadkgvdTN2Uzk2THhzaGNpblV1MWFGRDVVVDhZ?=
 =?utf-8?B?Y0I4Y3p2QytUM3Yyak5IdTZlTzBDeDhhbFdoT0lpODN4YlZmV2RUMnlHZk9l?=
 =?utf-8?B?eXZEcU5HMlVIQ1NKc29lK3d2VGQxZ28zN2tROXJSU29nZWdLZ2pkRnhsMWFL?=
 =?utf-8?B?c0hvdVBjMVZ1UEk4eFYyL2dnRjN5alcwR3pqSnZmTjJsa1lzRW0zWnYwM2hE?=
 =?utf-8?B?WjZUaG54VmNJTnVuUkR1QVZ2NzJQQXkwclVVMDh3SVBYczRIMU5wU3NBSENI?=
 =?utf-8?B?UUhuWndMdXp6UUFpOWgvV0JxeU1tV3ZjUVVZQi8wcHgxZEViWVMwTytvQlRT?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1239973-5a56-4a9f-af67-08db98bebab1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 09:55:15.0581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mdQm9F+R8JXELL0NrsqOc1/J/lC0hz/cDbX3f0jQ3C2t6a+xQbYvEN+bZ1cR+Ow+e06PqtUR6WfurCZIEu2AyjXAXpus/qys1h6iQ7aJFbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7393
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/2] drm/xe/pmu: Enable PMU interface
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 09-08-2023 12:58, Dixit, Ashutosh wrote:

Hi Ashutosh,

> On Tue, 08 Aug 2023 04:54:36 -0700, Aravind Iddamsetty wrote:
>>
> 
> Hi Aravind,
> 
> Spotted a few remaining things. See if it's possible to fix these up and
> send another version.
> 
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> new file mode 100644
>> index 000000000000..9637f8283641
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -0,0 +1,673 @@

<snip>
>> +static u64 __engine_group_busyness_read(struct xe_gt *gt, int sample_type)
>> +{
>> +	u64 val = 0;
>> +
> 
> What is the forcewake domain for these registers? Don't we need to get
> forcewake before reading these. Something like:
> 
>         XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));

based on  BSPEC:67609 these belong to GT power domain, so acquiring that
should be sufficient.
> 
>> +	switch (sample_type) {
>> +	case __XE_SAMPLE_RENDER_GROUP_BUSY:
>> +		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>> +		break;
>> +	case __XE_SAMPLE_COPY_GROUP_BUSY:
>> +		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>> +		break;
>> +	case __XE_SAMPLE_MEDIA_GROUP_BUSY:
>> +		val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>> +		break;
>> +	case __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY:
>> +		val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>> +		break;
>> +	default:
>> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>> +	}
> 
> And similarly here:
> 
>         XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> 

Thanks,
Aravind.

<snip>
> 
> Thanks.
> --
> Ashutosh
