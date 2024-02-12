Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516EEC48297
	for <intel-xe@archiver.kernel.org>; Mon, 12 Feb 2024 19:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1427710E3EC;
	Mon, 12 Feb 2024 19:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G+WettRO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC8E10E3EC
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Feb 2024 19:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707764922; x=1739300922;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6f462o1V85Vz+sAOxB5RO+BFKsDUVaQtGOz64n5CfQs=;
 b=G+WettROAhtSyoFLFGe0eFZePTTsa/g0fsayA31lnBEwSj1MQFGXDa6f
 zjD7CqrqWYo/tl3gPo+bQ5NqI/bplKtMZ6dlRvlal/jpBcgwanlleaE4p
 lnaYwG4emXTS7oMa60X2Kqa1i/KjWtFAdyN6psSPhHaoYWXoOxOpZrUJ0
 5TQd21GX71MG4EluhYlMrwqStvC4uOl31hXGmfq87hE8ZnGJm3+eYWzRu
 TedCpf6H2KXpLWpHk6yxTtewSjnp2NbAHqBimlvxZ/3JcFWyyuChY31Qz
 iU0cZTArBEfUByMn1MS5FppGZX7mV2aiPHot9RmX2kv85OVqY79tgBm33 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="5577057"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="5577057"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 11:08:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="825890444"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; d="scan'208";a="825890444"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2024 11:08:38 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 12 Feb 2024 11:08:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 12 Feb 2024 11:08:38 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 12 Feb 2024 11:08:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIH+CHGSAmf3IlEGftLaP78cCKNQTSTrVoqLyyv+YtJC+sMW0joElho12SfW12J1qPyi/KQI56Dg1V2y5ye3VGXamRagsH/EXxFrv5GOM/vJb9h8D9CxeLaxDzsaZ8s6XawxQNji8Vi/PYXtFj/Hojab6XslKcEUmp2IQ84UN22xkH0yfn5WzcAquHMgLdE2Y4Blj7pJ1Y8rBoZqFiB6zaszB9FVoKIK9MEcMjoUZ6P/n26yPf+hQ6kdc8Os6hkAdDKGsdQJOe89JwzaDi6oDGWB/3hBQKoKxKT4ARdY/sP+zo+W/TEBiRgD4/e9+3R8KlOi0kABGkVyXemY6ju6Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fJIwTSDwAk0Sx46Sjr0TrvbnqyeW9Eiie+tVpjU9x4=;
 b=coGB1B7tB4HVTv+KFz7/RqFChZcKKCR/PuyWopbe5CltDqamjBgtn1FpW66DGvW0ro01sBxpooXLgU+SFkBGwINbvWWwIRPtpreRe/w1Zn4Z5Lmtdkw1fEbGqk1KpYlqRDh9xkdenER0q3Hl9phNuw4q1dTu3yCZhy0svWw+T7c5Fg2wjeVEIxhVzbEdY79jIRrXj/HEXElHtZgWPSkG1gGgmDeLkZmsCzQUnHe5eMCj1yRBNBFVzYX8M/t51mJJSwO1LESus4xcFTpjt+gee5HmQkU0EstAnW0TPcAB6pCisW/XiC8vc4GAwkxof4Vgp/a6K6iV4UxVO5MsENvx4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB7288.namprd11.prod.outlook.com (2603:10b6:8:13b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.37; Mon, 12 Feb
 2024 19:08:36 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::152d:16f5:ab9a:7c6e]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::152d:16f5:ab9a:7c6e%7]) with mapi id 15.20.7270.036; Mon, 12 Feb 2024
 19:08:36 +0000
Date: Mon, 12 Feb 2024 11:08:26 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 06/16] drm/xe/oa/uapi: Define and parse OA stream
 properties
Message-ID: <ZcpsqsRhEk9UyTGg@unerlige-ril>
References: <20240208054916.3788133-1-ashutosh.dixit@intel.com>
 <20240208054916.3788133-7-ashutosh.dixit@intel.com>
 <1c3fef48-f59b-440a-bfb7-275fb5f5d57d@intel.com>
 <857cjewq1s.wl-ashutosh.dixit@intel.com>
 <ZcpqDtxxGxc5PRv5@unerlige-ril>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZcpqDtxxGxc5PRv5@unerlige-ril>
X-ClientProxiedBy: SJ0PR13CA0171.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::26) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB7288:EE_
X-MS-Office365-Filtering-Correlation-Id: 43870824-deb6-4660-2886-08dc2bfe0358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lfsWKoFV0rvq8QYrGDm4Ea17NmSBpTijuHLlQjhDE0eIpHRit1UFyXXENHYSEmd69g3LEaFyoSLpDW3nnFlOkPQN9otDEq8ux5+QPiEQrjd24c4gJQDW0rf4P5XwKiFMx4S5+WiB47et2GWnjqZteVv/MKB6m7RohNTYeQppZhleAh9RzlB5I3f1WAjoBUT1YXjFBqpo5wtPyRK2quJ1gQZhCsve0X89GmebU54kHFUaqztcriyaNDHFJ42EXxcLkuw7zipPw9h2UGHooVyOAC9KomM1vyMTKxFP4FkBAIl8ThmoBacwdaoG2tWkM8+CFHnFHpP7SEKdUNn+SkVHYk2P9VAyOQRDuHZYgyfJpZJGjszruimO5iSqqFe0UMRQehIEC2aDKbB8J8M6xZ3IgyeuHi/F+pMCPEr3l/stwAg0OClRMWmsIqaDSHZDz1MS8PuinARAQClPOHM5Mqe3etWnwWz4MpFCeIhp19jtFVKZkZ808N6daDdECIsauuNpIkatyyiaSLOZEcSI7bDxui8hGjwPxiQvwpeo6J1CWEk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(396003)(376002)(366004)(136003)(39860400002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6486002)(478600001)(6512007)(9686003)(966005)(41300700001)(33716001)(4326008)(5660300002)(8676002)(8936002)(2906002)(6862004)(6636002)(6506007)(66556008)(6666004)(66946007)(316002)(66476007)(83380400001)(26005)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDlYbHhCbm83OU10dEFuazVEc3lpVU9HZzVxc3lLMVM1TnAvRDNIemsvUExX?=
 =?utf-8?B?WUM2TzRxUVNKQnh3Ri95THdOU2J0a2xtaTZreHdTSE1rd1gwMFVndEFEeSsw?=
 =?utf-8?B?eG85Mlk5TkN5eFc4bVllQzBaeGVqZ0JjRE5Yc1ZBcFNVV2xTSnVxcnV4NUxL?=
 =?utf-8?B?azZrYnNMa29uWVM1azlKdzR1MG9wcEM1eWo4N0VHVzVjeGs2MkgwN1FmN1dQ?=
 =?utf-8?B?SG5iN0tubUFwWG0yNnZNYzc4UFBUNFZVNXhiMEZKa1RkRGR4U3Y2Y2U3N0dl?=
 =?utf-8?B?WUUwTTg2YThhMkpRT0F5eEJVaWVyanE1Uyt5OVhHWTNuVXkwVXpNVkptd0JM?=
 =?utf-8?B?V1FyTXZUN21xa3ZvemU0eTJnVE1mOTBYOWMyVXF5R1p1ZW1FeHlGSUZkc25T?=
 =?utf-8?B?ekM2Z2JxN01tcVcrS21QZWV2dk9GYmdvdkJrc1VwRGttS3ZCZ1BhaUZqa25z?=
 =?utf-8?B?YXE2S2E0YWNWOEZJRndqQ3d2TFBYcUhYRGZIcFI5cnlqZVpPSkQ2R2lyZ1Vl?=
 =?utf-8?B?cGJqNlErTW1haFFMOSs5c3lCaHFGR1Q3VjF4amRBcmtRZDFnTm9nU0p2dnZB?=
 =?utf-8?B?c0xrYytTRFcxZDJYZTAyRUtUeUI5OUhHdWM0am9WbUtzRkRJdUtsbkx3M0pp?=
 =?utf-8?B?WEMzbm5ybzc0d0Q1RFFoN3UvSDRYKzRDRi9pY21xWnNXVzcwdXJWS0lSUU9R?=
 =?utf-8?B?dmlPSTZXK2FiUTVPWUhnNVkraktvY0kzQkdCRTlEWEgycDJ0VG5DaktGNWlQ?=
 =?utf-8?B?dmpUVHR1Z0J1NXVBUTA0Y3lqOXBwNjVVcFBUM1pRMlhSQTVyQ0lIdmJKR3Bk?=
 =?utf-8?B?SG5BS1VKZ3Fqc3htbFdmbGpLL08veGFZd1NPbkRQYkE3RmozNzVqaU8yZFU1?=
 =?utf-8?B?YUNXcHhLekdyRzR4VkZHbFViNE9pdUF2S0dUWHhEWjRnbWVYTmwzMVpaZHJU?=
 =?utf-8?B?VWdzVG9iamhNQlBvejFSMElpYk1RSkJScU9TekR6MHA4MTkxQS9IZTVKcFpW?=
 =?utf-8?B?NlN2UEN5RzJWMzlBL0lmK0t3L1phcExXSWxKVjdnU2ZxUGh3NE5OdWpaVEF5?=
 =?utf-8?B?MUhRbkxyNGRCbXVIaEpzSlZyaXVobGxwRGV6bk1BMVgyaGRZajd3TlBudXZJ?=
 =?utf-8?B?OXNNWnpoWTNZbzk2U2hVdzFEMWlTS0hGYjhPMTBrb3Zxb0N0dDc5NWljUkI5?=
 =?utf-8?B?RFA3ZUozUkxXQ0did01qUmxyWmgyd2dtUmZydFB6ME9Hems0OVY3SVUyMHFx?=
 =?utf-8?B?QXhEMTJ2dHFNUmw5NkhRU3lacXZWUC9QZlByV2tPTW9VajJCMml1YnI0K0Fl?=
 =?utf-8?B?bUgzNWZJcW5aSER3VjEvSG5YdTBrUjJNWlJEZnl2S1dxMUVURm1PNTc1T0Q5?=
 =?utf-8?B?OHhMYjB2RGJEZlpKT1dhK1ZNTmcrTHp3NGNKaWRZMEVLMVVsemN0ZWFSbUdF?=
 =?utf-8?B?ZXd1Y3dRODZVbTJETkExU0Z6ME5hUTZLVzlGN3hQcVNXZloxZW5GUWlJRmJp?=
 =?utf-8?B?SEhGUFl1bkhKSFN3bzUvQW5XVHBibDdvZXQwVjhPdVUvVlFRL2ltQ2RLK1o5?=
 =?utf-8?B?MlNSQXBuN2ZVbEE1cDI2MDVnMUl2aG9QMmxNOVNvZTAwcDRSeGJNTkdub3dN?=
 =?utf-8?B?SEYyTHNCVVJCMXR0bmo4NVhNblN0czlmbTlqajBaWS9aTkxqSEN5V1VLekVt?=
 =?utf-8?B?eVcxQ0o0bURtS3piZ3pwQXE3OStHOExiaFJWZURmQUFOdi9lY2M5eUZXODl4?=
 =?utf-8?B?SnRxQytCUWJIbVdpZlkzU1V1UEdDZHNiNG5idTNoZU5ETjVNL29teU9Mb211?=
 =?utf-8?B?VGNsRzY0ZWQ2NzRReXl4ZVU2WU5PY1lMamhoRzVzVDNQaWQrS1I4bmllcXZl?=
 =?utf-8?B?dExOcEEwYU9HS0ZxNms1OU5UYlFXYXRYTEpkZSt0ckdLejBsL2VmLzUzV0xB?=
 =?utf-8?B?QlQ3MGpkWUQ0ZFA0cUYwcjVnUWRIcXBmQjV5djV4UVhNaS80UHN4QWRScS84?=
 =?utf-8?B?U3ZyckE3TEVQZmtTU3VaNHBDSnZOajBQYlZZRU5RMjN0SXBocjBiZHM1TlFC?=
 =?utf-8?B?b0RES0VaYkhOalEyNlFZWDRCME12NGhwVVNOM0tYb1VTV292b042a1RPa3JU?=
 =?utf-8?B?Nk9BUnFPcXl6SnRNWWhiTFVJbTVpV3I3RW9KZ3FlVVFmaVNZeGZuWnpnUnkr?=
 =?utf-8?Q?BgU5L7r4+jN2sxMJdZIXAdY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43870824-deb6-4660-2886-08dc2bfe0358
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 19:08:35.9301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iDR4sF2/HZEfSaoMtnisSvhxI0XOK97VB2f0QSvGwCP1+EP9I91uUdcf+dkWOvH4qsPKb+b6gPuQS66g3VXZJNQyeKxZzF6aGWfP8KfkGn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7288
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

On Mon, Feb 12, 2024 at 10:57:18AM -0800, Umesh Nerlige Ramappa wrote:
>On Thu, Feb 08, 2024 at 02:26:39PM -0800, Dixit, Ashutosh wrote:
>>On Thu, 08 Feb 2024 13:40:29 -0800, Lionel Landwerlin wrote:
>>
>>Hi Lionel,
>>
>>>+
>>>+	/** @DRM_XE_OA_PROPERTY_OA_FORMAT: Perf counter report format */
>>>+	DRM_XE_OA_PROPERTY_OA_FORMAT,
>>>+	/**
>>>+	 * OA_FORMAT's are specified the same way as in Bspec, in terms of
>>>+	 * the following quantities: a. enum @drm_xe_oa_format_type
>>>+	 * b. Counter select c. Counter size and d. BC report
>>>+	 */
>>>+#define DRM_XE_OA_FORMAT_MASK_FMT_TYPE		(0xff << 0)
>>>+#define DRM_XE_OA_FORMAT_MASK_COUNTER_SEL	(0xff << 8)
>>>+#define DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE	(0xff << 16)
>>>+#define DRM_XE_OA_FORMAT_MASK_BC_REPORT		(0xff << 24)
>>>
>>>People outside of Intel don't have access to the BSpec.
>>
>>Hmm, I was assuming Bspec is public, at least parts of it. Since we keep
>>dropping Bspec references in patch commit messages?
>>
>>>
>>>And since there is no page number either
>>
>>Page numbers are in the commit message, but you are right, they should be
>>added here.
>>
>>>, it would just be easier for everybody to say :
>>>
>>>     "Refer to the oa_formats array in drivers/gpu/drm/xe/xe_oa.c"
>>
>>Umesh, what do you think about this? I don't like the idea too much, of
>>referring to the internal implementation in the uapi, but if Bspec is not
>>public, and we want to keep this uapi, we'll probably need to do this.
>>
>>Also, we are directly returning the oa_status register in response to
>>DRM_XE_PERF_IOCTL_STATUS ioctl (see 'struct drm_xe_oa_stream_status'), so
>>that also needs access to Bspec. But there I think we can just document the
>>relevant bits in xe_drm.h.
>
>If that's the case, then based on the PRM documents, I would just put 
>this in the comment -
>
>"Refer to performance counter report formats under the Observability 
>section in the PRM"


Missed your comment on the oa_status reg. In general, we should avoid 
exposing the register as is in the uApi. Instead we should just have a 
set of enums or bits that define a particular state. That would do away 
with the need to point to the spec.

If you disagree, then PRM reference should be good enough - OAG_OASTATUS 
register in the PRM or Hardware Specifications.

Specifically from this link:
https://www.intel.com/content/www/us/en/docs/graphics-for-linux/developer-reference/1-0/overview.html

Thanks,
Umesh

>
>Thanks,
>Umesh
>
>>
>>Thanks.
>>--
>>Ashutosh
