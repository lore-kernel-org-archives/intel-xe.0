Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0D4C3600B
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 19:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFEFE10E5DF;
	Tue, 25 Mar 2025 19:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NsnUG9H1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1EAE10E5DF
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 19:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742930075; x=1774466075;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0S3KDsslkP3RcySaJEVTA2aK8M7//pHxnv+0JZc6nuk=;
 b=NsnUG9H1Fio7A7r5PIdTEhxLz/i+77goYuKrc0RASxtScf6VuuRZnXOP
 7/C5EhbM1Fatz7RWG01/0wd9EvkAECdthtajbuVs4wcEott5jtCn9EJQW
 cVZ35wXPF1t7dhe3x29PqyBQRMR2a9cRld5BT9dhRnY2bDa2fydtjnjCI
 HJrEay689sOnhCQJpP+731jakPn7VJQqyPtpBi4SdorChw0wyKvreNbbO
 IH0exzVc6shhywBIxBB3EPOysVB7h66drCbNuzvxmpqB/6IsjvhZCU+nH
 mzq32S7qx41egZ2w2XPEajJlIvdB9ePR3gKsHjJVJqnOyybKODtmL7Krc g==;
X-CSE-ConnectionGUID: m52MwBJbStiZig5M8iK/hQ==
X-CSE-MsgGUID: wj5KChAhRXWbYUqH5gTpZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44209799"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="44209799"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 12:14:34 -0700
X-CSE-ConnectionGUID: VAZIhfd3T9u0BOD6QFMxeA==
X-CSE-MsgGUID: 8BVn3k6rQ62l70rJwMEgow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="124941964"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 12:14:34 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 25 Mar 2025 12:14:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Mar 2025 12:14:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 12:14:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dW4VFLtbin9tgkGhzeFFKbKxrDysnW7nY71VHc2IKCODH0Sg2gp33f05AUWmYbNOn85ihdR/38vjMVEPhbAhZOiIKFTUpv+WOPU7zF3nfIB9yOs86VIcz1B38UgPVREs46UJSJ4G2tbDSTSqnbdr23SahZ3fDRwkRxIbBIcBeD3dUDrDWIUczowh6os0rIooaXG4vydSe+h0UWU9UPikTrgzCtJe1FmMJGLGwMf6IKD6O8W/qA7mGU8IXUgA7SmwV7YgrM/uTB0FU+iAV5PxrhmDiB1hkBpk45BhEVzJAs1ZpMMhxif0o5LQM2XJDzSe9+VdjlMt6DD84MxZzTqXRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oS3LVn5Zva3ocHvGOhZl/6zHH8U9B6WXHQ8X4q05LL0=;
 b=DMAGOzAJm+B5bIFfHCZ/9CaDNjZuzrHdcPxHp1U+HZnNyuzX7wJhKSShrA4Nqg4wW/ClRom/IKTqEmQ2MpJGfJIYlIcsWun3nuX6rz3HMnIP/fNjUlwEBfKlpwqHMGWnqQpXAPsR6cDH4+Xx7UNsgclvFHgPMR9m8039V0RFMByfSwn/tmwEu62SuCJwEk7aAYHOMBQFnXu2ZJVfn6wSe4MQ8Co3kdnpI1n7DpeTflASJMfpeQNOnhC9KE5lCmbrXUJ6KwWAU0kFMqbE6aue3PBZqvqs9aZ5DYFHZguw923WoYD05jUC5u63aWMnTuoDSmLhJoiRFJ7RadwDcnHxQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA1PR11MB6968.namprd11.prod.outlook.com (2603:10b6:806:2be::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 19:14:15 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 19:14:15 +0000
Date: Tue, 25 Mar 2025 15:14:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: sysfs_ops needs to be defined on parent directory
Message-ID: <Z-MAg1F9_2seEgYy@intel.com>
References: <20250319121349.288844-1-tejas.upadhyay@intel.com>
 <e91f93d2-a4e2-4304-b026-eea2f1fae13d@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e91f93d2-a4e2-4304-b026-eea2f1fae13d@intel.com>
X-ClientProxiedBy: MW4PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:303:8f::29) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA1PR11MB6968:EE_
X-MS-Office365-Filtering-Correlation-Id: 21629b60-dacc-4879-7ccc-08dd6bd13b8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q/h9f9KiX0rmuyBYYjQlmh2T55O0VFCJdbhFUMnvaMmtgC29DQA9SPXQTR7X?=
 =?us-ascii?Q?Ytx9/iPftKcU6On9XK7yRvQiUo68w4W3GCjy2ZuTigJWTvFqYQMJGG11+2ry?=
 =?us-ascii?Q?M4R/TMFoHkK4dikRA7qU8u0GJpfu+pdE5o2QtCM7uGnb8IkLQq3bTRMvnO2m?=
 =?us-ascii?Q?dcOEy3c77XZ6S9CfHeEa8AYqbyDKJRBURYDmokE9Oc+c1TG6aafQNZp2tEC8?=
 =?us-ascii?Q?vgOEfL6Ipzm9QYj+ZbYiIOe5UjxBKoAiE3IA1HstvLOblD+MkClecMN/PYIi?=
 =?us-ascii?Q?K1muHnA3ViC1RtLGE2uWt5xPZNHvVMW24QvxJOaFt83kfLtBx8xUd65zI0dJ?=
 =?us-ascii?Q?I6OJynM+jHF2B2uSjSRzeWLvRI1PpwqaLhrUGHcdikTdaqKy+bf9fwf5QaPs?=
 =?us-ascii?Q?SZa+QuYCAAXoEDdZADInPr+T4/daaqb/5GtnMqHKz8/f9EyVLJrbvhtzv4Hn?=
 =?us-ascii?Q?yh52VzXGvsfTfTqstep/oCZJDJbF9GDFkaIFcqY5s7zuL/8SE1vW5N7DqvYt?=
 =?us-ascii?Q?tpaxaoLZC7HtFZHAxByq1p8i8t6P121P0/FTJV8ff4dK7yY9DCmQLFc7df5z?=
 =?us-ascii?Q?WhOn2DNSbDlkckxz8tONrUnNpgHJH17PAxkfNCOTq9sphSIab7fVdAMuaSuU?=
 =?us-ascii?Q?8ddIAN7l6eFmmlzwEsiS3lUEljQHqn2v60V7ugvwypZQvYiMQ6G5iO0KdBOg?=
 =?us-ascii?Q?tHi92Bo1lAL7EjWKpT2iqXSkmgkMUuJsgveXjYGjRIhETw3tL6iHevvYjfGW?=
 =?us-ascii?Q?g99uNmnZkFiwCcXexpbcWgGTZR/sVuY2cvpmesm0WIUABZL8/HT9cmtzz2ZV?=
 =?us-ascii?Q?NVp84gdmKdynP92I48sHeYBj40qn2KfFKvTeOFENiIyTW3yAhonlqsmeLg7l?=
 =?us-ascii?Q?rpTZA0TdVvRLDeOga1Wlj13p6UhjPHjAbOlKzCZaaYCElcqYfP4dbpNm05it?=
 =?us-ascii?Q?ipwwBsG9S7QTiP2x2bRrOJIsLY1mnXP8s+Lj2c2do/fKEbfUHascD7vLTYcw?=
 =?us-ascii?Q?A+o6ng3BDGYS1x2KZMHC+7HQGSM+69rXZH5e/ACKodO8A5vP5pPlDGA49wx5?=
 =?us-ascii?Q?/DL9y2P8ftJPyu3KxdbhYY7I8I43fRP4Tydru+AtHgS64xqJJo1A24Mpz2MO?=
 =?us-ascii?Q?zLuE7b8nmiZPTxFePkyjmbYqKC2vo+RyNHxi1idH9SDJK/WtMWizwzbvKoVx?=
 =?us-ascii?Q?Y0Rh8i6iYH7IRPia+OUkM/TntGCdzfidEtvo0DPOKrYBUl0ZZgFDpUa1T6d7?=
 =?us-ascii?Q?EzcWITlyuhiLpoONRGkyg8fyr5+OpxD1yn4lIgsXRtLkK7fVXYKy/ABr9p0w?=
 =?us-ascii?Q?0JKmOhJPGPtHPN6sX2cPUUcSgH/2nnFgnoNH84yod17h+LgvBZ58u7/efk3+?=
 =?us-ascii?Q?1B4kJNcVQ0OwXGp5UnDv3CvT0CFG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/JX3DrWs007qcmDiseBklca0QD+WNEn+RDih3DexGcQ+7aok/jd7w/4mQ8k6?=
 =?us-ascii?Q?+VitaxAsSJ9AOcStyjclaKX6beS1KlX/XnOpU2LTTCUJyzv/X77FtDrZs572?=
 =?us-ascii?Q?KrW8Fyc8g+sYTYN7xcxPjr6419zq6oUZa5IbhY5CHv5vuty3MCzUqD4QMyZk?=
 =?us-ascii?Q?29a0/ok3j+EuhxtXIPq5Yzx0b9BvmMmIUd59/KS4yiV0Re5k2z+vDhZDRds3?=
 =?us-ascii?Q?zyf93hS9nMTNLH/GW06S2YN5MPtQrdpsWlRKWhtAtYxmJvd6+CruaosoOs46?=
 =?us-ascii?Q?4obIYKzbRGS/DQ1XbfsPMBseTsEiiwJEhbpuWAETyoOWsttJVOuefyCKjGyD?=
 =?us-ascii?Q?fwpeH9YuzloFfgh1umbhZFadv6l0ftfMjWTh0rmsffujzUWK2E4uEo9q55Z4?=
 =?us-ascii?Q?s0aj/YqXHD/pzV2pUMKazQEhbd9g+SFHdOnTIah4KY6s+Kp8BH2rbY/OSJhu?=
 =?us-ascii?Q?+MMe2nXC5qYXfNMvV1wHN5JJbsmlxnH8kMuu56hZjRQtT34/zhGiCu9lAsLS?=
 =?us-ascii?Q?P/pjPZe1LphIUeunmXK2FAkfEu4S31R9Q6vrFsMWLyL18DKbk6Qdw9enOTaK?=
 =?us-ascii?Q?1s4o7VpIHWcr0hIGMuvcn2JroBc2jPP/+0mC6i1bIOUZ+24z/Gykb+LDs1wD?=
 =?us-ascii?Q?+9OePY+B2Af14bbOLBdeFob8sWs12wEiQ+8qsGrIx4bpA3KtfxOJ4oy6IwaU?=
 =?us-ascii?Q?4hthbsotl3geSejFx4ao01v9lF8TxUQX91Eudx1QEvrMIW65OPP+HI8kqGX4?=
 =?us-ascii?Q?z8+kwewtyDvFzkWXtnFIG+ClGlyWEZwblRi10iBoRe9aG/M90PXjgWewlbzK?=
 =?us-ascii?Q?o0oPkz5pwkHGN59JQVCyQCWMWJ/a7Sm+rXvAEFcU9s9oT3DwcOgGDR2c6vL4?=
 =?us-ascii?Q?YD8rB52QtiRrJWKCPROOyRwtGY1BjjlBAG25GgskiJ30H5Y0c7MwgMtpMETv?=
 =?us-ascii?Q?EelaHdgRqpBpXbFiKYA/HEbx/8s0TsVh4OA7f8cwdUdoAk+PhsTDXzfu8sos?=
 =?us-ascii?Q?qJFEHOZ8NV9S33f27/zRfKxq2QdplNjmGpScicWN+TBqwpfSv3Iv/0nGZJKb?=
 =?us-ascii?Q?4edClIlafOqXVGzmTCs8qeEiD1NhLtPh2BC7nxIO16Ry5rTWqQkG8j2ZVP+X?=
 =?us-ascii?Q?KWwnNNl6OSRfq5gx+t2HoLUF67Izki+p8kJgU5mBfXEzBMmcY8tus4+ug2SN?=
 =?us-ascii?Q?fsTWhjoJqcNm0ccsWdixYeXsKIoCIrvRpqObleLFWFq0F5IQpM1FUYFRabk3?=
 =?us-ascii?Q?AZLHpjCSTnDsGUNwIYeHhcrbCqY/4cCNKai2C8vGq3pGKhAC/fpfKSCge3JD?=
 =?us-ascii?Q?i9hwdU0sr9yxtPFRR1OGSPPSJzgleiaobol7dV6Ix87XvBJ7gkhnE0DZEGPf?=
 =?us-ascii?Q?T/+kyDRmlra+D31W7QHx64njwFkVzPPxhUlsM/1gXV+MgEWchCoVqqyB8RgU?=
 =?us-ascii?Q?PKsRu2gdck5BidKbiP+4Yezd+wWqa7Y61kohLqtvLleBx/zh84N9T+o4SPgd?=
 =?us-ascii?Q?WC2dohn6IBG0JoSMIpF25bK2ekSq9gsrOfo2CQtv3locbmw0G/msJURJW7lE?=
 =?us-ascii?Q?KLfoBRC5OqznzTJQHeAiZMQAO+8/OKJ0WZxLfjFPgKQvg+d7kYU8b7ADtiYN?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21629b60-dacc-4879-7ccc-08dd6bd13b8d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 19:14:15.0394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +RcBe3k7G4vCBUqmavk03uYZxk3Ojy/InbeJLZAAF2Sgev/dZ1M9UANzrq2t0vCISKgK5XC7oZeU5GUolMTYQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6968
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

On Tue, Mar 25, 2025 at 03:18:40PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 19-03-2025 17:43, Tejas Upadhyay wrote:
> > Currently, xe_hw_engine_sysfs_kobj_type is defining sysfs_ops
> > on wrong directory. Sysfs_ops needs to be defined on immediate
> > parent directory to be able to called on each attribute set/get.
> > 
> > Fixes: 3f0e14651ab0 ("drm/xe: Runtime PM wake on every sysfs call")
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 67 +++++++++----------
> >   1 file changed, 33 insertions(+), 34 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > index b53e8d2accdb..25592f178482 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > @@ -492,39 +492,6 @@ static const struct attribute * const files[] = {
> >   	NULL
> >   };
> > -static void kobj_xe_hw_engine_class_fini(void *arg)
> > -{
> > -	struct kobject *kobj = arg;
> > -
> > -	sysfs_remove_files(kobj, files);
> > -	kobject_put(kobj);
> > -}
> > -
> > -static struct kobj_eclass *
> > -kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, const char *name)
> > -{
> > -	struct kobj_eclass *keclass;
> > -	int err = 0;
> > -
> > -	keclass = kzalloc(sizeof(*keclass), GFP_KERNEL);
> > -	if (!keclass)
> > -		return NULL;
> > -
> > -	kobject_init(&keclass->base, &kobj_xe_hw_engine_type);
> > -	if (kobject_add(&keclass->base, parent, "%s", name)) {
> > -		kobject_put(&keclass->base);
> > -		return NULL;
> > -	}
> > -	keclass->xe = xe;
> > -
> > -	err = devm_add_action_or_reset(xe->drm.dev, kobj_xe_hw_engine_class_fini,
> > -				       &keclass->base);
> > -	if (err)
> > -		return NULL;
> > -
> > -	return keclass;
> > -}
> > -
> >   static void hw_engine_class_defaults_fini(void *arg)
> >   {
> >   	struct kobject *kobj = arg;
> > @@ -611,6 +578,38 @@ static const struct kobj_type xe_hw_engine_sysfs_kobj_type = {
> >   	.sysfs_ops = &xe_hw_engine_class_sysfs_ops,
> >   };
> > +static void kobj_xe_hw_engine_class_fini(void *arg)
> > +{
> > +	struct kobject *kobj = arg;
> > +
> > +	sysfs_remove_files(kobj, files);
> > +	kobject_put(kobj);
> > +}
> > +
> > +static struct kobj_eclass *
> > +kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, const char *name)
> > +{
> > +	struct kobj_eclass *keclass;
> > +	int err = 0;
> > +
> > +	keclass = kzalloc(sizeof(*keclass), GFP_KERNEL);
> > +	if (!keclass)
> > +		return NULL;
> > +
> > +	kobject_init(&keclass->base, &xe_hw_engine_sysfs_kobj_type);
> > +	if (kobject_add(&keclass->base, parent, "%s", name)) {
> > +		kobject_put(&keclass->base);
> > +		return NULL;
> > +	}
> > +	keclass->xe = xe;
> > +
> > +	err = devm_add_action_or_reset(xe->drm.dev, kobj_xe_hw_engine_class_fini,
> > +				       &keclass->base);
> > +	if (err)
> > +		return NULL;
> > +
> > +	return keclass;
> > +}
> >   static void hw_engine_class_sysfs_fini(void *arg)
> >   {
> >   	struct kobject *kobj = arg;
> > @@ -640,7 +639,7 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
> >   	if (!kobj)
> >   		return -ENOMEM;
> > -	kobject_init(kobj, &xe_hw_engine_sysfs_kobj_type);
> > +	kobject_init(kobj, &kobj_xe_hw_engine_type);
> 
> 
> The patch makes sense if we need to use xe_pm_runtime_get and
> xe_pm_runtime_put to show and store the attributes. Are there any hardware
> read/writes associated with these attribute store/show operations? If not,
> why do we need pm_runtime just for software states?
> 
> +Rodrigo, for his views here.

Better safe than sorry. The goal is to protect every entry point on the
upper (outer) levels that might interact with or trigger some memory operation.

> 
> >   	err = kobject_add(kobj, gt->sysfs, "engines");
> >   	if (err)
> 
