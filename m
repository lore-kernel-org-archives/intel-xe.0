Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EBDC79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 18:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8678F10E173;
	Tue,  8 Sep 2026 18:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5HTuxHK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD38710E173
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 18:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788893709; x=1820429709;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6gdUdJYVuobjjennQJ9UELs+xZ9n9Qfc3LHFTyliLH0=;
 b=m5HTuxHKp+NM6Uu2KPB2gOdHGKzMQc4KVgIwKCazsbjm+yJgN6HJvBvt
 d2bGsusAg6YR3Ut5/dF9+NyxAzTAC9Jo40UbwRWmmEt6uWmd4h1ELauSi
 Dd9jR0ROxUOWnWu0593LazEWB48E6Wq99Y8VBmvVaH+gfigqWEJKlvdUR
 P+1fADBD4xvZd0PwKELcX8ZsZw+AgTMVpj55gkdh7JT2DcK9P8io/lR1z
 R2d917XVPbyhEHtgYtjmhSn9aKRW/KgTArmYVkICbB2fAuuvV1nDapqqU
 fC/J7OcgCyAAjLgfxq8YxhMBZMASdYrcvd6ryrQTQaWfkLXks/drLPPQ4 g==;
X-CSE-ConnectionGUID: dHOTOdn9RGmsFvfuKx5WKQ==
X-CSE-MsgGUID: fhYIInq5RTmdLClZDtJ+Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89512376"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="89512376"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 11:55:09 -0700
X-CSE-ConnectionGUID: C+XR8+//ROSQ2KQFPPSO8g==
X-CSE-MsgGUID: nEANt0T+TFa0qMcFY2I3dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="294594961"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 11:55:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 11:55:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 11:55:07 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 11:55:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ix1JQ8rtN2fAlkvb1h3cykCoDNrxHOuKZFAhakIUcFSEzT0QxB/BEWiizGGdnR9HGHTZ78LImbkEbW8ccnguIHuoWxM2pXfA6xHRM/TS1Ynq1Ry3SiOjocqHL3xvhTw9hTgRDxHLEJGSZDz5DAyM/d35FMWasH8KNF4Y0mpNsMlxo1NbMd/TO9i4SKAl//SPupEd9I4zt4usF4oVwjMYRnEJBsR5TbUiJemqDqZGwdGQvSAYI4D+rslVGyD+BwD8mLl6qIMpSy0Fb9o7VlxErs2bRXSRxC6UjXR4cie5y05/gNQp2ZYgRokc8iBJcdmTJQLVPoFSqenPNHuMpiPRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=et5wJFUaFlY+As2ZjxE9Ad7I3nrnON9zsrvpbjWHDxk=;
 b=J/v5DYEWi9bV260T6ou6E57vJRZePJzGPTvmv6ZTPqHZBqzmjKfnTCWkUqrio+VN3xPA1NItngQYRRove1Zg1y7f3Gs4sfWiPZMjHxFYA32cRxKt5wWMYRXM2qHmQ8fShg7GmxA9qMqwqHEHVG3YxvM/9O1TYp3nom5kQUUp1MZfxPhFPcUe7UWfnAuV3sZ/KLRNo6rC4RuInUV/FCvt9tcpWmNTGTojbTTUHzsM/RCoI01+Omq8pytyfVy1UzBvBP0Wq8h7LUlK6mVLcxYh/W7I813HwIOhafw5JOlfZpHEPbT3jlUoyt4+Vz+IC51js1mRBO4D5h0GWD9FPmPZ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SA2PR11MB4810.namprd11.prod.outlook.com (2603:10b6:806:116::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 18:55:05 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 18:55:05 +0000
Date: Tue, 8 Sep 2026 14:55:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Iddamsetty, Aravind"
 <aravind.iddamsetty@intel.com>, "heikki.krogerus@linux.intel.com"
 <heikki.krogerus@linux.intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/cri: Expose device UUID through sysfs
Message-ID: <aqBaBBYpo1yoizXd@intel.com>
References: <20260904160608.2004174-4-badal.nilawar@intel.com>
 <20260904160608.2004174-6-badal.nilawar@intel.com>
 <65b77b6b-a21f-4631-9cb3-a5c0e07645c5@intel.com>
 <5ac64235-025a-48c9-ac18-893fcfd6db6a@intel.com>
 <01acf34a-3231-45c7-b8ce-e70ead34a44d@intel.com>
 <BN9PR11MB5242477CE55973FF7BD0720A95B22@BN9PR11MB5242.namprd11.prod.outlook.com>
 <b1ac6708-86e1-4c26-858b-5343b075bbf9@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1ac6708-86e1-4c26-858b-5343b075bbf9@intel.com>
X-ClientProxiedBy: MW4P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::12) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SA2PR11MB4810:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c0b8cd7-88f9-4c01-2bfc-08df0ddab1f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: oCMH75rSQl8VKOqJ1faEIDUfzF/9s8kzjqLGSULeyADCYFSo9uBCEk/SNGP4/JOpKnmwJvEoix9Jh2WG95+Fxd4eESMweUEOzMIGLQJWBiywEpN2oVenEx46CThzVP+LO4P8bAXoFscFf9+ORMfJwqorj6AN4ueF72Y2WYZhJ1iEmITFnrxxj5CzZwdcxXbs/ZuIUbmhWb2Qu3PR6gufXL5bB7Gl9j8xJnKS7qDkpKQMfETrOqczEmvx1TkpzFH8W4Bi3aVTQiRreSGF/P0Fo2pKPBkHE4RalW+/oibegaCrfERjHdxMiuGyHGitArkVKSXN9gq3Ix/B9ManVmKBxp6wtwMlDVYvWj44XtMZl0mpxqVcEayyc8dulKRrZQ65CeiCBH+GoDOylHaZAjMguGZHwzGbkj6Z6dAP6klto81S0LbhKzvgqcHC60yA4QFnQU1OcqncFx9VPgkOM1VS+/ooe+Ss9C25MkrN149mVoHVMBAAWPiD14BMQdcuJOThcd+CQeBhpKRZ6uWqtd4ssZy6kq07XL8SLk1mR4BO3Irq+YpqMJqkypCbdv0cxpKK1FA+5e2o2pTn6cvDmnsnSzmCb1Za+PvlYkKUlbEIej6OCcdDTh0prvpoJGkwGPKm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0zo4H+VoNV4uG6xn0Zt3Ofn504AuKJzqov7nCpvgXliP+A8zTvdOeXIZL3?=
 =?iso-8859-1?Q?6HyUFYoHvLYE/vfwIKaUPWOM4E0sUEur/EP2zT3BNDI36Fa5rcw5TKR9rR?=
 =?iso-8859-1?Q?G2zSzaOcpqwz6+U7UBW4ErBxz5n6noiW5NdkSQXSzOU0RsTvShdO3OnzwW?=
 =?iso-8859-1?Q?yAjexfpRiHTk9NPdzWsomEt58X3PAMhNUUc30dqzLmApZu6px6JIw3eQSm?=
 =?iso-8859-1?Q?ESG0Ry55eAHCWYTwyrVW2S2Vs9i5IUlQ8v+pPZ6v0AUiIaTwgYaT+5nq01?=
 =?iso-8859-1?Q?cHArOIL03cRiBf2uU1p+QsfImu/0XHBABKsfMAoG3JJPGilfL9uy6VZ/Mz?=
 =?iso-8859-1?Q?VHpvv8oK/uGBWV/KuBDRQd4kx8VOHGi/F70Q3J6Z3u4iQpO1wJzx5K0EqI?=
 =?iso-8859-1?Q?Zp+IhrFrLx4ERzKIQv2MkIMlZ0cfae0bS8QFb9xvwdWcuYTrW3++r/O91T?=
 =?iso-8859-1?Q?67orPahT2KliEKE7tOWqH41ux9V5iH4RlxBs/tSdm3+8ho7uSy1MxRYdL3?=
 =?iso-8859-1?Q?ef5gj8nHhKcx6FvRztN9zlLDjk6ZVsWoEgtGkiiX571T8dW/9IKq6Y1XbX?=
 =?iso-8859-1?Q?Skc8goxa8m0bdVhlrtxPBUfn9+zU1+a/Bpa+FsdqSK/M9AiNYsEDYLS6D9?=
 =?iso-8859-1?Q?oCFW63fxEoGaZyOjFTD3xCuyIWPPZF2ahXfg6wRH989nU2EHh5ABrAK0aP?=
 =?iso-8859-1?Q?VwlqfIKfXsEB/Rk6bScW1kHMO/I8Yhp3jkdIslGKKFSxOxYY7V2thlPIz1?=
 =?iso-8859-1?Q?exEOIS/NXkEidnBI4prF+g43LhRu2HImzjavnVEe48uSKZZwKRVmjaO0RX?=
 =?iso-8859-1?Q?p/biAh4htVo/lj+TXsFSUu4mIjMXKOxDHWJXFR1lkA3aO0oTazDUSpgwHb?=
 =?iso-8859-1?Q?aCMbfD9XTQRs+lTM1dSbt7K5tQKz2bnMA9H+ZOtfP6v1rseEXe92wHA6KS?=
 =?iso-8859-1?Q?dp58EVnT0/q31y+ZuCWOWT6AilvuaYfY1oybDIiNJeB4oNey7OvqU+C7aP?=
 =?iso-8859-1?Q?WVDnhUr+6DXYiXpMVXviRvAT64QFFgh3BKak3kqa9pwcAEE1FrGVnhsOan?=
 =?iso-8859-1?Q?5+UBnOElR62y9LUeqhp+wKB/GCa0ixgtG3vPzFGjVxm8d0OtdBsDyOIrBf?=
 =?iso-8859-1?Q?aA+7njA/4HACsjREWF7UlCjDQuZYR9HrB4Na85ldGMHkts10I6t4D07r5j?=
 =?iso-8859-1?Q?+Pf3npDtqHMKUvLXeJ4P4vUI5eRhOca1KIWMCcVh0Lci10w3JARclh17GL?=
 =?iso-8859-1?Q?SxSbyDzN1zNN0o40tIUMlEtL+GWFVwbiP7K+yuq1ixhOGVvjaakRkETpmI?=
 =?iso-8859-1?Q?Fcp0M2oDFj544xSP++/S5OQUyXnjRiOTsTyMK+K0fD7k2wKuFrspctQlEn?=
 =?iso-8859-1?Q?P0J8C79xOxBtkMhMyrlcqbQUPEQZnkdnTBkcjSv8NTUFnemV4kcfHJmp0M?=
 =?iso-8859-1?Q?NKC0w9+fmP9NPZYdzZV1ENqDO0h5yslULZ3Y0WOtqENhwxidqnXtK1Yhis?=
 =?iso-8859-1?Q?AxJMFhDmMCoJw0BbwFstXRrfAaf/WpUfUgO+sGExnQR8pr65KpTXAl8NqR?=
 =?iso-8859-1?Q?Q/wnUA7mAihDsH3MPanK6A6PqnUVI/MvZUDU3ivIm8zrZWUaSwH1m9mNP+?=
 =?iso-8859-1?Q?hy54eZYj2TtUBLGS6np4Ax06T0TZKEkoSuOUukytp5IUk0MitS4d49qzZQ?=
 =?iso-8859-1?Q?l8AuZxSMoD338wiONeeEOND+yuY28KHz/EiiTikULHGHAXYdOI33jrgbt+?=
 =?iso-8859-1?Q?vrmKlFgwyt77bRaovKM/Nh2WcgLakAXOKVoPlGQjdI2593GTVJoAjHPrXy?=
 =?iso-8859-1?Q?gXHOzjBROg=3D=3D?=
X-Exchange-RoutingPolicyChecked: O+NR0pTEwsGDzEhAhUVL40n+L231W4MEFOAWtgo3GjMfIu5D2I+jfhsFpfyRthr/A7Nt/fR3dJXRVA41G8sxW1D8y/Tvo4NN0MLh4RNicyNo9ssnifIpenEW6DytaVXV2IH8oLJfFr0v+4YoB3UAUqM9z/SbsBDpvUKefG0qNQWPAYTq8DwZuVAF/+1nrjW11gyPsTKywK0qJBaJTcj8C1m8jrfpX38bv2AD6omjF1M6eWHcDqONvnBZ6pkiWW81Uyvgx7rxx4xmIlHKZNpBzTl16Q8/r5tzNYOT1PFmm1eFlYqiEPKrU07yckz1wl17bBp6kyVWi9bB8LIw5hR8Kw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0b8cd7-88f9-4c01-2bfc-08df0ddab1f8
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 18:55:05.2503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IvWC3r57wxx0UE8MGypHvmbuClDXwnmplYc9zOV443xiTEoeQQAeaKFT1xBclk/mFVtAkvfcU9p2Bjj987hImw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4810
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

On Mon, Sep 07, 2026 at 05:48:12PM +0200, Michal Wajdeczko wrote:
>
>
> On 9/7/2026 2:04 PM, Gupta, Anshuman wrote:
> >
> >
> >> -----Original Message-----
> >> From: Wajdeczko, Michal <michal.wajdeczko@intel.com>
> >> Sent: Monday, September 7, 2026 5:25 PM
> >> To: Nilawar, Badal <badal.nilawar@intel.com>; intel-
> >> xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> >> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Jadav, Raag
> >> <raag.jadav@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Koujalagi,
> >> Mallesh <mallesh.koujalagi@intel.com>; Iddamsetty, Aravind
> >> <aravind.iddamsetty@intel.com>; heikki.krogerus@linux.intel.com;
> >> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> >> Subject: Re: [PATCH 2/2] drm/xe/cri: Expose device UUID through sysfs

s/uuid/uid everywhere please. It is only a 64bit, not a 128.

> >>
> >>
> >>
> >> On 9/7/2026 11:13 AM, Nilawar, Badal wrote:
> >>>
> >>> On 04-09-2026 22:07, Michal Wajdeczko wrote:
> >>>>
> >>>> On 9/4/2026 6:06 PM, Badal Nilawar wrote:
> >>>>> Expose a read-only sysfs attribute, device_uuid, that reports the
> >>>>> GPU's unique hardware identifier.
> >>>>>
> >>>> Bspec: 53048,53049
> >>> Sure
> >>>>
> >>>>> Assisted-by: Claude:claude-opus-4.8
> >>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> >>>>> ---
> >>>>>   .../ABI/testing/sysfs-driver-intel-xe-gpu     | 10 ++++++
> >>>>>   drivers/gpu/drm/xe/regs/xe_regs.h             |  2 ++
> >>>>>   drivers/gpu/drm/xe/xe_device.c                |  3 ++
> >>>>>   drivers/gpu/drm/xe/xe_device_sysfs.c          | 36
> >>>>> +++++++++++++++++++
> >>>>>   drivers/gpu/drm/xe/xe_device_types.h          |  3 ++
> >>>>>   5 files changed, 54 insertions(+)
> >>>>>   create mode 100644
> >>>>> Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> >>>>>
> >>>>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> >>>>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> >>>>> new file mode 100644
> >>>>> index 000000000000..1a4bdfbad8d7
> >>>>> --- /dev/null
> >>>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> >>>>> @@ -0,0 +1,10 @@
> >>>>> +What:        /sys/bus/pci/drivers/xe/.../device_uuid
> >>>>> +Date:        September 2026
> >>>>> +KernelVersion:    7.4
> >>>>> +Contact:    intel-xe@lists.freedesktop.org
> >>>>> +Description:    RO. Unique 64-bit identifier of the device
> >>>>> +instance, read from
> >>>>> +        the device's CRI_DEVICE_UUID register and printed as a
> >>>> hmm, maybe in the user facing documentation we should refer to this
> >>>> register as
> >>>>
> >>>>     DEVICE_UUID(102008)
> >>>>
> >>>> instead of the meaningless macro name?
> >>> I will drop "read from ..." statement.
> >>>>
> >>>>> +        zero-padded 16-digit hexadecimal string.
> >>>> if this is UUID, shouldn't we print it in UUID format? see %pU
> >>> I this is not UUID, i will rename the node as device_uid.
> >>>>
> >>>>> +
> >>>>> +        This sysfs file is present only on Intel Xe platforms that
> >>>>> +        provide a device UUID. It is available to all users.
> >>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
> >>>>> b/drivers/gpu/drm/xe/regs/xe_regs.h
> >>>>> index ef4746b7b5d3..68226fe0b659 100644
> >>>>> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> >>>>> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> >>>>> @@ -30,6 +30,8 @@
> >>>>>   #define XEHP_MTCFG_ADDR                XE_REG(0x101800)
> >>>>>   #define   TILE_COUNT                REG_GENMASK(15, 8)
> >>>>>   +#define CRI_DEVICE_UUID                XE_REG(0x102008)
> >>>>> +
> >>>>>   #define GGC                    XE_REG(0x108040)
> >>>>>   #define   GMS_MASK                REG_GENMASK(15, 8)
> >>>>>   #define   GGMS_MASK                REG_GENMASK(7, 6) diff --git
> >>>>> a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> >>>>> index 8583b2e9ecf4..e8db8871990b 100644
> >>>>> --- a/drivers/gpu/drm/xe/xe_device.c
> >>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
> >>>>> @@ -801,6 +801,9 @@ int xe_device_probe_early(struct xe_device *xe)
> >>>>>       if (IS_SRIOV_VF(xe))
> >>>>>           vf_update_device_info(xe);
> >>>>>   +    if (xe->info.platform == XE_CRESCENTISLAND)
> >>>>> +        xe->device_uuid =
> >>>>> +xe_mmio_read64_2x32(xe_root_tile_mmio(xe), CRI_DEVICE_UUID);
> >>>>> +
> >>>>>       /*
> >>>>>        * Check for pcode uncore_init status to confirm if the SoC
> >>>>>        * initialization is complete. Until done, any MMIO or lmem
> >>>>> access from diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
> >>>>> b/drivers/gpu/drm/xe/xe_device_sysfs.c
> >>>>> index a73e0e957cb0..a4d326159dce 100644
> >>>>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> >>>>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> >>>>> @@ -8,6 +8,7 @@
> >>>>>   #include <linux/pci.h>
> >>>>>   #include <linux/sysfs.h>
> >>>>>   +#include "regs/xe_regs.h"
> >>>>>   #include "xe_device.h"
> >>>>>   #include "xe_device_sysfs.h"
> >>>>>   #include "xe_mmio.h"
> >>>>> @@ -264,6 +265,35 @@ static const struct attribute_group
> >>>>> auto_link_downgrade_attr_group = {
> >>>>>       .attrs = auto_link_downgrade_attrs,
> >>>>>   };
> >>>>>   +/**
> >>>>> + * DOC: device_uuid
> >>>> do we need this?
> >>>> you already described that in Documentation/ABI
> >>> I think I will drop the Documentation/ABI and keep DOC: section.
> >>
> >> hmm, but all other sysfs entries are defined in Documentation/ABI (which
> >> IMO is the correct place, not a local DOC section)
> > Is there a way to link the Documentation/ABI doc with drm/Xe Doc,  in case local doc is not preferred.
> > https://docs.kernel.org/gpu/xe/index.html
> > As this is Xe specific sysfs , AFAIU there should be some way from Xe Kernel Doc to refer this sysfs ?
>
> it should be sufficient to use:
>
> 	"See Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> 	"for a complete description of the attributes.
>
> see https://elixir.bootlin.com/linux/v7.2.2/source/Documentation/hwmon/sysfs-interface.rst#L92
> and resulting https://docs.kernel.org/hwmon/sysfs-interface.html#attribute-access

yes, please, let's simplify this as much as we can.

>
> > Thanks,
> > Anshuman
> >>
> >>
> >>>>
> >>>>> + *
> >>>>> + * Each Xe device exposes a 64-bit UUID that uniquely identifies the SoC.
> >>>>> + * The value is read from the CRI_DEVICE_UUID register and can be
> >>>>> + * read back through the ``device_uuid`` sysfs entry.
> >>>>> + *
> >>>>> + *    $ cat /sys/bus/pci/devices/<bdf>/device_uuid
> >>>>> + */
> >>>>> +
> >>>>> +static ssize_t
> >>>>> +device_uuid_show(struct device *dev, struct device_attribute *attr,
> >>>>> +char *buf) {
> >>>>> +    struct pci_dev *pdev = to_pci_dev(dev);
> >>>>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
> >>>>> +
> >>>>> +    return sysfs_emit(buf, "%016llx\n", xe->device_uuid);
> >>>> %pU ?
> >>> Not needed.
> >>>>
> >>>>> +}
> >>>>> +static DEVICE_ATTR_RO(device_uuid);
> >>>>> +
> >>>>> +static struct attribute *device_uuid_attrs[] = {
> >>>>> +    &dev_attr_device_uuid.attr,
> >>>>> +    NULL
> >>>>> +};
> >>>>> +
> >>>>> +static const struct attribute_group device_uuid_attr_group = {
> >>>>> +    .attrs = device_uuid_attrs,
> >>>>> +};
> >>>>> +
> >>>>>   int xe_device_sysfs_init(struct xe_device *xe)
> >>>>>   {
> >>>>>       struct device *dev = xe->drm.dev; @@ -285,5 +315,11 @@ int
> >>>>> xe_device_sysfs_init(struct xe_device *xe)
> >>>>>               return ret;
> >>>>>       }
> >>>>>   +    if (xe->info.platform == XE_CRESCENTISLAND) {
> >>>> use .is_visible instead
> >>>
> >>> Will add has flag.
> >>
> >> to be clear: my point was to move this check to the
> >>
> >> 	attribute_group.is_visible
> >>
> >> and I don't care whether it will use .has_uid or .platform field
> >>
> >>
> >>>
> >>> Thanks,
> >>> Badal
> >>>
> >>>>
> >>>>> +        ret = devm_device_add_group(dev, &device_uuid_attr_group);
> >>>>> +        if (ret)
> >>>>> +            return ret;
> >>>>> +    }
> >>>>> +
> >>>>>       return 0;
> >>>>>   }
> >>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> >>>>> b/drivers/gpu/drm/xe/xe_device_types.h
> >>>>> index 180d450a6deb..6fdd16eac906 100644
> >>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
> >>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> >>>>> @@ -257,6 +257,9 @@ struct xe_device {
> >>>>>           bool oob_initialized;
> >>>>>       } wa_active;
> >>>>>   +    /** @device_uuid: unique 64-bit identifier read from
> >>>>> CRI_DEVICE_UUID */
> >>>>> +    u64 device_uuid;
> >>>>> +
> >>>>>       /** @survivability: survivability information for device */
> >>>>>       struct xe_survivability survivability;
> >>>>>
> >
>
