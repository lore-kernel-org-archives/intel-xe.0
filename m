Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F655C83F26
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 22:42:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAFE10E34B;
	Thu, 24 Jul 2025 22:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RthBlUxL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4663A10E34B
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 22:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753396948; x=1784932948;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ujp7J8gBSuPTxtZ4FNYwBngR8gA1dsPl/xIVdVFiogc=;
 b=RthBlUxL464EsFTn7VK0wQv7QcXlzxrA+cCpEJKobLnHutGos0GwqgzM
 uKAKspyQNNYJXAdB0/5B6FPpH1Sp0PHdkuYf2n7Rkq67qOVcy8116e6O9
 fkXHsFJNUS29vJm+1GDHHxD1sKQKrbFRIFv1MpS5C92SxAdfislrQC6sp
 HFoZ0JnpxQg6pVCEiEo7sGVT2fJVIuuE5mWXq95eFC+qx5Ql6ROsCJgJP
 lMwmKUp/+ZWciENskC2MAYesbzybe+GbLqQcaGAufarp6kcX+Ykhg1DOp
 TQ70hvPuy5T3aEwhz24aLH4JxY4AcwmqB4IsjhF86LbXIUeQqVrH9hBSs Q==;
X-CSE-ConnectionGUID: ep6rjUouROqVBD85SmtQ4Q==
X-CSE-MsgGUID: ZVl86MzzQieobDpJTi3rMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55817432"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="55817432"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 15:42:28 -0700
X-CSE-ConnectionGUID: rUo2ukANTWqTzxVruV6i4A==
X-CSE-MsgGUID: FRCI3ygHRgOdtbJ8sxP1Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="159730262"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 15:42:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 15:42:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 15:42:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.41)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 15:42:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYzk5yP7GkDptBGH0bSlwgln5o0BWBJKRQHnfTwUk3GokRoxWB+kFkqO83VaB+EuCt+mMPxDj9obZ9vICuPtK25usUASIj0UcKO2W6Fs1jiaIJ6atC8jR20w5BIjLystTVgoxezraQ88iAx56tnFP+4yQrNlb0bZfq0Q+ILQmCMPj35F9QJt6rlrY552opBa1zWiN31jRN5IRJw8QzOMm/s1dDFOcLddzoiClMGa/mzq7awdnTg3C47dSLC8RokJ9C3aRr+r/40gyhZ4wGTAXypULzG23ETJBhPQIYilQ8Trf+bcBdcxx1owp+yMb3McrrsX876d8iKR9xpltvc+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPobI85D4r5Mjm81w2ZYISM8p1iOq8ULsAb52yyOdM0=;
 b=IoSFFoP5zNPUzDJNaxLa5de/pfpnA9+eEkjoZY9wG1+C6vEOwOlIFOsIMgvh5/QJJ9ubBEK4wgeuoxfqGIz92zVNI9lXV04q4G4iv1ZZCiQ/pvgAAq2byrYEvzvgey7YeDxc38p4ZGhoSXYDq0RRvhDXKUeGbtVU4TDyJ41q4mkzXCMxgBzqZt6KbDr29CDU6rAVnWEY/8V61/NVmjOq2wHvcw3sDa2DTqFi5pyTQCALCIPLPlUou5+LxISvDJTBRVULQQm3hlRlWdzXRWL4923zqrn0F1xEriCa1X4KmeL5gJQirdznqjRV66YSTl/eEBqD2ygXKOO9gzSMDR2MfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH0PR11MB4903.namprd11.prod.outlook.com (2603:10b6:510:36::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 22:41:51 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%4]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 22:41:51 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH] drm/xe/xe_guc_ads: Consolidate guc_waklv_enable functions
Thread-Topic: [PATCH] drm/xe/xe_guc_ads: Consolidate guc_waklv_enable functions
Thread-Index: AQHb/Ok5j2IZRgYFikSs5uGw2pMAKrRB2zSw
Date: Thu, 24 Jul 2025 22:41:51 +0000
Message-ID: <DM4PR11MB54561650661546060B2EABDAEA5EA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250724221911.114782-2-jonathan.cavitt@intel.com>
In-Reply-To: <20250724221911.114782-2-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH0PR11MB4903:EE_
x-ms-office365-filtering-correlation-id: 250bfeb2-0fe6-4063-1a8f-08ddcb034850
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?XXDxZQ5Rg3hnk5rwAPWcNpde1aoZYCUT+cR4d3vTpoSKoHFaFQrRouFXDq3y?=
 =?us-ascii?Q?/5PrywJPt+pHNkJcXE/NB4Ag0IT0MM0K1qtBts7Z1r7nRPw6bcfoB/vdcXiZ?=
 =?us-ascii?Q?R45+dNUfP+tmxbTxMP8Ba19BcCHo8lz/r0+5VVfDYzA6/CSzBuc6zy9mN9OT?=
 =?us-ascii?Q?OQZJYPSb8Qo++1mVBmsp5qjv8J6MZimRp9HfsrAyD2pGDfhyZRsWxiQV3VsR?=
 =?us-ascii?Q?N7ZaKvELLyx5uRotf94fePxXJBtQnZBvLoEmJ7IMaVUB811ASEGaLekGklgj?=
 =?us-ascii?Q?Jf1IryFFT5P0Fwfjefb8LsjvMAw8tc/SV8otqMEjgPYimzUgpJzYdmDZV7UQ?=
 =?us-ascii?Q?8IebLbbN7sdCF1EByR3O+S4FGnHIfceKGwu/Z9XTE1wmHhiteZif9ITTED/D?=
 =?us-ascii?Q?qOHNFaOMvW67FpB28ziGYaPHg3668/kGO4TM5boWVHcYalTrPNcP1DJYD/R3?=
 =?us-ascii?Q?fyC1HWwGph/pNra2izYEYUOz/CLdunGMXpd7c+S5tZw8Vy7dbizEzpWcWaqJ?=
 =?us-ascii?Q?MgesvUP3d2O+LXNTiiEjtsY7tuX2o6tmikYiEgdbqQB/yyODpJiAi9mHQ/1r?=
 =?us-ascii?Q?/sgTpEFZNR8Pjia7vNLdDnTiQ/gH6Jm9/FqFuKA/vtBhnYzwBHVLCUgio3dg?=
 =?us-ascii?Q?MVFs2CsDr1Gj14m/A8RO96KQAl7zoOSdkWxJyZ2FbJxdYSHqcCA0AKFi3IXv?=
 =?us-ascii?Q?GpDH+InSMKuMS/Nn6Y1HtmOAGGdC3/bZGQgcwwXg5Sl3ahJUOyehZn/YncGQ?=
 =?us-ascii?Q?+XVP2u42AZisc/cu/WJNmnP9F1/6bBYQRqwtPhoKPruJ67Gbv+gPVJLfrPpD?=
 =?us-ascii?Q?+SAiAPZTc/BtJp4uYUkj8xFrk8uqotsUW46SK7izexMhx0IPxclNtsk3CZGt?=
 =?us-ascii?Q?g7NElcFnCfV2reoEpRngKVG2HR4zR0HT23Ukk7WfigxQ3tPDUPs7PD/1RJjc?=
 =?us-ascii?Q?gvZ1WN1hX+UxWWI3Kf+WfbmfZx3HeblkSCgk+7PaHhvJNJERbP7S7HvLQGUS?=
 =?us-ascii?Q?IAbs6uqMIwnTmRGimJMq7kDZQEfgIzK8aJGn73CtG4u9hfdYEsys4kIirYk1?=
 =?us-ascii?Q?jFzkZTZFjtqoV/XbrkvyLibpNBkyUiC3koMWD24chwFGk/yBaSmtgoBS+qOa?=
 =?us-ascii?Q?VR4mdfLykIO0Tk1Dzi/YuKOg+Lm5HnbfbxxEF6ABI2E0+JJGXO33EwMhiTUb?=
 =?us-ascii?Q?+x2PGhn+SWZqLstG0roINTRMZfEucTl+TxujLafvOSC/67N5rEIOa9F17Jrh?=
 =?us-ascii?Q?fcfRHWZDzTOSAhQONMsy2xY3tpOCl0DbWXX0Sx0WkNhviuZ1I8euZg6MJEd4?=
 =?us-ascii?Q?Q8AdSTm1ZKQyC45iD88pwxFnNscLQQUnAGU62qhNCCOUOBhRvunCGcvPRj77?=
 =?us-ascii?Q?Cr6hBGfVlSUcqwgBeD1UHW4fmwolKn5mWYOAfrL/urYV3CsnOCGJVt8K+VUu?=
 =?us-ascii?Q?ttrG4yE95b1QGZn2lj/OlfDiNe6OTR1i4prhRAmPj6YD0ltAyXgOdA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?soa0bQ570h3AYWGbIe7ykUAn2M/MzJhIQaF81wzx1ipIe1FhYSai19LZ1G+d?=
 =?us-ascii?Q?7x4D2kd9CUdnSejcOu1tXxRnCAVzZrYCZ3HFLic970nqiXeGeCZRxwTo88Ej?=
 =?us-ascii?Q?De5401UanrR1VJyOJQFiYx3gNgde+OEF1DTXuMY8LjaSx1eBNTRvOxCEgQY9?=
 =?us-ascii?Q?UB3c7vawfAwLhzLB6OMuMqczGm55Hd8pK5OTiIeqHS80gSQJXrEdbVROfSHp?=
 =?us-ascii?Q?E1Lw4EFos+u1JQHQ8uWgxO3/A7b3qvtpGjZtSyG/0b42w4idfG3GnoLroq8O?=
 =?us-ascii?Q?2OJuMwcniVp6nlco628A39oVLp1TNyBQTA+EA2Nic8YVYmLn/LvKSyr63bSZ?=
 =?us-ascii?Q?qEK8z7LoTi/GSr4+uon1VN2lBOGH6inRAHuaCE2jd0+s60lalcYsFPAGeHbN?=
 =?us-ascii?Q?KkZ8sK2JOoHcOwiSR3lawTq+tTN+3qhV4PuHOv4BVzEC9QAbi5uhWGsUG3+f?=
 =?us-ascii?Q?UP17JivEYJveCScDOJU1BQTxi79eKHV8GdevuewhESY1CVjxkRUmm2CZjGJ4?=
 =?us-ascii?Q?Y8EQDfAnx135Af4wyA8RZx6O0tA4FvfXmag0pkvHr8T6w9QZFyoONm3DjKTx?=
 =?us-ascii?Q?xsIV9dbRzUwkyR4carvp7+W4AmlfgC9/MHASv/1ThwCsyju0CyvtdMZb/PkL?=
 =?us-ascii?Q?R2fNwWuWtrADpwy0UHDhrTaHGuYxA7oysxDPQ/oecDT6JmsRQg0xh13sri7h?=
 =?us-ascii?Q?UT77hI4FRAgkTFbY3dCU42Sr6tALtgRDnf2oy3LOumJuLMOmf380k8J1vSCl?=
 =?us-ascii?Q?HuLi56W1O+VE/r3Qyj9tEuLogo7iXZ/LUpbza51kGrvRh5fduIsCquN0sSFh?=
 =?us-ascii?Q?5H9wYzuvfx0IjjQfg4ac7PBF+WhTMw8qoxAuqJc4OHm2R0CfV3Ln6kbOuRHL?=
 =?us-ascii?Q?U6E+jAghUJIaN3f067pF/D2qnpAWfp8Zv6PbvwbhoObTsJp5I3llziHvMaEx?=
 =?us-ascii?Q?DvuxXe2JD5YFHNCflUkSVONX5zk62P/7cbwMamu/AVimghTiX1RcBazo4qih?=
 =?us-ascii?Q?+FYX87UoklzmRbikrZYsjHfqeQJP2ycCHxA7eSYxzgeMSf6fssIAnMLPLLv2?=
 =?us-ascii?Q?u6EhTYuHzdYgYw6CkeRFfnR8YCvetkPGhUAJHqR9fcycnv8LQPxlhfZF5rSj?=
 =?us-ascii?Q?S3IfirGPZJ2iKxrb+69rTdL/4M2+DtbdIKFuytUeMovSoJmEv2nAEVxJLWyN?=
 =?us-ascii?Q?HW3Fw1Vk9s5ehFUU85rCCBu/COY9dbBEbMwq/MR1Xx0gfOJcTxmKksKmckgu?=
 =?us-ascii?Q?KiCUttiAf6WXMTTYhceq95fi7T6T8LMiRY83an2bkTs2MQXmrItMmzD6LwlQ?=
 =?us-ascii?Q?75JmJQpu6ihI3nX3qrBm8AnxWu+/HZmb4onlJGLeNzlxv8YcC1qw7fEsy4Vu?=
 =?us-ascii?Q?jHcsdXdYLpzugOK923sH1EelM3HJjRgqlI7/ZbmLmHUJ9EbS6iR/fIB832Y8?=
 =?us-ascii?Q?7CgsDnU4MY/Xp119kNfZCmjSvXwTT+AjmaWZozyvO9iFAxyT4gvT2EslO5j9?=
 =?us-ascii?Q?QKDuPbjV2nQRsKQiSMhn8Cl2bQS8R4FtN9a+J2Oi5LB26Um2LOfxIl85fC8S?=
 =?us-ascii?Q?MCHrvaZqOOnipJZZQKscq+Sta8yUkfIAN8ZWopp9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 250bfeb2-0fe6-4063-1a8f-08ddcb034850
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 22:41:51.4737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YJ4ug/s9cendz53fTpE3CFJZPEuJoSELvuhwCwcSw2cGSq5f1SjcgEGInbTQ47fYEmyM54hHaBpc+KLkqMNb9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4903
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

On Thurs, July 24, 2025 3:19 PM Jonathan Cavitt wrote:
> Presently, multiple versions of the guc_waklv_enable_.* function exist, a=
ll with
> different numbers of dwords added to the klv_entry array.  This is not
> extensible, and more duplicates of the function will need to be created i=
f it
> ever becomes necessary to support 3 or more dwords per wa in the future.
>=20
> Consolidate the disparate guc_waklv_enable functions into a single
> guc_waklv_enable function that can take an arbitrary number of dword
> values.
>=20
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Lucas De Marchi <lucas.demarch@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c | 144 ++++++++++++--------------------
>  1 file changed, 54 insertions(+), 90 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c
> b/drivers/gpu/drm/xe/xe_guc_ads.c index 8ff8626227ae..793a3054c562
> 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -284,83 +284,41 @@ static size_t calculate_golden_lrc_size(struct
> xe_guc_ads *ads)
>  	return total_size;
>  }
>=20
> -static void guc_waklv_enable_two_word(struct xe_guc_ads *ads,
> -				      enum xe_guc_klv_ids klv_id,
> -				      u32 value1,
> -				      u32 value2,
> -				      u32 *offset, u32 *remain)
> +static void guc_waklv_enable(struct xe_guc_ads *ads,
> +			     enum xe_guc_klv_ids klv_id,
> +			     u32 dwords[], u32 num_dwords,
> +			     u32 *offset, u32 *remain)
>  {
> -	u32 size;
> -	u32 klv_entry[] =3D {
> -			/* 16:16 key/length */
> -			FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> -			FIELD_PREP(GUC_KLV_0_LEN, 2),
> -			value1,
> -			value2,
> -			/* 2 dword data */
> -	};
> -
> -	size =3D sizeof(klv_entry);
> +	size_t size =3D sizeof(u32) * (1 + num_dwords);
> +	u32 *klv_entry;
>=20
>  	if (*remain < size) {
>  		drm_warn(&ads_to_xe(ads)->drm,
>  			 "w/a klv buffer too small to add klv id %d\n", klv_id);
> -	} else {
> -		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads),
> *offset,
> -				 klv_entry, size);
> -		*offset +=3D size;
> -		*remain -=3D size;
> +		return;
>  	}
> -}
> -
> -static void guc_waklv_enable_one_word(struct xe_guc_ads *ads,
> -				      enum xe_guc_klv_ids klv_id,
> -				      u32 value,
> -				      u32 *offset, u32 *remain)
> -{
> -	u32 size;
> -	u32 klv_entry[] =3D {
> -		/* 16:16 key/length */
> -		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> -		FIELD_PREP(GUC_KLV_0_LEN, 1),
> -		value,
> -		/* 1 dword data */
> -	};
> -
> -	size =3D sizeof(klv_entry);
>=20
> -	if (*remain < size) {
> +	klv_entry =3D kzalloc(size, GFP_KERNEL);
> +	if (!klv_entry) {
>  		drm_warn(&ads_to_xe(ads)->drm,
> -			 "w/a klv buffer too small to add klv id %d\n", klv_id);
> -	} else {
> -		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads),
> *offset,
> -				 klv_entry, size);
> -		*offset +=3D size;
> -		*remain -=3D size;
> +			 "w/a klv buffer for klv id %d not allocated!\n", klv_id);
> +		return;
>  	}
> -}
>=20
> -static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
> -				    enum xe_guc_klv_ids klv_id, u32 *offset,
> u32 *remain)
> -{
> -	u32 klv_entry[] =3D {
> -		/* 16:16 key/length */
> -		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> -		FIELD_PREP(GUC_KLV_0_LEN, 0),
> -		/* 0 dwords data */
> -	};
> -	u32 size;
> +	/* 16:16 key/length */
> +	klv_entry[0] =3D FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> +		       FIELD_PREP(GUC_KLV_0_LEN, 0);

This seems to be not correct? The length info is missed.
Should be:
FIELD_PREP(GUC_KLV_0_LEN, num_dwords) ?

Shuicheng

>=20
> -	size =3D sizeof(klv_entry);
> -
> -	if (xe_gt_WARN(ads_to_gt(ads), *remain < size,
> -		       "w/a klv buffer too small to add klv id %d\n", klv_id))
> -		return;
> +	/* add dwords of data */
> +	for (int i =3D 1; i <=3D num_dwords; i++)
> +		klv_entry[i] =3D dwords[i];
>=20
>  	xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
>  			 klv_entry, size);
>  	*offset +=3D size;
>  	*remain -=3D size;
> +
> +	kfree(klv_entry);
>  }
>=20
>  static void guc_waklv_init(struct xe_guc_ads *ads) @@ -373,49 +331,55 @@
> static void guc_waklv_init(struct xe_guc_ads *ads)
>  	remain =3D guc_ads_waklv_size(ads);
>=20
>  	if (XE_WA(gt, 14019882105) || XE_WA(gt, 16021333562))
> -		guc_waklv_enable_simple(ads,
> -
> 	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOC
> KED,
> -					&offset, &remain);
> +		guc_waklv_enable(ads,
> +
> GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
> +				 NULL, 0, &offset, &remain);
>  	if (XE_WA(gt, 18024947630))
> -		guc_waklv_enable_simple(ads,
> -
> 	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
> -					&offset, &remain);
> +		guc_waklv_enable(ads,
> +
> GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
> +				 NULL, 0, &offset, &remain);
>  	if (XE_WA(gt, 16022287689))
> -		guc_waklv_enable_simple(ads,
> -
> 	GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMP
> UTE,
> -					&offset, &remain);
> +		guc_waklv_enable(ads,
> +
> GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
> +				 NULL, 0, &offset, &remain);
>=20
>  	if (XE_WA(gt, 14022866841))
> -		guc_waklv_enable_simple(ads,
> -
> 	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
> -					&offset, &remain);
> +		guc_waklv_enable(ads,
> +
> GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
> +				 NULL, 0, &offset, &remain);
>=20
>  	/*
>  	 * On RC6 exit, GuC will write register 0xB04 with the default value
> provided. As of now,
>  	 * the default value for this register is determined to be 0xC40. This
> could change in the
>  	 * future, so GuC depends on KMD to send it the correct value.
>  	 */
> -	if (XE_WA(gt, 13011645652))
> -		guc_waklv_enable_one_word(ads,
> -
> GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
> -					  0xC40,
> -					  &offset, &remain);
> +	if (XE_WA(gt, 13011645652)) {
> +		u32 arr[] =3D {
> +			0xC40,
> +		};
> +		guc_waklv_enable(ads,
> +
> GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
> +				 arr, 1, &offset, &remain);
> +	}
>=20
>  	if (XE_WA(gt, 14022293748) || XE_WA(gt, 22019794406))
> -		guc_waklv_enable_simple(ads,
> -
> 	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
> -					&offset, &remain);
> +		guc_waklv_enable(ads,
> +
> GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
> +				 NULL, 0, &offset, &remain);
>=20
>  	if (GUC_FIRMWARE_VER(&gt->uc.guc) >=3D MAKE_GUC_VER(70, 44, 0)
> && XE_WA(gt, 16026508708))
> -		guc_waklv_enable_simple(ads,
> -
> 	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
> -					&offset, &remain);
> -	if (GUC_FIRMWARE_VER(&gt->uc.guc) >=3D MAKE_GUC_VER(70, 47, 0)
> && XE_WA(gt, 16026007364))
> -		guc_waklv_enable_two_word(ads,
> -
> GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG,
> -					  0x0,
> -					  0xF,
> -					  &offset, &remain);
> +		guc_waklv_enable(ads,
> +
> GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
> +				 NULL, 0, &offset, &remain);
> +	if (GUC_FIRMWARE_VER(&gt->uc.guc) >=3D MAKE_GUC_VER(70, 47, 0)
> && XE_WA(gt, 16026007364)) {
> +		u32 arr[] =3D {
> +			0x0,
> +			0xF,
> +		};
> +		guc_waklv_enable(ads,
> +
> GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG,
> +				 arr, 2, &offset, &remain);
> +	}
>=20
>  	size =3D guc_ads_waklv_size(ads) - remain;
>  	if (!size)
> --
> 2.43.0

