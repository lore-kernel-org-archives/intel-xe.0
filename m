Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE018E8FDBF
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 00:48:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968CD10E008;
	Wed,  4 Oct 2023 00:48:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B78710E008
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 00:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696380516; x=1727916516;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8JFLNcOquJpyXNJcw7L35/qyyb35WeyKrSCWpVxqxbQ=;
 b=a+sxYYCpiLvzY8mGAbxFZYcBbsFa47W7ALLYD1GPkJJl492maUMcDSlJ
 WXPyI/cJAyLU/G7jm2Ro4o6WFe76y1jZSyI3nwP3wVuRt5RT5Orz0cDpc
 5MRxxdE00wdJXjA/qtEGOGBVxl277hOqNVMKb/eKiAlKbTaeTpVnA43zD
 PYstfZsoR/MYdZHJShy7BAC7742IthnBuW2X+pLg9c/oEVrUq+02KMMrI
 U3Q071/TyT7DLeDP2T12B9ckdZR+N87p7JBB8hFUtCOv7KgDVOXtHbOYe
 qPSdXwjTGjG6fqTeC7tamn4ulJvz8lW2q0vdK6V22fiAFfs8cqq1Qq87R g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="385836083"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="385836083"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 17:48:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="751086836"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="751086836"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2023 17:48:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 17:48:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 17:48:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 17:48:14 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 17:48:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJiBj+4mnMa5tcXmEO7eeK1pRpPGI/j35Jt0Hoj8VQu1+P3Q2UMxjDJuF62FhVEgYCe0IO/auQx830IVmhipEbyYJJl0qNc4DX6T977CXPRqfGlRQZvBqk+Sy0YOcLY0kqGZzIPxTNIv6JGNrERhDPO0y0GBy86dcrQqhNkI7eg0GLPQzVM1rPd69Cx72swjYY6AgBayY56hsjDvuSMrGHHHH9VNBQDJ2+PcBRRLs0tnpn/GZqMTlEoTZXspwwZitd9VauFNoIqmA07AYR8v+wO+YVUKy96NtIe05rqXm4Ftvv9O3SqBq3/0NR2CliX0xlmV+YGZ2ldFGeTaLVTyhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8M4pHvpV1f6i5cV2Z0mUx/YoUPnHCvrl8sTtU6ILJG0=;
 b=jo0TAwTk04hOgIN2H7Qa6IgQhJjavTI6SCGNGpJIz6s6GBDolD0ZiH5zGL2ReISxoUFzyAdTmLs2JZ/Fk7eLaFGamr3B1m1hDlwESTimEN+D9wDgwBP1lVPhx9G3X0teH/6jqEAkhV/KpvklSGTZ8s0SWLKJ+D6wSopFaUgJxnpWEM9yLpvL4NQupBXM50gueWD+loEZmZof6pOy/h2/KXY4eCxzs4L8p8+w6afvZlXpZyYs5BjN73riOBRJ8OmgkTqPV49dZjl3Jj6+UtkKFWemJ9fZYR5ykvk87cSWXWgX4hK8OTlWhTrVAj6uOgBN3o1CwGqQo6xPsGWGkV+CxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MW3PR11MB4697.namprd11.prod.outlook.com (2603:10b6:303:2c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.34; Wed, 4 Oct
 2023 00:48:12 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b015:c622:edaf:8c86]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b015:c622:edaf:8c86%6]) with mapi id 15.20.6838.030; Wed, 4 Oct 2023
 00:48:12 +0000
Message-ID: <a3b880a3-555d-540a-0f10-4f2a7c017dec@intel.com>
Date: Tue, 3 Oct 2023 17:48:07 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Content-Language: en-GB
To: "Souza, Jose" <jose.souza@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
References: <20230926125540.7-1-francois.dugast@intel.com>
 <20230926125540.7-28-francois.dugast@intel.com>
 <f749c938c60f7b6a9cfda34846c457aafe400150.camel@intel.com>
 <ZRRgt81Ekx0tNk3e@intel.com>
 <30f2ed3daceb731b579938b87abdc0d16f182d10.camel@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <30f2ed3daceb731b579938b87abdc0d16f182d10.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0158.namprd04.prod.outlook.com
 (2603:10b6:303:85::13) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|MW3PR11MB4697:EE_
X-MS-Office365-Filtering-Correlation-Id: 15662626-25f0-412e-dd5c-08dbc47395d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9UBlCCiN14/1n2nLizRbUE/gGv1z3bb6dxcKnwTeuCwO5YHdhd03j55CYQMwdfv1SXXOrQQbk0tUz9w8fvHK+2J3vvt79RVokoErQC/O9UTQhT5FL5zEEnnQayWY166p/ujscJ916YX9RJbjjT6hgD7gTrtBt4QLrV10OvJFApTZSOcbj5qEmwuZHHNAKFa72R3l1fr8i2QoFV+q5nm4QegXkJm9W+Piage/BhevrxQUyzbOaPl+/MPPsel+7MWYTF0Pmbi1/ux8l6L3X562GoZpI03Flaq4H5gAED2Yd2cdAmvx7IMEUGs6DrCn+RSmrhFneVnfcRrYVsedi/jzT5pRwoaKeAR+/Y/+ea0KMGSfIJaacw34aouVdC35oZFgJYMPWXUkPE3qzv4VaVV2mAy8pKxMhcU//Ha83GNMQatqTnSCuKYGFZNZJV+KhQ6i2iS2EbTXYNXAZWSXHzrq9POSGpvHBwneziLpPYbK90vDPYnXxC1fSIABTNjr8D3HrNx4/mQ0VukTYK+9XcIjnEegrdP59YSavA4FBCmDWOQo+trSjIeZJj/OA4v008rBIENkHf3Qcpg7UPhhdSDBgH9BlljHs7srgJNhy8U/+i42W3w0rfY8rPHFx2zZvDyn711Lvjv79MZ7IsI3WNy7yw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(366004)(396003)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(6666004)(86362001)(53546011)(6512007)(31696002)(41300700001)(5660300002)(2906002)(31686004)(478600001)(8936002)(82960400001)(6506007)(4326008)(8676002)(38100700002)(54906003)(2616005)(66556008)(316002)(6636002)(66946007)(66476007)(26005)(107886003)(6486002)(66899024)(83380400001)(36756003)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVN4Yk1jMkp5bkc1eER3UGlMK0IyUkY3WkdxYzZQbm16TUt4ZklPRHdzR201?=
 =?utf-8?B?R2FwNXNXVWY4bjRMaHBrKzJMMWlKUFN4WFVOM0tuLzMrOFFHckk1ei9TQ2ZB?=
 =?utf-8?B?RmRmaXhua1ZPdW5EZks2eUpJUXdLRWxqQ282VjZVeE1sRVIxSitTQUd1UjNv?=
 =?utf-8?B?R1ZLdXE3eFZVTjMyY0c2cDJyL2hvMWxNQ0hXcHFQU3E5RWlOVm9FVFNFQXEz?=
 =?utf-8?B?dG4rZkRtdUo1b1lObWZUMUFmSFJVbUdMd2hRTmVZa0tMTG5iSlAyVUFkcllW?=
 =?utf-8?B?ckkrQ0FxWUgzRUFmRm1CMi9NWWRaY1Q2R1doNVRIVE4xZG9BWGpYTE0za2lN?=
 =?utf-8?B?ZEFxMytBSnpDSmJCaDdHT29QWDE2VEpSUkNRcXgvUUZJam93Z01oWTNXdGV3?=
 =?utf-8?B?bm9KTDJ2ckNBYXpycHhENWFBUFN3ZEdqRGYyd2VXNWtocUtWU2M2aVFGQmp5?=
 =?utf-8?B?UmxMSE9peFA0OTFZcDJlSWpUcXNJSmd2QjZ4dkZXK2RtdGNpQ3VuWGl1SWtN?=
 =?utf-8?B?K0ZRc1ZWVnpVU1BIWVcvVlErdEs2RGtNT2ZkMmN4dm1pUkdWZlMrY1pNRzdV?=
 =?utf-8?B?bXhndXJ5UHV6VFBLbzNiSU1PT2owTVI0aHU3MWdwb2pjNnRHeUxCOCtxdnRK?=
 =?utf-8?B?bGVTZEY1RFdJRTJnWGpkbmQ0WCszc1M5c0c1Qi9TdWNXTlhyVURoUzFMTU9n?=
 =?utf-8?B?eTlZWUZJR005TE5lNkFCOVAwMXYxUHhQN0lwb0VqcFBRVjE1N2YzMWp3RWpT?=
 =?utf-8?B?azdsdFRZbENiejVnWG02TW9wYUtLcnpETXZQSElhbkFoWUFzd2xyeG13MVN4?=
 =?utf-8?B?TE5STnMxeGVaT2dCeE1Qenp0VnFLbTM2TEZvNWNZLyt1SHl5d3lUdEp5VUFZ?=
 =?utf-8?B?L3hsTFM5TXpITURzVXlOM2VwY2IvTVRFbExkd2JwS0FJb2g3WWljKzV1dW1J?=
 =?utf-8?B?Mm1iSW5kY2pkYUdsZmw3eFRleVZ1bWM3SnlITk0zLzIwM2wxMThTY2p5eUhH?=
 =?utf-8?B?c1M3Zm5sZzJNNUgwaUhoMytrbk1BRlduNEEyck9KWWRuR014d3NMT1IvSExH?=
 =?utf-8?B?eHRkb0Q1Mnc4OWpxV3BaditHU0lNTENFNFZTRU9FYUVJUTdhVkRoU2FwdXhV?=
 =?utf-8?B?NnVzNThzczVzeklTWW5JWVpmaE40UWRIUDN1c0dqVlR1VXFEeDR1VDdjakRj?=
 =?utf-8?B?K1R2WVBkNjFqaGJxL3p4MmFNWndZbnQrWjUvSzJGUTdKTmJ4cUhEWUhmVkt2?=
 =?utf-8?B?Zy9HelJSckZyb0hBQzB1bGdPSmUrYkIwa3JEQ0VmbkZLR0FDVUhCd2k2Ukkv?=
 =?utf-8?B?akk5NVowbUdqSnlnZFhEOEJuc1Q1a0VHbFlYcG13MWI5VXJpbHRLbmh6VDA1?=
 =?utf-8?B?c1Z5dEF4dGg1ZGgzSHZJM3A3dy93dDRoRVRRQWZsRUYxR2hTZnF2dktSTHNt?=
 =?utf-8?B?RG9PdWJJaVlmSFVpVUN3SGd3allBT0o1dXF1dCtNWG94QUx6OTNwYXYyOXNM?=
 =?utf-8?B?TUs1THd2a2gzWjNMdkovUlFvVzM4azc4OXlpOEt6eFlsQU13ajRVaDZMT1ZM?=
 =?utf-8?B?Ukt4OWpFVUtHdkMvVEtiVGpzdEFrU0dST3FqWVVPNkkvbHVhaHFmdUVCb3BZ?=
 =?utf-8?B?WWgyQmVqWSt2RWxDZ250Z2MxVDhwcy9Vd0gzb2FQaVRUQjBYd2xuam41Z09y?=
 =?utf-8?B?YkhBZW9sY000b3dzRnlrZUZ4QVlvR3lhWEtlc1BuczFYM05MaUVBSG0vNjZN?=
 =?utf-8?B?TFJUbnZkbkY1bHVDZDU1anFUbXNYemVPcFVoa3R2VzBiVjJiVW9TODZyU2k3?=
 =?utf-8?B?THVzMXUycFhlS2taVUljL3NFaFAzUk5La1ZLcWhOWkdWMXFDNUl4ZEswYVkw?=
 =?utf-8?B?aEc5MzdvaHZucmNLNkpaMmM3cnQvc0gyWGg5MWo2bHBPL1lqVGtCSWpRMkQy?=
 =?utf-8?B?L0RxUWNLa0VYMU1rUlA5S1U4WFpFVU0zclRUQkVoU0p5SUlEL1pST1V1VEla?=
 =?utf-8?B?MEI0RmRvaE9MYzNDR25LanphTVpxQy81MjdLWDc0andpQXhqQ212SHFvMUF3?=
 =?utf-8?B?M1BIQW5kTHRyclNRT1RWQUNuai9EMGJpRHFySy9EQWxzRWcrbEl5RnRsM1Ar?=
 =?utf-8?B?QVM0N2w4UnNVMHhEOGRRWi9uc2RjaUFBdXNlWi9yMGlIeUxDWmdvOVJnaTV1?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15662626-25f0-412e-dd5c-08dbc47395d2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 00:48:11.8294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w24s2xI495V98mpsW4RikvhXf9qj0L09pfeHbfnT45rlXZ2L7knA3zxXoMIBj67icfACuu1NMrwIIQXnx5jxybOB8+ZnsZVRJWeScUQDlxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4697
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 27/30] drm/xe: Extend uAPI to query HuC
 micro-controler firmware version
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 9/27/2023 10:22, Souza, Jose wrote:
> + John Harrison
>
> On Wed, 2023-09-27 at 13:04 -0400, Rodrigo Vivi wrote:
>> On Tue, Sep 26, 2023 at 04:46:36PM +0000, Souza, Jose wrote:
>>> On Tue, 2023-09-26 at 12:55 +0000, Francois Dugast wrote:
>>>> The infrastructure to query GuC firmware version is already in place. It
>>>> is extended with a new micro-controller type to query the HuC firmware
>>>> version. It can be used from user space to know if HuC is running.
>>>>
>>>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_query.c | 9 +++++++++
>>>>   include/uapi/drm/xe_drm.h     | 1 +
>>>>   2 files changed, 10 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>>>> index 7a0ffd9a654a..c250ca534bb9 100644
>>>> --- a/drivers/gpu/drm/xe/xe_query.c
>>>> +++ b/drivers/gpu/drm/xe/xe_query.c
>>>> @@ -530,6 +530,15 @@ query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
>>>>   		resp.branch_ver = 0;
>>>>   		break;
>>>>   	}
>>>> +	case XE_QUERY_UC_TYPE_HUC: {
>>>> +		struct xe_huc *huc = &xe->tiles[0].primary_gt->uc.huc;
>>>> +
>>>> +		resp.major_ver = huc->fw.major_ver_found;
>>>> +		resp.minor_ver = huc->fw.minor_ver_found;
>>>> +		resp.patch_ver = huc->fw.patch_ver_found;
>>> Have you confirmed that HuC will not have something like submission version like GuC have?
>> Nah... GuC is the only complicated fw in our set of fw...
HuC has no split interface. It is only ever accessed by the UMD from a 
batch buffer. The KMD has no dealings with the HuC beyond providing the 
firmware image to whatever entity does the loading (GuC or GSC according 
to platform). So no need to multiple interface versions.

>>
>>> At least in GuC, when running in SRIOV mode the VFs will not have access to the actual GuC version, that is why it have submission version.
>>>
>>> Not sure if providing a complete different firmware version from one kernel version to other would be considered a uAPI break...
>> hmmm... but now what I'm asking myself is if we shouldn't move the guc one to
>> have the current loaded firmware and create a special category for the
>> submission version:
>>
>> XE_QUERY_UC_TYPE_GUC
>> XE_QUERY_UC_TYPE_GUC_SUBMISSION
>> XE_QUERY_UC_TYPE_HUC
> I don't think any UMD would fetch the actual GUC FW version and risk fail when running under SRIOV VF.
> If needed we can map a submission version to a actual version...
>
>> But to be really really honest, there's something really fishy on this
>> submission version. Why the VF cannot read the running firmware and
>> get the submission version from there?
> Got this information from John, he can explain it better.
Because the VF does not need to know the master version number.

Especially when you get in to VF migration and such. The VF could start 
executing with one back end GuC version but then be migrated to a system 
with a completely different back end GuC version. As long as the 
submission API is compatible then the VF doesn't care. However, the PF 
that is managing the GuC very definitely needs to know how to manage 
that specific GuC version. Even ignoring live migration, an end customer 
may have a specific OS image that they have validated and tested and 
want to run on some cloud server system. The cloud provider may need to 
update the GuC version to take security fixes. But the customer's image 
should not have to change as a result. The GuC update must be backwards 
compatible at the VF level even if it is backwards breaking at the PF level.

In short, the GuC presents two completely separate APIs. One for 
management that is only visible to the PF and one for clients/submission 
that is visible to the VF (and directly to the UMDs if we ever support 
direct submission, plus indirectly to the UMDs via bugs!). On native, 
the KMD sees everything so technically only one version is required for 
native. But for SRIOV, the two interfaces are totally separate. A VF KMD 
does not have access to the management interfaces and does not care what 
master version the GuC is. It only cares that the client interface 
matches what it knows about. Likewise a UMD. Therefore, we need two 
completely separate interface version numbers. And we need to be very 
careful that nothing uses the master version when it should be using the 
submission version. Otherwise, stuff will break when it starts to run in 
a VF.

Whether it is useful to return the master version via this query 
interface is debatable. There should be no functional requirement for 
it. Any UMD code should only care about the client interface/behaviour 
and so should only need the submission interface version number. 
Potentially we might want to report the master version to the end user 
via some control panel information tool thing. But that should be the 
only purpose for it.

John.


>>>> +		resp.branch_ver = 0;
>>>> +		break;
>>>> +	}
>>>>   	default:
>>>>   		return -EINVAL;
>>>>   	}
>>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>> index 84091860c7d2..fe7e83a5bd3e 100644
>>>> --- a/include/uapi/drm/xe_drm.h
>>>> +++ b/include/uapi/drm/xe_drm.h
>>>> @@ -478,6 +478,7 @@ struct drm_xe_query_topology_mask {
>>>>   struct drm_xe_query_uc_fw_version {
>>>>   	/** @uc: The micro-controller type to query firmware version */
>>>>   #define XE_QUERY_UC_TYPE_GUC 0
>>>> +#define XE_QUERY_UC_TYPE_HUC 1
>>>>   	__u16 uc_type;
>>>>   
>>>>   	/** @pad: MBZ */

