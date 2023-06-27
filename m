Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E0EEB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 06:54:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A40C10E089;
	Tue, 27 Jun 2023 06:54:23 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19BD10E295
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 06:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687848861; x=1719384861;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WCj+RE63toD5Z0ctHdq5Y0FxYHNktUQq7MYIgvdAFwQ=;
 b=jnSthz21JY1nUw6Jv5O9EySWODYSvpjneSDfaTfpEX5XDOFlVK5ZVL+u
 gJ7DRaGn+/KHpUKVVyzejEqxuiGqGqy8d/rZCouZYxtWo1mmkgKvETXY4
 9AiQTkx6omC7B59ymSUyJ1a220+jx3pj/ar7cMFfCmKe02hwLebd0bvX/
 6fqDvDWnRblsiZu0jkuR1hZklWG8YeNBuBgNn/U4Q6t6vP0YgyQqw18PA
 xp49ko6sQB4E51R25UC23Kku+zKE1TGGexB73GIMipUYhWyGxCk+RjwQJ
 pTLOGIjPiDhAhgcrVFIH6SpOWq+PkPB9xeIslPgaVHspOm0An5235kNo9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="341834769"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="341834769"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 23:54:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="890560761"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="890560761"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 26 Jun 2023 23:54:20 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 26 Jun 2023 23:54:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 26 Jun 2023 23:54:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 26 Jun 2023 23:54:19 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 26 Jun 2023 23:53:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OT+vCQfXyLwQ+DIW1W7XXWTCp964NVwIhY7kwuwAWSm+D7q5p+pKTfDXM75hx3JPcCQMYkB1/6hNlivdxh2z7VbFH0075fvVALINjAkletoneurTM8UIZl6x8HHa3G25vslp5iPaWI7LFQO4Ldj4ihbTQwm8HJkOrCPPciVRz+CvvhWBTLqjOtvIXzC6XlgWNO9vTAxqKXDCyrkPYzzCmw1Wvmr1b02rkkXJZGP4uwGcR/gRFZu5YGw8qSqHjXxu4/t4MyYVqeQ0VLDeEjKyXFIwtqORg5YUh7MJueTtD6vTLF1Mbtnv/bw5xv/QzL55waGxCVUvXDEl6r1Wd84TbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRsO80Y8SWyHq75+mK4y005odmkUgGDVBkYMxoqs0Gg=;
 b=J8jeKnGRF/4bzJA3WZqTlfYKGREyKvfCAXNfCpnGwPeuke+dw+mgz1PfvKavUwU23TYPhdkvX5PZs6HxHub19Bzs0/bfEbqG8j/3WV5NRl3Sr6FWVS4gNtMfeuO5eEBZ/2aRjojVgHPnEExkt5orlEBOfmBRcNkT4SlDbkmcKRrCHvGHbSx3kTOKFXwlOp4Y+ceVhf193AE10E5li+537xFnBajwqdnF/YFbswa0BOLG8UHnUdaXZd9jGwxJZhxh/w1YzcsRyd5kffVedyh2OP4tYi7wx4EnGGlf26yg7dGPiO49uszHv31io0tb5znpZ8cmDqAZIaB6r1U9NHW5Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by IA1PR11MB7248.namprd11.prod.outlook.com (2603:10b6:208:42c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Tue, 27 Jun
 2023 06:53:36 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02%5]) with mapi id 15.20.6521.024; Tue, 27 Jun 2023
 06:53:36 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v12 04/13] drm/xe/guc_pc: add missing mem_access for
 freq_rpe_show
Thread-Index: AQHZqBwhaLDqNaB5yk+YHEd63i+KB6+eNwEQ
Date: Tue, 27 Jun 2023 06:53:35 +0000
Message-ID: <CY5PR11MB62117F609203FC0958818E3F9527A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230626105037.43780-15-matthew.auld@intel.com>
 <20230626105037.43780-19-matthew.auld@intel.com>
In-Reply-To: <20230626105037.43780-19-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|IA1PR11MB7248:EE_
x-ms-office365-filtering-correlation-id: f7eec143-e5a4-4b98-8e5a-08db76db3aba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V0NdgUUbA/QrGNDBOLgHldcJ2XTySI/wTLuPKHYZlEWtmQZCcI3yZrqqpxUFtZsBs2d9Me7sDj+nXr8/c/of3ZW0NmiadekX2a7s6AU1WvSkDU3dg5HzuWTjD7PGkoZXVFm3rYllRGy3m4FmnjATkUHRbIaHRG4bfs/MzXvnpuhAD5yGnPslIxLzDAGWuko+uBs1Y79NErQ7hMM5/YBb++/gk8MRRBKZJlqA9k7Vr0h8ICEyPxzFmp1iVWgiit/tXyjHeCdagnHgTEopaKmY9F+LJak9mXpubGpENOuFLN1oWnxeHVdn38tqKvv6IGjSJw5i2ATKVYvVCgk9yjp3/zv4K+egqL+SJzUZsf7u1rrmcafXU0Gwb8rBlFATYYKFURVff9/lkxsNJ1jiw6u09Q/Ful/JtKjzZav+dHsHOljInG+l6R6vdJ2lZXh3DaPBG2M2IrWrSqs3O0Vi7X0A632gN0ZApI/PHxlJvvjSpzoCpa6szkaHH2hDu51vxgqROJZVpXFGgZy0ONMVPidLSZL3MS2wWi8tenX0HdOKZJechnluO65yGORqWh2CmXjxHeEBnIialGki/9bCRvNvAGf41jmbPlQXcLMNgUVkxCG/O9uMG1vKAsRPm7Ri3IcC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(376002)(396003)(346002)(136003)(451199021)(33656002)(38100700002)(5660300002)(52536014)(86362001)(41300700001)(66476007)(8936002)(64756008)(38070700005)(66446008)(8676002)(66556008)(316002)(66946007)(122000001)(4326008)(76116006)(55016003)(82960400001)(478600001)(107886003)(2906002)(186003)(6506007)(9686003)(71200400001)(53546011)(26005)(7696005)(110136005)(83380400001)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y/EX7I2h/lvSYu6vc2Uf56RLUoh9JvcqVSbmogEsf/1YKIGZJbEBfk00UcKF?=
 =?us-ascii?Q?0oY2VfhhEPh6eAcwFJ+hWvo8xQkh0IB5eromrP44PluwN0AKu7a+BZq1/Ak5?=
 =?us-ascii?Q?wCJ9KtPv+3y/p8lBHYt1VKEN3XyEHxsmGUs6hS43ES1We0sCEm4h4+6JyWmP?=
 =?us-ascii?Q?jr2ay+ZdkQtnebgx/kmtH0qPVfjab6IX7fGdxeDwwz+25kd/9J6jd/CA5e8I?=
 =?us-ascii?Q?Uah8Ukbx2z0DLUBzvjJoRbUTO+mw99d8Jg794EFHhJFnh1F1viekXUMQlpPl?=
 =?us-ascii?Q?cvYDHkCzkwHOlv7cHKCuIw1+aGtfCvg8UX6zxgqIzNSgJIOoy68daYFT9WIZ?=
 =?us-ascii?Q?p0E6VzcZEs0A3sWad5Vew1CM0FaSet0VtCjgAzG665XM+lNnGrb9ZutxLO7n?=
 =?us-ascii?Q?GmgvJhekpiWvO4zPWW+SrH0sbvTqwrChhBHgQXP3IzJfx5wzN8JDPf42nMbT?=
 =?us-ascii?Q?Ti8lQIdZ3X3F6mFgsku1r3hePYQYz5CtlILer1692+tUfn44f/phRDKQKOLz?=
 =?us-ascii?Q?59djxz68bAfjJzRuyZLuKonwpsE+Su1+5hvqw3CXCgJDuOp5GjpG9AFTfwyL?=
 =?us-ascii?Q?Ec+8n+mstp/6dXViloBiR9PaVVsaItplB1GE6/pGz4bfMzeMreDIRT8LXSQs?=
 =?us-ascii?Q?HkkH5vBhswnyuQSJCw9qjMXqMEHPvDpJS3rCsV9Hd+fUZv4G81cJZv1jQAT0?=
 =?us-ascii?Q?WYpZiJTdkQLB5UIX/RXmcFQHXWlCJHp8ZgAymwnQlr5qPr4/3rLdbL/OKvGq?=
 =?us-ascii?Q?8mBZrRC0AB3fprVXG7crVgnWd/IrKnSoEaSdxyOP2i5kNs+qSje70agcs6yE?=
 =?us-ascii?Q?oqUTY1DiP9W3SdZuJqM8zw0e7BM96c+bIAis6uCA9NjP4qkk7wqi2V1RXY1r?=
 =?us-ascii?Q?MAD4fOzADYSuCyzD56Vhh0uD9jPRp0Kbx6O52kJBMO3+TBHvHINIRmpdrAHa?=
 =?us-ascii?Q?LM9BllZkxrxMz38QHoasuAuXuqQrD+M3TISKM1KHOIZ3CtNqaCFwmS3m3Gv0?=
 =?us-ascii?Q?i/P1PIW+qDzb0DUZ+DLyE6w/TQ2vYd0TduUxG0GNuDAFelKSyzhecNC1KpD6?=
 =?us-ascii?Q?ySo8Z4yQLnWrcdkcO1t6K6INry5vE+j6E6Jku2OUP7IuBYID8q849FLG68EC?=
 =?us-ascii?Q?UvhudrJiCYJb5+RN05CBgUTwzYWIaktpURmc18T5JK5uiAoj9aAudXKpK5J6?=
 =?us-ascii?Q?evqU8JzVKIOWoVN1T7tm2ZPsTbcPLrwJHMD2NtyKk0c1IFjnAh7VuPtEnQTH?=
 =?us-ascii?Q?nlEvi7A0jiSpA5QAc80jmFHGsrgngxaWry9MWSIatuV5fLZdfSITeUX4kK3Y?=
 =?us-ascii?Q?mPdx2q0MnHl/gyyBIc+kcTDMQ8cBuWxkeTfo12Ogy41Nus5MlTAhZ79vp1Az?=
 =?us-ascii?Q?1kkOUveEU2+YegGC4+RF79yzrZMckhAVVku3+fnF7qEJ9iv+JADHwAbF3YCy?=
 =?us-ascii?Q?33t6DfVkaO5MaCfqcCaOYRm7+fvw5qlD7KRrk9YcOE/mjpq23pNFBn/Z/95i?=
 =?us-ascii?Q?pm8/mq1ts5bMd99gh8t3UxGnO8AFQR/9qgG3PUm7agzELX/p87PguOo73aTF?=
 =?us-ascii?Q?ofnGIN+lhrwVQI6weJud8Aimb1EhDjPP/ZIiMgQH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7eec143-e5a4-4b98-8e5a-08db76db3aba
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2023 06:53:35.7697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8+pyWOsacBZ93OeWdtT2dwAZtnhLsddZ93Zs0ctwVPolNcWhgCfLhyQREEPpbHEICHIrsuUih+emUdSgFr7uHO7pDnOuG9iORwKikvE8rE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7248
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v12 04/13] drm/xe/guc_pc: add missing
 mem_access for freq_rpe_show
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Auld, Matthew <matthew.auld@intel.com>
> Sent: Monday, June 26, 2023 4:21 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>
> Subject: [PATCH v12 04/13] drm/xe/guc_pc: add missing mem_access for
> freq_rpe_show
>=20
> The mem_access is meant to cover any kind of device level memory access,
> mmio included.
>=20
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_p=
c.c
> index 5d5cf4b0d508..e3722a805837 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -430,8 +430,12 @@ static ssize_t freq_rpe_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)  {
>  	struct xe_guc_pc *pc =3D dev_to_pc(dev);
> +	struct xe_gt *gt =3D pc_to_gt(pc);
> +	struct xe_device *xe =3D gt_to_xe(gt);
>=20
> +	xe_device_mem_access_get(xe);
What is desirable to use here , xe_pm_runtime_get() or  xe_device_mem_acces=
s_get() ?
It is register mmio access
Few places in driver using xe_pm_runtime_get() for mmio access.
Thanks,
Anshuman Gupta.
>  	pc_update_rp_values(pc);
> +	xe_device_mem_access_put(xe);
>  	return sysfs_emit(buf, "%d\n", pc->rpe_freq);  }  static
> DEVICE_ATTR_RO(freq_rpe);
> --
> 2.41.0

