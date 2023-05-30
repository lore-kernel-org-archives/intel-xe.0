Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74708C7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 12:55:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DF610E0A3;
	Tue, 30 May 2023 12:55:09 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2659410E0A3
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 12:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685451307; x=1716987307;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=24NXfK+s4qvlE76MG5GgTXbgYi1NPqrqKUGHEqFobT4=;
 b=j7aIIlQvqLNpIRkAeaLMCXoW+aVTgGfRLgf1siis4huPF9yUo/MTpiAT
 Ck6TjgS869WfDI/nZoiU1ZeMUSSnNBfLgeo33/A8gawV3MMTWBGiv+RUX
 26RY4WBM/SRH3ugYAgFlDbxAIBTLBxm+QDkbEgihGxd5W0sy3h7JfD9cg
 dgbe3QFMQTmOYYfZ9QGP+gdEZ/VRVsQxgW2XiohjrDe8nR0JGUxBazn92
 sfh5n1BFPm3NyBOyByzQxHg2C4Pm7x5qFyba5Wke3koFBt9OpUSCsNdAW
 UiC8btcywaNCvm4rqiIhva4KcB2tGTZAJb4jbcGfor4BhFv+OlgmCupFu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="441261616"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="441261616"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 05:55:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="683950683"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="683950683"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 30 May 2023 05:55:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 05:55:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 05:55:02 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 05:55:02 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 05:55:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=blhNAsenYFJo+AzlLAoLglbxlhlaO5B/xdTphZJHkZsMgPGP3SkO4iBhKiCCtHyURZA1MN7OmTNbtI9/7jhMYuoHma/V+J7RQBfdFj0YcEClB4m9rXVuwJDZp7LU2k3BeFebvpltqEYZPO6F6+tz09mSqDtosK8mXNreB7q0Gr/0pxflSeFtplPPzSQUG6E9mQHzD06IFnq3DMy1O5jj6+smglCRIzr2YaclV8Kk9qHkCrgs+iXFCe4XIpzpmd70TaicaxGEKVAZWPx4L5W7UlFb/Tel2wnAV2J2NuME/QvztRanCz/Xw3dQFLpSo01q9jNowyP9wmGGMCimJIv/zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzd8x6RfIvwDZLZU2SXIa9qKdbWRpkEm9aZxJcrQIFk=;
 b=MRoaH3DLo+Fo/eNQPo/9jHUuZSWE50SmyARfv+uHtZWU/D6mOS8ndZjc6G42U2Dt5nHxNGv40c1vNXi1lWjOmwA8MEIBlTqeJAJNhQE2qdIMQ/SFvAJ3JI/pSlykH65rwekGlj+3kas7LnCpHClaPgErgncBBYkzm304QsmRV9JcBafHfWoiJ9nIRnThK+jpdVKTR571xmn6s2qGadQwUisyZb//51Vq0aKm1+zydvwT9Wzm3xWwyrG38r3AfwniKidPVmM8zEInylkAWLt/BllV5F9/6EYsQ8vAx9TfNv9qnyLb6qNaGmDpb+c/mr6716GUWnGOkCHHu6kDKRV5rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SN7PR11MB7020.namprd11.prod.outlook.com (2603:10b6:806:2af::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 12:55:00 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6455.020; Tue, 30 May 2023
 12:55:00 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <szxnvedtttjyvxsbcwu5hqs2bw5qz6xlabqueurhy2fwsofd24@lzr5djyebxgu>
References: <20230525232406.688875-1-gustavo.sousa@intel.com>
 <20230526001038.GJ10045@mdroper-desk1.amr.corp.intel.com>
 <168506366187.3319.4933213415417310598@gjsousa-mobl2>
 <wjqnree2qplqlfkwuzxcfujob53ooe7ccdenzvypymjjecam2u@p23d6xn3mwi3>
 <168539689700.259912.17352008220425971440@gjsousa-mobl2>
 <szxnvedtttjyvxsbcwu5hqs2bw5qz6xlabqueurhy2fwsofd24@lzr5djyebxgu>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Tue, 30 May 2023 09:54:55 -0300
Message-ID: <168545129566.51912.15897016718209439905@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR05CA0094.namprd05.prod.outlook.com
 (2603:10b6:a03:334::9) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SN7PR11MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: ab7cd0e7-69fd-429f-cd7b-08db610d13b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zMz2RhBqpe543jzkcjfjH1CVZoTHnhOBR4aH0OMC9yqBrmStlgTsYjh1pLERjFvDxp3wHcclq9iiIXo3/MB3ZXAzjNg3K+7J7D0znj+8CSy0z4hwpON7+9ygh3sb1TP1p9FCMXJcThJ5RBGX+7CHgx8cg/CzE/gvVAXEktK7GXGgzCwePpLDy4ZKL2ZcMM/jGLsGieSJ2rF/eIEjTWSTlTy2o5xZV50UPS16nQPiF2TpenOdTxXvNfOzP7yKTrlxleNHYsaYeLBn+c8mZtdTGMyqwU1IwpF1qXJBsz/LCjbOrXm8lk3NiNqAlSZXeGy07IJ7A5On+YjttvQlBcGEhG1j0GFGXRHHPP8z1lDJ2fGjTAgUr4agk+YZ0isx+rVgrdLt7hy+yv/wPE9+xsWaTuaA5QGLFfZyBpMIiD5iCRsOmqx03UN5P+10bBYHXvaOlHF92SIbZd8DbozsSGsYCgz5hchfZEOf3vidV0b7O/bSAcdFHnn/VKupQoiZgcr7hzcEQTnQ3klfCstaQQTGKjVUIWxn0cBMtdm34jelp/Cl57k1BNNK1cgBAj5RFrGf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(346002)(396003)(39860400002)(366004)(376002)(451199021)(66946007)(6636002)(4326008)(66556008)(66476007)(83380400001)(5660300002)(44832011)(86362001)(38100700002)(41300700001)(186003)(8936002)(8676002)(82960400001)(6486002)(2906002)(6862004)(33716001)(6512007)(6666004)(6506007)(316002)(26005)(478600001)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTZibzJ5azF6RDhTOTUvZkM1LytkRndUVURyZDVwTzI5dWM3dGpMNThjL1RQ?=
 =?utf-8?B?bkxkMHZJWGVBOU1DMUp5SFVMVWIvRXNnSDJIbTQ2N05md0U2TzJiUDNUVTVQ?=
 =?utf-8?B?RStkNytIMFBjQ3BXMHA4cmg5Z3diaWo2dTJuUzJSS2NKQWF2VmltQzFMMHAy?=
 =?utf-8?B?MkFyaThsQWE0Ty9PK1ZCNWpPdEpMK0tFWWFJOE9NaVRwM3QwNHpONEgwM0VX?=
 =?utf-8?B?UmV6NFM4UktBZkJXbWRDcDYvVDRsWGJkUFkxVkFQdXRnbzUyeGY1QWp3TkxN?=
 =?utf-8?B?cnVSaDZtS0pNOUJIc0lQQ1I0ODVzOWVCaHVmRXJnb0lKU3NKU3dKN0FzYjVS?=
 =?utf-8?B?TzZmc3EwbW8zMVA0NG1vbnU5eG4vbmliaUFxcVIweVZTTERBZnFjYzE5UDVH?=
 =?utf-8?B?NWhRQWVRWXhQbHVqMW9SWHBHTFRyRnBMWkRId2J2cktQR1NhZmZ5MU9zdys3?=
 =?utf-8?B?WVVnSy9IWG5uQWdWYVE5OEtHKzRCTEZ1MEZQNUZZNnlZZjZLYkQ4OFRzRFZ2?=
 =?utf-8?B?M2hpRzY4UHlHTzJUSDgxcUt5MmxydzVGdFFvaXJ2dVJTNmFuNC95TjUycTV0?=
 =?utf-8?B?YndRZytLSVpMWkw1VlhHS2JSY0YyMTBpY1E1d2pqakVCWDBHWTNITHFlVWto?=
 =?utf-8?B?UlFVN0JYM0ZyVjZmRERCZDVuL0hRcDVMSmNic2hZdUFKNjFqamJSRjMwZFBN?=
 =?utf-8?B?M2FoaE4rR0NjdlpMQTVQYUNwdXh0UG1NY3JEUGJMTWtXNHJKcVhiTVFYZStp?=
 =?utf-8?B?d0RIM0habGtDcWlaa2drclViWkJEdHpTV1M5K2RROUJpOUk0RE5rbzlIaXgz?=
 =?utf-8?B?VE1ieGY1Z1paZzgzN2FaQktSR0lweXdKVytCRWptSlV6aU9ERDZHZHE3a1k2?=
 =?utf-8?B?RXZmS2xUMTBvVGtjcFFoMjR2cFpSN3dGL01TWmQrSGhxMEd6cnV5UUpibC9L?=
 =?utf-8?B?Um4zam9veTdoOXk5ZDBRZGs5MzlEazlLcEsvQmVjam1ERy9LZy9jak1MV2JD?=
 =?utf-8?B?NUFnZHd0dmVGb0N6RGpCUEZVUWF2cFp6ZHlhTy8zeUhiSkNBd3B1QmRwS3Vw?=
 =?utf-8?B?dUpXT2QzbzFodVMrR3VlUHZ3SFlzTGU0WDkxWFVUelFtTXo2TjBwTEJ1V1kr?=
 =?utf-8?B?VTFrTmkrZW1sNTRZWGhGeWljdGUxUHA5a0tPTDBWam0yVENESnRPSzh2ZjJo?=
 =?utf-8?B?Y2hVUWZtT1FBdmt4WklpK3RWZlFmM3JoOU9EUmIzcTF5NUdjNTBmNFU4RjNn?=
 =?utf-8?B?MGpjYlBTWFVWeG5iYjdTOUdwaGp0TTkyekxpYTBQV01tOVBwcFpDdFg1cFhC?=
 =?utf-8?B?bUhScERDNTVzSFRvSFIvTHpTaXlDV1IybVdKa1hiSVRYWXJZTEI4UUdDdngx?=
 =?utf-8?B?TWFaNUk4NHNMT0h6TUgyRTZ5RnFpdkpJU1h6VEFWYVNLd1JRZU44KzB3bHBU?=
 =?utf-8?B?SDFNSnNPWWNGOUF2L1hRTlFlVllWMHdGbEFwbi9pSXdTSG5nSkY5RlJrZElk?=
 =?utf-8?B?RWV5L1hJSG5jOFNWL2hmWC80QUVsNExFUHNIdmlSOHFiODlNbWk0bGpyejZn?=
 =?utf-8?B?OTBuc3NoSFNGWGdrZ1NQMExWSHViRWhCU2w5K2dpbXg0U0krTlRwaDZmQnk3?=
 =?utf-8?B?TUxlWnM4WVY5SEduSTZxYzZ3dlAycDBxektFL0duSk9RcENzOVV0eWNIRTkv?=
 =?utf-8?B?THRXYksyckViR1NlK2xWaEk5eU1CdUM3ZEZLTFdnM0FDYlFXWGRRRWwrVmgw?=
 =?utf-8?B?OEl3SFliNzhKQVdEVzVPeTRWeU5zUXNZUytEZFkvWnFDYVhTTzd6TDRFTlAx?=
 =?utf-8?B?TE9BbFhxMUJ1SUU1ZkNBVGxJN3JmcURTaVhmU2FFVHdIRUdBWXc0TS8vTmFG?=
 =?utf-8?B?dGpQVFVrcTQwRUJCeFpRdDN6d25IYUkxNUowRVNBSlJZdUZXejdsM0VYVDJR?=
 =?utf-8?B?NFhJbDhIRzdIQnJ4MzVuZC9UU0w5T2JzeEQ3cFZ3Z2NkWFR3bUNNOTZHWmhl?=
 =?utf-8?B?M0JjSS9FQ0tNNmp2L0hISC9hOWE4OWxYVVBYNlZqQXZvN290aHhZazc5VnVC?=
 =?utf-8?B?WFEzb0NTczRBczk5VWM2blpTU3BVS3lsVmkxWXBTYlZHZnFmM2lMaHY2MWgz?=
 =?utf-8?B?RFk2ZGhVU2gzam1UNUNIY3V6TDl3d1g1dW45UzlQVWlKMktFOHpvZkdHNC9n?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab7cd0e7-69fd-429f-cd7b-08db610d13b0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 12:54:59.9140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjmN+ziREAQ2LYVzGzMlGUncoqwIjepCt5Y1mtltw4lFU00LlGha61Mmf3zg6qluUh9kFPUHbtRfJS0R6RE5yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7020
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/reg_sr: Apply limit to register
 whitelisting
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Lucas De Marchi (2023-05-30 01:01:34-03:00)
>On Mon, May 29, 2023 at 06:48:17PM -0300, Gustavo Sousa wrote:
>>Quoting Lucas De Marchi (2023-05-26 13:58:22-03:00)
>>>On Thu, May 25, 2023 at 10:14:21PM -0300, Gustavo Sousa wrote:
>>>>Quoting Matt Roper (2023-05-25 21:10:38-03:00)
>>>>>On Thu, May 25, 2023 at 08:24:06PM -0300, Gustavo Sousa wrote:
>>>>>> If RING_MAX_NONPRIV_SLOTS denotes the maximum number of whitelisting
>>>>>> slots, then it makes sense to refuse going above it.
>>>>>>
>>>>>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>>>>> ---
>>>>>>  drivers/gpu/drm/xe/xe_reg_sr.c | 7 +++++++
>>>>>>  1 file changed, 7 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_=
reg_sr.c
>>>>>> index 0312823101ad..b82f704179a0 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>>>>>> @@ -231,6 +231,13 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr=
 *sr, u32 mmio_base,
>>>>>>
>>>>>>          p =3D drm_debug_printer(KBUILD_MODNAME);
>>>>>>          xa_for_each(&sr->xa, reg, entry) {
>>>>>> +                if (slot =3D=3D RING_MAX_NONPRIV_SLOTS) {
>>>>>> +                        drm_err(&xe->drm,
>>>>>
>>>>>We probably want xe_gt_err() here so that we'll know which GT we hit
>>>>>this error on.  Also, it wouldn't hurt to pass hwe as a parameter to
>>>>>this function (instead of mmio_base) and include hwe->name in the erro=
r
>>>>>message here so that we also know which engine ran out of slots.
>>>>
>>>>Yeah, makes sense. Arguably, we could simply pass hwe as a single
>>>>parameter and figure out the rest. Is there any reason not to do that?
>>>>
>>>>If the above is something reasonable, I wonder if xe_reg_sr.c is really
>>>>the correct place to have this function. Maybe it should be something
>>>>like xe_hw_engine_apply_whilelist()?
>>>
>>>As long as xe_reg_sr_apply_mmio() is there, I think we could leave this
>>
>>By "there" do you mean "inside xe_reg_sr_apply_whitelist()"? I'm asking
>>because xe_reg_sr_apply_mmio() is not called by
>>xe_reg_sr_apply_whitelist().
>>
>>Or is "there" the whole file?
>
>yes

Ah, well... It looks to me that xe_reg_sr_apply_mmio() indeed belongs
here. Now, for the register whitelisting, I wonder if using the
xe_reg_sr infrastructure is the more correct thing. It works, but
it feels more like a special case... Maybe we could in the future
extract a platform/IP matching mechanism out of xe_rtp that can be used
for different types of actions, with general register programming (i.e.
rtp) and register whitelisting as two examples.

I think I'm going a bit off-topic now... So, for this patch, I guess we
can just keep the function here and make it either (i) receive only the
hwe or (ii) both the sr reference and hwe. Option (i) looks more correct
as it avoids redundancy in the parameter list, but at the same time
feels a bit weird because all exported xe_reg_sr_*() functions receive
the sr reference.

>
>>
>>>one in xe_reg_sr.c. If we are going to migrate it somewhere, then
>>>probably xe_reg_whitelist.c would be a better home so the RING_FORCE_*
>>
>>Yeah, that makes sense.
>>
>>>are all contained in that unit.... We could then add a func() action and
>>>remove XE_RTP_ACTION_WHITELIST() too. Not sure sure it's worth though.
>>
>>Well, we could at least do the move to xe_reg_whitelist.c for now, and
>>think about XE_RTP_ACTION_WHITELIST() in another patch eventually.
>
>I was meaning more a XE_RTP_ACTION_FUNC() and then it's the caller
>resposibility to do whatever they want. Similarly to how we have a func
>for the condition (XE_RTP_RULE_FUNC())

Yeah, or maybe do (in the future) something like what I'm suggesting
above: to extract a matching mechanism that can be used for multiple
purposes.

--
Gustavo Sousa
