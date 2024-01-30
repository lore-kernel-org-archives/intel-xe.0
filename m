Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3A9C46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 15:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9911131C5;
	Tue, 30 Jan 2024 15:54:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C5F10F90D
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 15:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706630077; x=1738166077;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YvJNioUsg4owMaf+hkkbouZT/DVGLCn8Ur0rhLX3B1E=;
 b=Kzh7wmuyhKMrIxtDIx6KPv5CyeDOwZkUidIieteJFtgQka1xOF2JY35N
 2A+dDCwv6aw7cOBnyGP8vsQZXuR+Gbdrtob2R5N90hLFB4tieT562j4O5
 5pjjviCqvC4Lp5g4ptrI+kwqxYHEizlD928Y9eop8WpVzvwcUjbfP6Zro
 sWHPc+TFcL74UOezDTQtLJcJ9egssbKYwhNkvVYBzMceeDoACkfYuicCA
 ra1bWC/DoMdpZiQ19qIAolQOztPiCCjuLMEFkcqsrhEM/3Zi07IGPGZ46
 xRv+6B9ixezcYxS1BAH0RpOZHhhCKGQ+KuF6QEsd9BE8lRCXgGNK318+8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="16702654"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="16702654"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 07:54:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="911485580"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="911485580"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 07:54:36 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 07:54:35 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 07:54:34 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 07:54:34 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 07:54:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUsQROwMfEydVLlifSwsJkG/Xc59lt0ddi6/a+05d2OzUg8a5gjhwV1Z/4EmrFd0UH9/g2H9l6zNgMVxF/S/Ygag3D09vH8Flo2NJsdYMgT58DVQQ31L/vMud1TojEDNd+6SfaReY3afcUEzt2m6tMUrROp+O8VyohK4o1MnLPgQ7tlld7c0qdpAkFo7rVTZ1UYRxVPcszVGyTdscJN0soFZzwuZHN2llxPmMPsVpPpVekBukUpJdtqVhxsATcO44ferARsnYGKT8aaC/eaS5Ln4w1UcE14Mqj3ydrv+KDB2V8a62puvkUbAxcD5N2eg+R5zn2nteE6tAcwyVgwOgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itYa6AIxZa9U87/2/NOiRtdmstewcSdqKih5j+A20PY=;
 b=lvfuk8iZu0rt6Xfe13zcnlLAqbTKTgDhJA0EVFlx25RCqsXm00oMtxYq0DwVhdiOKasDzGZpWhbBNPoE9W3CJ7hgLkYvvijjbuvStp1ObROyBczDIoORvBnbx2/9Oz4tl9LjOaDGijWC0mUNkdefpc/iVXAzycz5FmxICWWzuNZ2w+b+GtpK25Gd3FZ3mhNKLgQ4FWOYHTRBVqhC+MtZVrqQ68OXvgLNhc/F/uFd5yXD1zcULd8/TWtWtqmMp3LFPeAQfdBtQulrjWleNnJceTozsn4Z0PjMoEKSgxoKnnrI41yvvqBL/KEU5E7Cfske8u1sEVB4fBE94/xqLrXnIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CO1PR11MB4788.namprd11.prod.outlook.com (2603:10b6:303:97::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 15:54:32 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::9ccf:6986:9706:16cb]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::9ccf:6986:9706:16cb%6]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 15:54:31 +0000
Message-ID: <57a51297-891c-4ee4-99e5-f209ac1928b6@intel.com>
Date: Tue, 30 Jan 2024 10:54:28 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] drm/xe: Add misc functions to support read of
 specific DSS registers
To: "Souza, Jose" <jose.souza@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
References: <20240129181742.183694-1-jose.souza@intel.com>
 <20240129181742.183694-4-jose.souza@intel.com>
 <20240129212408.GM5506@mdroper-desk1.amr.corp.intel.com>
 <8bdf5c3d85a1fd599a40bc6537ce79531bcf474a.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <8bdf5c3d85a1fd599a40bc6537ce79531bcf474a.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0299.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::34) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CO1PR11MB4788:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a5b3597-b79e-4cc2-8c9e-08dc21abbf73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: almr8dFYWTvlIPhI7W7Kxx8CD3GCEZgqntHHAsglY+Wz8s5Nh/ox6l7DBr4yTUWtbOr2rTgdELVeYSIFyA56VCwtWql7v2cWyJysKSirxg+L8RxZKgcb6yDtnRHMo0jz5A0Su8aa56NP3OlTuNWt79b1jpupf/4Mps51YwbOh+UMu/ZA57cOSETAGO3WDYCdwGtDE0t/wiM/3O/l0DbDEr79+hGSL5S/thOBAF0u3V2ayp6YrAGE9+dGfXrb4TfCQhmtR+4mtGFoye2BvVht/0pR8aRFWnJIH/Lavn8QxADymIoJQo4AApjLJRvNQcGXKFlacxwcizbcw7n64opnOviuroBwHZN83kV20iXYtKvIt56Wt76WTfkSJmcKRm9Hm0gdxcaf5r2kp3PD9q4fG5B0Aulk7Mal5OmbOf9ETXlPeLFfdkp62WUzQSgJtD3FfoyJbXyu7s0Nr9UGcbtJZj4oWZI6Z0EeCN5BhJcAhckAJOeEjjRWFQYZAWxbOvWxkNzAiAQ4e7pLj1bYngJNDZvc6/L8me1oUeY0+L+8/4fx7klY/usZwjgs2/gVxxq0NKaotl3i75ebPJTPHnqOd8p4mW4LePnpYx1Ii1KAhb1QeFx9W077O5o1fpOYJyYibMKIruhMpFcB26GAV0pLmH0L5FFBaLH/rFQou3R2djI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(346002)(366004)(376002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(41300700001)(66899024)(2906002)(5660300002)(36756003)(66556008)(86362001)(66946007)(6636002)(66476007)(31696002)(83380400001)(110136005)(316002)(478600001)(53546011)(6486002)(6666004)(26005)(2616005)(82960400001)(8936002)(6512007)(8676002)(4326008)(6506007)(31686004)(38100700002)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXQ0Y3BralBMUEI0Q0VYMWN5WW1lYXJuNVZuL2NZWWhrMmRkTzNSdU9DamFz?=
 =?utf-8?B?TEFxWnZFazA0UllDQjZKckJkOUcyNkhpRy9BY0hrTjBlVnQ0bGsyUEhTUHBW?=
 =?utf-8?B?N0RiZC9HZjZuci9QbzdGdDIyUzdMQ0RSMmFCOWFwdzFheWR4d2NHR3QyZ294?=
 =?utf-8?B?b2w4a0dpNkJ5d2Vad2FIRUNkNWNXYkVNOHpxSGg3Rnp5N3dXcGorb2dIc3VU?=
 =?utf-8?B?RFoxN3ZrR1hOZklodlZSQjU1V2cyK3prTFZacTBpdHRpZzVDYTRwSXdQYTQ4?=
 =?utf-8?B?WFhPa2diSWtmYVdIcThiMFZTVTFFUWFvMmxGSFVZSFpjbGU4eVhpVDM5eDI2?=
 =?utf-8?B?U3lVdXZBSUo5MmVQQ21mcjlMSGRuWTl4Q0JWYm0wa0ZGU0pRcng1eFpueWFi?=
 =?utf-8?B?dVZNV0MyWUtZMXgwa1NUc2FwVUFVQWlCc1I5ZjlDV0ZMNFJDKzJSQW5GSzF0?=
 =?utf-8?B?ZVJidmpqV2RYblF5VGRjcW9jMzcvUEF4OElzL1N3dHNXZG4vekQ2RDNqTXNB?=
 =?utf-8?B?bDVIaEtGVlpuOVByeTBGSlNsSHFzTFdVcWtUNWxrZmhYZ1hKNTBoY0hCR040?=
 =?utf-8?B?dmdYK09KS1pGaFpxcE1TU1Z1c0RWOTNTUG01OHR0Tm9HUm9rbXdKZkYzRmF0?=
 =?utf-8?B?WUFNYWJoS2VaSzZoQU5DWkdPS1hobC9MUk9uUE90bWJRWE9CVzFEUjBzeDJn?=
 =?utf-8?B?MDBmNnpKcjJQZWluS3M4SEdWbWFtR1UxdHNiVE5DTjBEc09BakkyY3JNaDUx?=
 =?utf-8?B?bUNsMWp0UzNwTEF0clliUG5qYkU4TzJJbHpNY0pEcWFGdnJnSnEwVDI1V0Rp?=
 =?utf-8?B?QjdhVlZBRFo4cWdRZ2xvWitXVDVLNkFYK1V0U1I4dWxpY05nTjZsaHBhOUlJ?=
 =?utf-8?B?OGZDMVFkc2thbDBNLzdrT0dKb0ZaejRybXRJM0tpTi9pNHVwYjQ3eWd6RzBH?=
 =?utf-8?B?OHZFdm5FeHFCeklyR1VPTjJ0bGpBcnUvbDdRSkpMTStyRnFzRFRLU1htYS9I?=
 =?utf-8?B?bnBoelhiVy9XWUlCS2ZyVGJMMjcwdXVZMVVJZlhWeWdHcElHVCtZYkpKOUhP?=
 =?utf-8?B?UjNCUEx4eVh2ZFF0V1JleGdLem9neGlubG5uWTREVk4vU2d2eTdZeWRVaHFo?=
 =?utf-8?B?MGRFRG9pbTExVlNUbytxWFJuWmV4aFpUMnBpRDAwNXh3cmFZZmFTMHA2UDBI?=
 =?utf-8?B?UnIrNUxyUEpHSWx1c1dCUjJvaFVKTmQ1SGhlM0N4d2JxamEvSlJaMXJ6S1Bs?=
 =?utf-8?B?WjNObTI4S282K1JaaWNwZFAycWNaWFpOVnRGRVBGWUszU3RFalF3M3hCbG5r?=
 =?utf-8?B?SUtuTHVnaTR4OXVoMEQxZEFNcmk1Y3ppd0VxT0JKSEdkdXlFaGVGUm5Tck5K?=
 =?utf-8?B?ek5kRG0vOGRmKzFvYXlUaG8vbCtsTmhrZlZmNVJiM3U4QUlYUHRMVjFtdldx?=
 =?utf-8?B?T2xhR3pWZkV6cVovdUxhcGwvMTlEbEUwTWJGekFkclBwZHNBMVFUQ3NndkhH?=
 =?utf-8?B?VDNlS1Yxc20vYTUyYjV6MjFSWk5qaDRKclRKVXRiYzVxeEgwaVJUV2hyL2E0?=
 =?utf-8?B?V015Zy8vRnZZSFhoN01xZmtXNFdCdkVQeW5WMXIvcEFBdXJnbHJrNlZiOTI2?=
 =?utf-8?B?SnNKbkErRTU4Y1dyMEhNMXpYSC9IRER5ZHRjdzYweWs1aFJMaWpKcDBrS0lw?=
 =?utf-8?B?ckUzQjJpdlhnQ2NJYXdaM3dqdGxsbllib0tVUVVzOWpkM2lENFNhZXRQNlgx?=
 =?utf-8?B?OEhTTFFCdlduVlR0Sm1CaXFEWFlwUXNpcDJGd04rNi9kemt0ODh0WGlwa3do?=
 =?utf-8?B?R0JSaUx4aER5cm9yRXZJMkVScEFQd3FqT2dRenVGN1BUVFh6OVZ6aTBZMklG?=
 =?utf-8?B?eVlCUHQyQ1g5Y1hBd3p3bEMzMmhNMndJb2tFSW4wNVV2M3JSTEZEbk0rKzVS?=
 =?utf-8?B?Vjd2NnB6T09SRlkyTFNXaS9ZeEJjd1pYMFpZbXVEeEVQb2RmR3N4bmZVbEhD?=
 =?utf-8?B?ckx3QjlZMTVYSnkyRUF4cUtsQVZMZ1ZaUnZuMDNLejRINVJ3dElBSXphb0Vh?=
 =?utf-8?B?VGJONlVIUUFCekM2QXYwY0dRQ05GZk9XT1BxUlhJKzN4cDNTVmpydVRqbzBL?=
 =?utf-8?Q?RcYdNPbAsaW5Z35rroNupUUf5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5b3597-b79e-4cc2-8c9e-08dc21abbf73
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 15:54:31.6459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+OByOrxZu25rPlZULAmSSRV60igPTsI0+9g3TdTFQBez5EYusVWvN3w3DA6I1Gp02IE/wajDv+CunMIMAQxmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4788
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 2024-01-30 9:42 a.m., Souza, Jose wrote:
> On Mon, 2024-01-29 at 13:24 -0800, Matt Roper wrote:
>> On Mon, Jan 29, 2024 at 10:17:40AM -0800, José Roberto de Souza wrote:
>>> Next patch will read register in specific DSS registers and this
>>> are the functions missing to do so.
>>>
>>> xe_gt_mcr_get_dss_steering() calculate and return the group and
>>> instance that will be used by xe_gt_mcr_unicast_read().
>>>
>>> xe_gt_has_geometry_dss() and xe_gt_has_compute_dss() returns true
>>> if DSS is available for geometry of compute.
>>>
>>> for_each_geometry/compute_dss() to simply the iteration over each
>>> available DSS
>>>
>>> v3:
>>> - add for_each_geometry/compute_dss()
>>>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_gt.c          | 17 ++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_gt.h          |  3 +++
>>>   drivers/gpu/drm/xe/xe_gt_mcr.c      | 17 +++++++++++++++-
>>>   drivers/gpu/drm/xe/xe_gt_mcr.h      | 31 +++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_gt_topology.c |  1 -
>>>   drivers/gpu/drm/xe/xe_gt_types.h    |  3 ++-
>>>   6 files changed, 69 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>> index 675a2927a19ef..9a3dce45b92ba 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> @@ -795,3 +795,20 @@ struct xe_hw_engine *xe_gt_any_hw_engine_by_reset_domain(struct xe_gt *gt,
>>>   
>>>   	return NULL;
>>>   }
>>> +
>>> +static bool has_dss(xe_dss_mask_t dss_mask, unsigned int dss)
>>> +{
>>> +	unsigned long value = bitmap_get_value8(dss_mask, (dss / 8) * 8);
>>> +
>>> +	return value & BIT(dss % 8);
>>> +}
>>> +
>>> +bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss)
>>> +{
>>> +	return has_dss(gt->fuse_topo.g_dss_mask, dss);
>>> +}
>>> +
>>> +bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss)
>>> +{
>>> +	return has_dss(gt->fuse_topo.c_dss_mask, dss);
>>> +}
>>
>> It feels like these belong better in xe_gt_topology.[ch].  Ideally we'd
>> keep all the low-level representation of the masks abstracted away
>> inside of those files and just provide a sane interface for the rest of
>> the driver to query whatever it needs.
> 
> sure, can move it.
> 
>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>> index c1675bd44cf6d..36815d8cbc107 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>>> @@ -70,4 +70,7 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
>>>   		hwe->instance == gt->usm.reserved_bcs_instance;
>>>   }
>>>   
>>> +bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss);
>>> +bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss);
>>> +
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>>> index 77925b35cf8dc..e76cb0ae457aa 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>>> @@ -291,11 +291,17 @@ static void init_steering_mslice(struct xe_gt *gt)
>>>   	gt->steering[LNCF].instance_target = 0;		/* unused */
>>>   }
>>>   
>>> +static unsigned int
>>> +get_dss_per_group(struct xe_gt *gt)
>>> +{
>>> +	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
>>> +}
>>> +
>>>   static void init_steering_dss(struct xe_gt *gt)
>>>   {
>>>   	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
>>>   			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
>>> -	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
>>> +	unsigned int dss_per_grp = get_dss_per_group(gt);
>>>   
>>>   	gt->steering[DSS].group_target = dss / dss_per_grp;
>>>   	gt->steering[DSS].instance_target = dss % dss_per_grp;
>>> @@ -683,3 +689,12 @@ void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p)
>>>   		}
>>>   	}
>>>   }
>>> +
>>> +void
>>> +xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, int *group,
>>> +			   int *instance)
>>
>> I think you're primarily adding this for eventual use in the
>> devcoredump, right?  But I think there's also been some other series
>> trying to add some MCR registers of types other than DSS (e.g.,
>> per-mslice registers and such).  Given that, maybe we should make this
>> function more general where you pass the MCR class as a parameter too?
>> E.g.,
> 
> Yes, need that to get instdone registers for the Mesa error dump parser tool.
> 
> Thanks for pointing that Zhanjun was also working on that.
> Looking at Zhanjun patches looks like we had almost the same functions but he is using 'ss' instead of 'dss'.
Yes, we are working on the same functions, sure I can use 'dss', no problem.
> 
>>
>>    void
>>    xe_gt_mcr_get_steering(struct xe_gt *gt,
>>                           enum xe_steering_type type,
>>                           unsigned int id,
>>                           unsigned int *group,
>>                           unsigned int *instance)
>>
>>
>> BTW, I think Zhanjun is working along similar lines to what you have
>> here, so you guys might want to sync up?
> 
> I don't think the function above is needed, what do you think Zhanjun?

This function is to get group/instance steering from dss id, the only 
place used is by for_each_xxx, the macro call this function, loop with 
dss id, check against mask and call a code block, that's the typical 
usage. For Xe, as we are using the g_dss_mask and c_dss_mask to test 
bit, the converted group and instance is not used, so looks like 
xe_gt_mcr_get_steering could be optimized out and the for_each macro 
could be optimized to:

#define for_each_geometry_dss(gt, dss) \
	for (dss = 0; dss < XE_MAX_DSS_FUSE_BITS; dss++) \
		if (_HAS_DSS(gt, dss))

*_HAS_DSS means xe_gt_has_geometry_dss/xe_gt_has_compute_dss

The above is based on only this macro calls xe_gt_mcr_get_steering, not 
sure if Matthew has some thought about the steering_type?

Regards,
Zhanjun
> 
>>
>>
>> Matt
>>
>>> +{
>>> +	unsigned int dss_per_group = get_dss_per_group(gt);
>>> +	*group = dss / dss_per_group;
>>> +	*instance = dss % dss_per_group;
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
>>> index 27ca1bc880a00..9f5f7dbb6fca8 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
>>> @@ -7,6 +7,7 @@
>>>   #define _XE_GT_MCR_H_
>>>   
>>>   #include "regs/xe_reg_defs.h"
>>> +#include "xe_gt_types.h"
>>>   
>>>   struct drm_printer;
>>>   struct xe_gt;
>>> @@ -24,6 +25,36 @@ void xe_gt_mcr_unicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
>>>   void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
>>>   			       u32 value);
>>>   
>>> +void
>>> +xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, int *group,
>>> +			   int *instance);
>>> +
>>>   void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
>>>   
>>> +/**
>>> + * for_each_geometry_dss - Iterate over each DSS available for geometry
>>> + * @gt: GT structure
>>> + * @dss: DSS id
>>> + * @grp: group id to be in xe_gt_mcr_unicast_read()
>>> + * @inst: instance id to be in xe_gt_mcr_unicast_read()
>>> + */
>>> +#define for_each_geometry_dss(gt, dss, grp, inst) \
>>> +	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
>>> +	     dss < XE_MAX_DSS_FUSE_BITS; \
>>> +	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
>>> +		if (xe_gt_has_geometry_dss(gt, dss))
>>> +
>>> +/**
>>> + * for_each_compute_dss - Iterate over each DSS available for compute
>>> + * @gt: GT structure
>>> + * @dss: DSS id
>>> + * @grp: group id to be in xe_gt_mcr_unicast_read()
>>> + * @inst: instance id to be in xe_gt_mcr_unicast_read()
>>> + */
>>> +#define for_each_compute_dss(gt, dss, grp, inst) \
>>> +	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
>>> +	     dss < XE_MAX_DSS_FUSE_BITS; \
>>> +	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
>>> +		if (xe_gt_has_compute_dss(gt, dss))
>>> +
>>>   #endif /* _XE_GT_MCR_H_ */
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>>> index a8d7f272c30a0..c4942f2b37751 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>>> @@ -11,7 +11,6 @@
>>>   #include "xe_gt.h"
>>>   #include "xe_mmio.h"
>>>   
>>> -#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
>>>   #define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
>>>   
>>>   static void
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>>> index 70c615dd14986..bb6dc1fcaa7dd 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>> @@ -25,9 +25,10 @@ enum xe_gt_type {
>>>   };
>>>   
>>>   #define XE_MAX_DSS_FUSE_REGS	3
>>> +#define XE_MAX_DSS_FUSE_BITS   (32 * XE_MAX_DSS_FUSE_REGS)
>>>   #define XE_MAX_EU_FUSE_REGS	1
>>>   
>>> -typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
>>> +typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];
>>>   typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
>>>   
>>>   struct xe_mmio_range {
>>> -- 
>>> 2.43.0
>>>
>>
> 
