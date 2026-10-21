Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5404E606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 07:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nr6fa6B6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1193610E069;
	Wed, 21 Oct 2026 07:11:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE1C10FA22
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 07:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792566696; x=1824102696;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LzCA0tn1/anhEd1mk+X3kOAHy7DK+bsuIoX+5aht6T0=;
 b=Nr6fa6B6EHhlsJKiKUPj1kR9m8DhuQyVGsQ+KHoB6e33KsEkWF8Z0rNz
 ktGACcT83r2sdadadVfL3iMSow0r+h4EKord5ZR2D6jOJ+6L42iBOpLxO
 HMUIrQemgQ5dzKq0eDvlh4w08WsBf9xOD4W31E8JHRNTn9d8kmUjSCmPk
 reA6sCp/8szcC5JDenqpSGSdpSinCemq2AGW2MwU/K/IMElnQ2o6LJP1D
 p1ukWpod65ZjAOBkkuH0XDmMGz8Io2iiJDrtOrWGq4eR+tlaqYZex3fNA
 fncTbkc585IsLG/raTgPSMDy+3GmRolUJQPg3ODYT9r4Y80izb9gWlFuD w==;
X-CSE-ConnectionGUID: tcrVeCLJRRKmrRGi8GkYtw==
X-CSE-MsgGUID: faldnOVLTXCi6flikBdgqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1275945"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1275945"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 00:11:35 -0700
X-CSE-ConnectionGUID: WsjMvoTBT1GxaBNkkOlF2w==
X-CSE-MsgGUID: nz1uA7V1QtWpitK+XaTJjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3080182"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 00:11:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 00:11:34 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 00:11:34 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 00:11:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQJ3pydgXqN4eDSFBA+k6ikIUZqpmdKfYgFkwBWPy+Eik4UXg505i946otDl5kED9BgB/4y12W5ouen/rKXMF7V7+SJ8dykp9+ufZhd++oMvt/MIEJtQt25atQ7hIcqXNSfXEOyXxL0MgUf9XqdtoVmNHiVCRz5Vyv012kQSwUggoVo5jtXjz3abnMMB+gwh/AHwmMoA01qPXaagvOcaRXMIVVD93Bf5TBmjyZBxySooNCqwbHNpIfgyxgfo7ShIDkoyX6mLvhTswZuFAdKPncoIW+x9nBdF+orI6vLxpQj4Sae/2twRHnBLIFeQlc5hS/IJDJ1M5EjDkhS6ibCE/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmruVKp/9u7h31RuUxi3i/7yX4/5I3XgkAMESYnNraE=;
 b=JDm/dLRZip6BbuK6gV32tndMK0gIlnBhykCwdjDtnAJv6FjVNzLNEsKll4yG+ByhWgZNgNIjQceTZ3OGS0AeIsu/lKXIiSOJmhBe0YqpGtgb2THoc5Is+mrrdwlDNReqOghY6PjQApxjcIOXSdAgNfCi9H9oQ/gkpIcw62QYNEKKVOPPprkM57rm1iA+FrMRlSC44WtTDXiqb32CuXATxt31Q4VRMd/uF6FocfsEHdnPWOkBLk5lbeOHakX5g0oKgE2SQNywXIe5P516BoKRiUjORqt+g2ylDD2l1knxTpfA+rgy9OsZxwh5tGY5KDzKlbzhRjrJC1NPSc1hV9S0Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Wed, 21 Oct
 2026 07:09:55 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 07:09:55 +0000
Date: Wed, 21 Oct 2026 09:09:52 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH v6 2/4] drm/xe/ggtt: Split GGTT into usable and shareable
 pools
Message-ID: <20261021070952.dw3kugreuph7ttim@intel.com>
References: <20261020095532.473609-1-piotr.piorkowski@intel.com>
 <20261020095532.473609-3-piotr.piorkowski@intel.com>
 <1b91e597-dc36-4769-8315-90fbbcac1d07@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b91e597-dc36-4769-8315-90fbbcac1d07@intel.com>
X-ClientProxiedBy: WA2P291CA0038.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::8) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|CH3PR11MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d9e427-4c5b-4bc2-050b-08df2f424f4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|261009223027099003|10067099003|56012099006|6133799003|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: CtnuB5M64VIgM99i/TSp66kS2lqhlwA0/JhjKFAv4WOXiOzeKTduzK0vqF5c4PId766QZGXur8P5IoPSYHdPk9zshD9XSCjdghpLhzcxxNQkHD8ntguA0aEY1xRfe3oy3qTTkb+1F/8cgr2uL7dqBZjCAmXSoEqZahjMWwW9cSbujHGhfmJt4HWnasmuFE37e3USCBWC2O0csMeKUiwnGI0Js7ByO0CCc7LcWl+6pJjXWcx0SrlJwcEJU3JQb5U8RNWv7IFmbagXCnZPQ5lcmsYu/dMGAjwAmEfeiUzkaO00YoD7pBlUWKz4ZVHC3i/CgX8zWCFgGZVcwapUbNSa9DYrBM94EE5XRxT/7HNrEfgVZwqJp6yVZNKd8f0dCv+fmbOJbtvibnFUz1LS5CAM4OGNxeuXKjWy4NpbRn4AsoSMvDe4wZj6qJfnuMqKRL/s01QZ3mQOaavvTVFXEP3gD2DzRMLhUUEDLN/by/aufHP1sBeXJy4g++a8og+33rwo1Tg/EYB+RJvpAj+WWpzyWNdp3HvGNjHTUrkr9Y/Ldx7t0PLq+dUEDPCr3qgr2S/2OAzssrQ7SJoJH3hiJk7oM6m47pQnySsW9Yt4gGk6+6VMqF53A7LF9nFsdqGHQUcNr+X46xozs2T5UHz7Oja+CNFP9nOkIETJ3HAzg5+Pnr4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(261009223027099003)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkMvMDVxamRsSEc4TFY2RU96VnhHeFVrKzZvemZXaXJ1aGJyb3hiZGRhbjR4?=
 =?utf-8?B?dEtJeEMycGtIQ1FsRFYvSnVrMFM2ZGk3S2M5UnB3M1o3dklyR1pHYkRMU0VJ?=
 =?utf-8?B?TjExVStjZ05pVEFOTzM4VUZjOEpQT2lOS1BqSitIcFBiSkpGQVZxbXcxU2tz?=
 =?utf-8?B?MVJqcFEzQkN1RFZmbGx4M2toNmRrTDRHWi8yQTF1MWkyQnlWUFRlNTZEWWJ6?=
 =?utf-8?B?QzU2aEpweWZ2UkgxOXQxeDNJUkE2WG4vM1JhOTV1Y2pZeUtHM2hBaU9OdUVx?=
 =?utf-8?B?aVlPUldiWlAyakUrRjZCaG5oU1U1b3daaUw2c1dZMVQvd00wS1Y4SEgzVVJ1?=
 =?utf-8?B?VmpJN0dUb2dOalc5SXp1eC9Mekl3R21ZeE1FL3ZOYVVvU2F5dHJ5TndFSnFX?=
 =?utf-8?B?eVh2ODdOQ1I5by9XcUhuNGExRkR0TFdkdzhndjNUK2luNmlpYk5vVWVrS3N3?=
 =?utf-8?B?M3lyWFZNcTN0TXpSS0ZaeGZEZXpNT2NKb2VlLzFSZ3l1WDg3YmdpbWh5aFU4?=
 =?utf-8?B?RVk5RmZiVGVlQ29HcklNL2dlcGplM2U1WUJRaW5icllDUnkwTTdYdDZDdGFa?=
 =?utf-8?B?UkVMZ1ZEa3dhbzRrNDd2MHV2UjVZUWFvL21iN1BaeU9RWW9vcTA4Qk1JQyt4?=
 =?utf-8?B?MU5vZDlJQ09MK01DMUZPY2huOGxiOFQvUDZ4UWw4ZEVtTVBHRnVKTUQxOTl6?=
 =?utf-8?B?RTNnNTYxbWNTNDhoYXlOZURjK1VTUFRrcU5xL1MvOFdyTUJFNmxGVFkzVDhx?=
 =?utf-8?B?TTdrRG5XV0VSOGpaSVNDZXIxVVdURVdIS0RCSXNMZ3NINmd5Z214ZkhDaVo4?=
 =?utf-8?B?OVZnUmZsbFRNVUVkSHplL2VRblV2VjJCNnY3dGZBNmNyU2FxOUM0d3RIRjdu?=
 =?utf-8?B?QlM3U2lTSkdQemxQWnUyUnFlSFhGazhyaUN0aGh3MTl5cFpkbm5QWkpEakds?=
 =?utf-8?B?UkU1cjFmRFNFamhXMldBTEszMEF6ZkkvbU11SGdrWHBrdkZxZlpockc0VVlH?=
 =?utf-8?B?N1FGN09CekRkS0dHVFhQL2RacEdRRzZTajdOK0VuT1hpZ3lkV3I0aE90bWZY?=
 =?utf-8?B?Nm03RThXaXBUanpFZnZIMnByVmh6MXEwTkVISVJQald4c0tiV1lVMUoyNWd1?=
 =?utf-8?B?R3BRTFBvYWNidVNUQXk0MThvajFZOEF4SzY1TWx4ZERPRDM2cHdrdGNseUty?=
 =?utf-8?B?SXcvcGdWTjdKTVhJdmQ2S1ExYkZBUVAzL1RGYVMyd1RvL2hyeitvUGhjaFFQ?=
 =?utf-8?B?dVRWelBmOGZGNjBSWGNsd1EzZldmM3RaU2RaT0sxbGd0NHRNNU1rYjJ0aHhy?=
 =?utf-8?B?QzRkUm5KVU85VUIvYXFyNnJLa2hQTkE4c1BjNlBEUHlTUWJDdVp3Nml2bTFj?=
 =?utf-8?B?ZXh3TVgvbXFvdWwxK0ZWMWhJbXNCSDZTUGlMR20xUjhhTWxndzN3eEQwR2pI?=
 =?utf-8?B?MVpBUitwVnVFVWRqZ0xzcUJZNzdMZjVhdHdNZFJ4eWROWjRjekExSTl2VmhK?=
 =?utf-8?B?RGRXZncyMFA1Rko0L3FYbi9oRDEydTZMTWdIcXdlbzNpUUNuRGdySWJxaGMw?=
 =?utf-8?B?K05zM2JsT09SYnJuSER3ek1EcFpleU8zbEpEL3M1R0Y4UzJYU3dOYlhwQm1s?=
 =?utf-8?B?Ly9JQzJBSitwb3Bmdmtwc3gwKy9hVG85VGJZUUl0Q2drTU0rWmU1U3hwTkNS?=
 =?utf-8?B?WjRUQ2Y5dkJkaTMzWEo5Y2ZCQ1ZBRlJsOHhjYTg0UjNEUVVuWkozWG9wZFVp?=
 =?utf-8?B?bTZ2YTBuUjFaUkxRcjVheXZ5TGZQZWxSR25mZ3JJV1ZLL0JtNjFoR1ZRUEdC?=
 =?utf-8?B?K1hFdTM2VWkxeXlVQkFzRDNRTXdBcDlnVm9jc0FzcnFYZWYzUk9BZ2ZSaTBS?=
 =?utf-8?B?WUxaczhPZkxjYmlBMGQrWGIyUkdCZkNveTd0cVcrV1p1K0IwcU1KdDBDSlls?=
 =?utf-8?B?cXREVnphb2RXTFNiVll0Z3B1Wm00TjNmSENJVE54cWlTYjlyWGlHSnJuR3ly?=
 =?utf-8?B?cTJvMFRTWU9Ob1JXWEVKbkpxUkpvWGlqNkNzeHpnbkNRd3U4NXNGMUZPMnBp?=
 =?utf-8?B?OXAyLzFqK0owQXVMYXNGNG9yd1U5Y0FQSHk1SVJhTThXS0xZaXhaRnQ5UjFY?=
 =?utf-8?B?UHN1NjduVjd4UURpSnBQY05PZkJGbnplSkNjME1na2I1a3RpeDNHUzRsbnNO?=
 =?utf-8?B?NWJocDRIWFY3MlBISlI4M0UvTWZmUzREcjFCejlpZmh4WGpyb1BEWjhsbThh?=
 =?utf-8?B?RmFndTBwVWx0eHZQZVRZV1F2M1lsT2FOeXBpYVg2cnZsK1ppZFlGeEEwcWtC?=
 =?utf-8?B?aDBia0c5OU5hMGY3ZVdsL3piQjJxU1JaTmFxTDVSU1d0U2dGekNUN1V5YkJH?=
 =?utf-8?Q?3nbWzdonbUHY9EEM=3D?=
X-Exchange-RoutingPolicyChecked: U6HZNrbSYnS58Hoz/B8yhRdsvGHAYFOup/2wYKohy9IToDaIveKad5KRfc6qYK7F4jaGAUWRKq1RVhB5B+ng3BPJA3pnuqpBV2eXqvIesfYcfePBqXQRtKVLzicEdZ2AbhSzS6gBgxdF2l+/0ijoX+06lrI3KAJFH4eg7w1yWMGGxzrKBJAEFHftfnzxz/pVFJAnqPxKffIFbNZkMio9aRjGKZ+OFw9Yb+x9iGH1bB0y6qpsLkPP1Ko8qnwiPlrED1jy9Fws+5wd420nUViW1bzCZak0+nV5HgPEJxolI55/a/an5PbHCyDrI6ZXEBatm2vf0D6oHSPJrNpBzFsD0A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d9e427-4c5b-4bc2-050b-08df2f424f4d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 07:09:55.7602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J1z3n66+Wgci29jttRbAq8u83R2BRM2nO4L2L3IZEEpLGkaCZk+HhFi0aH/P7eczlAuNgO8LTp9Wv61QR1Mc2OPT/uHq4vLZi2giYHjOxFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7180
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Lis, Tomasz <tomasz.lis@intel.com> wrote on śro [2026-paź-21 03:01:22 +0200]:
> 
> On 2026-10-20 11:55, Piórkowski, Piotr wrote:
> > From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > 
> > Driver-owned GGTT allocations and VF provisioning currently use a single
> > GGTT pool. Split it into a usable pool for driver-owned allocations and a
> > shareable pool for VF provisioning.
> > 
> > The pools are separate logical ranges and may overlap, but allocations are
> > limited to the configured size of their corresponding pool. Allocate from
> > the bottom of the usable pool and from the top of the shareable pool when a
> > shareable pool is present.
> > 
> > Add separate insertion APIs for the usable and shareable pools.
> > 
> > v2:
> >   - Rename ggtt->usable_size back to ggtt->size.
> >   - Remove the ggtt_insert_node_in_range() helper.
> > v3:
> >   - Introduce the full_size struct field instead of the ggtt_accessible_size
> >     function.
> > v4:
> >   - Set the shareable pool size only for SR-IOV PF,
> >   - Return -ENOSPC instead of asserting when a large BO no longer fits after
> >     end is clamped to ggtt->size.
> > v5:
> >   - Move range initializer rename and full_size parameter here.
> >   - Use shareable_size and compute the shareable start on demand.
> >   - Constrain regular allocations to the usable pool.
> > 
> > Assisted-by: Claude:claude-5-sonnet
> > Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Maarten Lankhorst <dev@lankhorst.se>
> > ---
> >   drivers/gpu/drm/xe/xe_ggtt.c | 166 +++++++++++++++++++++++++++++------
> >   drivers/gpu/drm/xe/xe_ggtt.h |   4 +
> >   2 files changed, 143 insertions(+), 27 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index abcc929c08535..8c8354d47782d 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -145,8 +145,19 @@ struct xe_ggtt {
> >   	unsigned int access_count;
> >   	/** @wq: Dedicated unordered work queue to process node removals */
> >   	struct workqueue_struct *wq;
> > +#ifdef CONFIG_PCI_IOV
> > +	/** @shareable_size: Size of the GGTT range reserved for sharing with VFs */
> > +	u64 shareable_size;
> > +#endif
> >   };
> > +#ifdef CONFIG_PCI_IOV
> > +static inline u64 ggtt_shareable_start(struct xe_ggtt *ggtt)
> 
> This name is unfortunate. A function with `start` in name actually ignores
> the `ggtt->start`
> 
> and returns a shift/offset within range of nodes assigned to this `xe_ggtt`,
> rather than GVA.
> 
> Can we use something more matching rather than `start`, or add a word which
> would
> 
> emphasize that this returns a relative value rather than not Global Virtual
> Address?
>

Agreed, I'll rename it to ggtt_shareable_offset().


> > +{
> > +	return ggtt->full_size - ggtt->shareable_size;
> > +}
> > +#endif
> > +
> >   static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
> >   {
> >   	u64 pte = XE_PAGE_PRESENT;
> > @@ -358,17 +369,30 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
> >   	.ggtt_get_pte = xe_ggtt_get_pte,
> >   };
> > -static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
> > +static void ggtt_init_ranges(struct xe_ggtt *ggtt, u64 start, u64 full_size,
> > +			     u64 usable_size, u64 shareable_size)
> >   {
> > +	struct xe_gt *gt = ggtt->tile->primary_gt;
> > +
> > +	xe_gt_assert(gt, full_size);
> > +	xe_gt_assert(gt, usable_size);
> > +	xe_gt_assert(gt, usable_size <= full_size);
> > +	xe_gt_assert(gt, shareable_size <= full_size);
> 
> Does that mean usable area and shareable area can overlap?
> 
> If they cannot overlap, then we should assert for sum of the sizes.

Yes, they can overlap. On PF both pools cover the whole range, and drm_mm keeps
the allocations apart (driver allocates from the bottom, VFs from the top).
So an assert on the sum would fail on PF. I'll add a comment to make it clear.

> 
> > +
> >   	ggtt->start = start;
> > -	ggtt->full_size = size;
> > -	ggtt->size = size;
> > -	drm_mm_init(&ggtt->mm, 0, size);
> > +	ggtt->full_size = full_size;
> > +	ggtt->size = usable_size;
> > +
> > +#ifdef CONFIG_PCI_IOV
> > +	if (shareable_size)
> > +		ggtt->shareable_size = shareable_size;
> > +#endif
> > +	drm_mm_init(&ggtt->mm, 0, ggtt->full_size);
> >   }
> >   int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
> >   {
> > -	__xe_ggtt_init_early(ggtt, start, size);
> > +	ggtt_init_ranges(ggtt, start, size, size, 0);
> >   	return 0;
> >   }
> >   EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
> > @@ -445,7 +469,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> >   	if (!ggtt->wq)
> >   		return -ENOMEM;
> > -	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
> > +	ggtt_init_ranges(ggtt, ggtt_start, ggtt_size, ggtt_size,
> > +			 IS_SRIOV_PF(xe) ? ggtt_size : 0);
> >   	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
> >   	if (err)
> > @@ -639,6 +664,11 @@ static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
> >   	ggtt_invalidate_gt_engine_tlb(ggtt->tile->media_gt);
> >   }
> > +static inline u64 xe_ggtt_bottom(struct xe_ggtt *ggtt)
> > +{
> > +	return xe_wopcm_size(tile_to_xe(ggtt->tile));
> > +}
> > +
> >   /**
> >    * xe_ggtt_shift_nodes() - Shift GGTT nodes to adjust for a change in usable address range.
> >    * @ggtt: the &xe_ggtt struct instance
> > @@ -650,24 +680,63 @@ static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
> >    * This function may be called multiple times during recovery, but if
> >    * @new_start is unchanged from the current base, it's a noop.
> >    *
> > - * @new_start should be a value between xe_wopcm_size() and #GUC_GGTT_TOP.
> > + * @new_start should be a value between the GGTT bottom and #GUC_GGTT_TOP.
> >    */
> >   void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
> >   {
> >   	guard(mutex)(&ggtt->lock);
> > -	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
> > +	xe_tile_assert(ggtt->tile, new_start >= xe_ggtt_bottom(ggtt));
> >   	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
> > +#ifdef CONFIG_PCI_IOV
> > +	xe_tile_assert(ggtt->tile, ggtt->shareable_size == 0);
> > +#endif
> >   	/* pairs with READ_ONCE in xe_ggtt_node_addr() */
> >   	WRITE_ONCE(ggtt->start, new_start);
> >   }
> > -static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node,
> > -				      u32 size, u32 align, u32 mm_flags)
> > +static int ggtt_insert_node_in_range_locked(struct xe_ggtt_node *node, u32 size,
> > +					    u32 align, u64 range_start,
> > +					    u64 range_size, u32 mm_flags)
> > +{
> > +	struct xe_ggtt *ggtt = node->ggtt;
> > +	u64 range_end = range_start + range_size;
> > +
> > +	lockdep_assert_held(&ggtt->lock);
> > +
> > +	if (!range_size || range_end <= range_start)
> > +		return -EINVAL;
> > +
> > +	if (range_end > ggtt->full_size)
> > +		return -ERANGE;
> > +
> > +	if (size > range_size)
> > +		return -ENOSPC;
> > +
> > +	return drm_mm_insert_node_in_range(&ggtt->mm, &node->base, size, align, 0,
> > +					  range_start, range_end, mm_flags);
> > +}
> > +
> > +/*
> > + * When the shareable range is present, allocations start from the bottom
> > + * to leave space at the top; otherwise they start from the top.
> > + */
> > +static u32 ggtt_usable_insert_flags(struct xe_ggtt *ggtt)
> >   {
> > -	return drm_mm_insert_node_generic(&node->ggtt->mm, &node->base, size, align, 0,
> > -					  mm_flags);
> > +#ifdef CONFIG_PCI_IOV
> > +	if (ggtt->shareable_size > 0)
> > +		return DRM_MM_INSERT_LOW;
> > +#endif
> > +	return DRM_MM_INSERT_HIGH;
> > +}
> > +
> > +static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node, u32 size, u32 align)
> > +{
> > +	struct xe_ggtt *ggtt = node->ggtt;
> > +
> > +	return ggtt_insert_node_in_range_locked(node, size, align, 0,
> > +						ggtt->size, ggtt_usable_insert_flags(ggtt));
> >   }
> >   static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
> > @@ -684,12 +753,12 @@ static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
> >   }
> >   /**
> > - * xe_ggtt_insert_node - Insert a &xe_ggtt_node into the GGTT
> > + * xe_ggtt_insert_node() - Insert a &xe_ggtt_node into the GGTT
> >    * @ggtt: the &xe_ggtt into which the node should be inserted.
> >    * @size: size of the node
> >    * @align: alignment constrain of the node
> >    *
> > - * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
> > + * Return: &xe_ggtt_node on success or an ERR_PTR on failure.
> >    */
> >   struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align)
> >   {
> > @@ -701,8 +770,45 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
> >   		return node;
> >   	guard(mutex)(&ggtt->lock);
> > -	ret = xe_ggtt_insert_node_locked(node, size, align,
> > -					 DRM_MM_INSERT_HIGH);
> > +
> > +	ret = xe_ggtt_insert_node_locked(node, size, align);
> > +	if (ret) {
> > +		ggtt_node_fini(node);
> > +		return ERR_PTR(ret);
> > +	}
> > +
> > +	return node;
> > +}
> > +
> > +#ifdef CONFIG_PCI_IOV
> > +/**
> > + * xe_ggtt_insert_node_shareable() - Insert a new node in the shareable GGTT range
> > + * @ggtt: the &xe_ggtt into which the node should be inserted.
> > + * @size: size of the node
> > + * @align: alignment constrain of the node
> > + *
> > + * Allocations always start from the top (DRM_MM_INSERT_HIGH).
> > + *
> > + * Return: &xe_ggtt_node on success or an ERR_PTR on failure.
> > + */
> > +struct xe_ggtt_node *xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align)
> > +{
> > +	struct xe_ggtt_node *node;
> > +	int ret;
> > +
> > +	if (!ggtt->shareable_size)
> > +		return ERR_PTR(-ENOSPC);
> > +
> > +	node = ggtt_node_init(ggtt);
> > +	if (IS_ERR(node))
> > +		return node;
> > +
> > +	guard(mutex)(&ggtt->lock);
> > +
> > +	ret = ggtt_insert_node_in_range_locked(node, size, align,
> > +					       ggtt_shareable_start(ggtt),
> > +					       ggtt->shareable_size,
> > +					       DRM_MM_INSERT_HIGH);
> >   	if (ret) {
> >   		ggtt_node_fini(node);
> >   		return ERR_PTR(ret);
> > @@ -710,6 +816,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
> >   	return node;
> >   }
> > +#endif
> >   /**
> >    * xe_ggtt_node_pt_size() - Get the size of page table entries needed to map a GGTT node.
> > @@ -793,6 +900,7 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
> >    *
> >    * This function allows inserting a GGTT node with a custom transformation function.
> >    * This is useful for display to allow inserting rotated framebuffers to GGTT.
> > + * Allocates from the usable range only.
> >    *
> >    * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
> >    */
> > @@ -813,7 +921,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
> >   		goto err;
> >   	}
> > -	ret = xe_ggtt_insert_node_locked(node, size, align, 0);
> > +	ret = xe_ggtt_insert_node_locked(node, size, align);
> >   	if (ret)
> >   		goto err_unlock;
> > @@ -835,6 +943,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
> >   static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> >   				  u64 start, u64 end, struct drm_exec *exec)
> >   {
> > +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> >   	u64 alignment = bo->min_align > 0 ? bo->min_align : XE_PAGE_SIZE;
> >   	u8 tile_id = ggtt->tile->id;
> >   	int err;
> > @@ -852,16 +961,16 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> >   	if (err)
> >   		return err;
> > -	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
> > +	guard(xe_pm_runtime_noresume)(xe);
> >   	bo->ggtt_node[tile_id] = ggtt_node_init(ggtt);
> >   	if (IS_ERR(bo->ggtt_node[tile_id])) {
> >   		err = PTR_ERR(bo->ggtt_node[tile_id]);
> >   		bo->ggtt_node[tile_id] = NULL;
> > -		goto out;
> > +		return err;
> >   	}
> > -	mutex_lock(&ggtt->lock);
> > +	guard(mutex)(&ggtt->lock);
> >   	/*
> >   	 * When inheriting the initial framebuffer, the framebuffer is
> >   	 * physically located at VRAM address 0, and usually at GGTT address 0 too.
> > @@ -880,28 +989,31 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> >   	else
> >   		end = 0;
> > -	xe_tile_assert(ggtt->tile, end >= start + xe_bo_size(bo));
> > +	end = min(end, ggtt->size);
> > +
> > +	if (end < start + xe_bo_size(bo)) {
> > +		ggtt_node_fini(bo->ggtt_node[tile_id]);
> > +		bo->ggtt_node[tile_id] = NULL;
> > +		return -ENOSPC;
> > +	}
> >   	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
> > -					  xe_bo_size(bo), alignment, 0, start, end, 0);
> > +					  xe_bo_size(bo), alignment, 0, start, end,
> > +					  ggtt_usable_insert_flags(ggtt));
> >   	if (err) {
> >   		ggtt_node_fini(bo->ggtt_node[tile_id]);
> >   		bo->ggtt_node[tile_id] = NULL;
> >   	} else {
> >   		u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
> > -		u16 pat_index = xe_cache_pat_idx(tile_to_xe(ggtt->tile), cache_mode);
> > +		u16 pat_index = xe_cache_pat_idx(xe, cache_mode);
> >   		u64 pte = ggtt->pt_ops->pte_encode_flags(bo, pat_index);
> >   		xe_ggtt_map_bo(ggtt, bo->ggtt_node[tile_id], bo, pte);
> >   	}
> > -	mutex_unlock(&ggtt->lock);
> 
> We're switching to keeping GGTT mutex throughout GGTT invalidation. This
> creates dependency between
> 
> this mutex and invalidation mutex, and also keeps the lock during GuC
> communication, which greatly
> 
> increases the time window in which it's locked (the previous operations are
> insignificant time-wise in
> 
> comparison to GuC comms). Do we have a reason for that, or is switching to
> the guard just a style fix?
>

No real reason, it was just a style change. I'll go back to the explicit unlock before
the invalidation

> -Tomasz
> 

Thanks for review!
Piotr

> >   	if (!err && bo->flags & XE_BO_FLAG_GGTT_INVALIDATE)
> >   		xe_ggtt_invalidate(ggtt);
> > -out:
> > -	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
> > -
> >   	return err;
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> > index c864cc975a695..59b2f02870195 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.h
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> > @@ -24,6 +24,10 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt);
> >   struct xe_ggtt_node *
> >   xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align);
> > +#ifdef CONFIG_PCI_IOV
> > +struct xe_ggtt_node *
> > +xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align);
> > +#endif
> >   struct xe_ggtt_node *
> >   xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
> >   			      struct xe_bo *bo, u64 pte,

-- 
