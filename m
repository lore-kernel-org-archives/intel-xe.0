Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76536EB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 11:43:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E2010E038;
	Wed, 28 Jun 2023 11:43:36 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA6B10E038
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 11:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687952614; x=1719488614;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a8GyC0+bv1MMcZE30tiVqg/9MRKhtXIVsdUHWeD3GJ8=;
 b=HVqfMtQerb8IJ6hTfWMazraxPSE8IwoYaGpdtybOTxpNo7OVTdR4QtLE
 flueE/qtmVLqc+wRtMx8Zon+G2wJAAFetpN7V43B3D/XCZMgaTjuzZNV2
 cvXHWP22J6Y+mhVp25WTpNanjADWhnC82DMKZXdq/4hLaPZzZ7oOgWC9s
 BnvwPhS7/zcbH1q502z/Kk87UoS3VjTnny8MA/3kHMv5L+RWJYBzCCxph
 ghlB5OlDa2vZ32PkY3bauIv/lr5EVGH6AIVsW1LvqFQ6zvCPBYLCzrOrD
 MCYDMPWw9B/qC9oq48Kd6JkVSK00Q20joLRx3o7RMRzWJrRB/kXDlulBf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="365281713"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="365281713"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 04:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="752216951"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="752216951"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 28 Jun 2023 04:43:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 04:43:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 04:43:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 04:43:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbpE1DSvtAI+1R4xEtgqEAZMCUmfU6+THCEN0X6COKDE9GjwLk6nNmBw4XbiPjx+gV1vqOqpsqOMoeiQZS5+rDETPgtMbcXqLyXwra0q38VdUYsYY+EYkZgOMprSbUEHaSIjUcXA2pU++2StWTuw+cGMHmZpK625SLvTLX7ftVa0Sjb/ByKCRTN+SbKNg5F/xXqNi/Ph0I0xhNWUQpBThNDjoIGg6GepAVCIPlcugkgeQZnasYR4aKdDmCAfv5NsYX+dx6N2pxZavMu5EXtlvkvU3SppeSqTT7hw73Zy4qdXmXdIkmfJGKk5Tc5ihd3sPIc+jUHDmMhanP4cfITGlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZeZiGTkTGJpLC7VlMrraymGEzMhWqs7ur9v2q14Klg8=;
 b=ZrsDdHTHXa95V98NVAm2zKphA1cTulHFL5n97ZySSCxfjMzqxKz3e7QJwvUtThE2GhTwwn6S/WtYhbbQQw96yepFYkY2ojk06XousFdon5Dt7miul5nIE8KfneDlVRuOzh0wBFExq8umLZEEitmKsgyhOkEDiloeO54js6lT1r1oGEOrUN1oUPgsX9jHl8mIk+X/YyV5BmpP9RwiXTmX0OHIE2/PtcpE++HTe5mnGSdR51fXTzDo/qx+RlJ6KaEGViDCTkP0qh1UyO+E3yZI4AeA0mntF15mspVd4kpIBsQm03HEJyPSkwwb3Hu3vPSdOKhzwarg8bflQoNulQeBiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CO1PR11MB5122.namprd11.prod.outlook.com (2603:10b6:303:95::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 11:43:02 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4%5]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 11:43:02 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH V3 0/6] drm/xe: Add engine scheduler control interface
Thread-Index: AQHZqbV/JQWfp1Ckn0qJDx6IP7PMlK+gF9NA
Date: Wed, 28 Jun 2023 11:43:02 +0000
Message-ID: <SJ1PR11MB6204958BA5BF21A8805CD90D8124A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230628114732.3598169-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230628114732.3598169-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CO1PR11MB5122:EE_
x-ms-office365-filtering-correlation-id: 1c557337-12ad-4a0b-2cd4-08db77ccd4b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lCOkz4TlLiQpuYvKvlmhi142KmZwiEnvQmteKw+c9LGfiiscQm3SwHGQs7eMS3CKltCab1EkTVnsj+FsUBJs7UQPr560vgykeTkOWgKuuFqnWplQsGnXCQPrwfVYccyaK+FR6/57SoYejEf/342J4ROywvv7i21yeJyg22S7gLR8HvusEyPnkCvjFhApOO2UKDFGSphNbjYAPhO+X3ZpvNXBhrctgo5Q5SfyO3Y8M4bXwuj3kTreARHWbkSb9Z0LN6m6XI2iTlNRESb7zM2kyUoK2CrJGUFEOcjvWjstspQNzpUJRuU+theqeiVVhbMz40b+fiQr8wXYC7mrpS8I0Yb7gj74Z+FUw3oZ3yrrrZb5sC8R5mM2iadVtAspWlnzS01fmfIdvQ3h0CRpbAJRGJDz3JBAcz9wbPW3ni2JkceAHUKhgF1ha0BXr7lzrv/ZeBqsSW+W1RyoohaIUYrYi4QqWH+6aTZijc32csQrmMGXI03UEdeZ4fsPTg1bHHCha7yQyhRSvkDWyDa8T/LDWG45D5mCFliiQWRvAc7FCKI61TBaXMK1Vw0DjJnasC+sZ9LNDYXx/ZI8c5y4hD19BJdUtV7fNjnWHboDq9Kb1vrMe1E/Vs5ddHQd9tdDOlAV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199021)(53546011)(6506007)(122000001)(52536014)(33656002)(66476007)(76116006)(5660300002)(86362001)(316002)(64756008)(6916009)(4326008)(55016003)(66446008)(38070700005)(66556008)(41300700001)(8936002)(38100700002)(66946007)(82960400001)(8676002)(107886003)(2906002)(9686003)(186003)(7696005)(26005)(71200400001)(478600001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FB3mmV4zWRoT+Q5FVBjgFXtxBRA6vpJURzp8ZoEgMt+tq5LUHIBwi1KRtZuc?=
 =?us-ascii?Q?RN+clpHHyr79UN7Z/p/UaW5nBS1DKdXtfm1CY5m/Ebw+X3tRDDupPz2rE5Be?=
 =?us-ascii?Q?t+uH+n3ZRRhiNNPdHvyzuykwPwZFFQuJ0UjNct3RLoB0HbSGJ67CHUjP8YfM?=
 =?us-ascii?Q?raQCbzlH1gKszeQaJP9/aYXFHR3MhrzOOSBT+zB3KZ8PEH2gs/VWmVHS0vy6?=
 =?us-ascii?Q?ESvi8TmlzJhH88ro0//MmLoeYZGd1CiK5a5CKNS6S7Fpx/Wr5DTG8kKFCcOv?=
 =?us-ascii?Q?S8cbWbZu9QtILPBiDSREjE4Qu5EFPfxbEuUSpUp7+SgTrJTNZmUFmw+p4mR6?=
 =?us-ascii?Q?W8wWZWMzktJUoBtVg5MrM2NeMZboNlLDx8psAqDwPp4XD7drSfFmYY5Sz40Q?=
 =?us-ascii?Q?7EFHt0pbjnmNZ50duqDz0o9/hVcvocE6Q5RwbhHmItb3QKGbavH1BDsGkiFQ?=
 =?us-ascii?Q?IbLZCU7M+Qm7dSPa6GvVfp+wgtT1XXXQZHqmdlsXBLzZUSBWJLfmm+q8DuE2?=
 =?us-ascii?Q?QRyADvHB1qEC81hNncgnWFi4VUgof9xyhJVJvbql65dG0cMV0fNa7wzJ7jc3?=
 =?us-ascii?Q?u+hIRkG/yk0Pjcy6L1PWnKL8oy3V3qvyDUwEngBh8HVbpGfeLnDVQHVFgW+b?=
 =?us-ascii?Q?trFGxPjjnMODN9InARtiR1lmos/1wapEqt8oMoSVGFW0MaRowAX94LgOyPKu?=
 =?us-ascii?Q?6omziK92vsBxabePKcEpIUttCEal9idAzGa7+jN0o5kP62uajQg9S+RsfHYR?=
 =?us-ascii?Q?O30JvhIJJOBa9GDK6SaVK/XUGRH0vKBA3oZHYXD7RN3tE0HbYACWRCFZjvFX?=
 =?us-ascii?Q?F0c16hkEfbKyeeeQkn4JK9BuGtf2f1M17/tB55HOcTF60Oh/3IDN0GQ1Pne8?=
 =?us-ascii?Q?KwzDlC6GBd78g7HDzVTOnebDSqqtIua+/VzX+5KtO5Cif8U2kxl/F2CUdheN?=
 =?us-ascii?Q?TVSuEn5BpWX7idBincsG3FbbKeM6vxh2NloC4cWGkyZpiWhA/bEt2VlAQ8k6?=
 =?us-ascii?Q?DLXOb0LzsN88HMzIFMEKmRg67QAZ8XxSJmUYIKL7z9nuU+N/C8CYRCR2wh1K?=
 =?us-ascii?Q?hw7lJnta0KM1+tfMTwhq8hnhIz1sUQlBw7k6c5Tf4UUE+T6vjknm19Le7Rlr?=
 =?us-ascii?Q?FeUT2rOHX6bgH7/Q01vYNucZeQfLOflEpyZnPHaTVtWvJvirEcOEtNYZwiJh?=
 =?us-ascii?Q?8qznsZWhHKz7G3pInzY9yEgszs104J1ufClJByygCZZx8ussKPz5jLKptgng?=
 =?us-ascii?Q?9E5Sjy1PhAMLJZuMotwiHyHcw7/ZFOop58x+MADYaBfBxwE1bEteYD2iCdN0?=
 =?us-ascii?Q?/Bw+h+jvXhYhiXRMONJUeBtHdPeFHVhI7kkkviWPu3AlicjT2y40UK7x5j76?=
 =?us-ascii?Q?fEEro50kjJStYhsqTQ4MZv4JVzR+fGGBbxIlTCtpzK3PFX4Mjx0KJZzwMeOk?=
 =?us-ascii?Q?3Y7eUn9rrctQ5Xg41gwiXnE9oMmoo2ImsjPiTuQydgyCECJ3niHEEpC1cDVC?=
 =?us-ascii?Q?HlfDo7DFebhcH2LIXwYDBX9vIrnlNdWfwdsAgXQLVKeBr/jn4Hw9p4nxFUE/?=
 =?us-ascii?Q?O06KRA/KplyB4autnK2Fgq7QIv80h6HTSYFgARk3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c557337-12ad-4a0b-2cd4-08db77ccd4b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 11:43:02.8397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eDd7PAI6TG2onfv7cSj+s5EX/NEnq1E4iVX97wV4SDE/o15VJxZxYdrtcSLWVe9FD7Bq6tZjGdevy0tjhPo2raKKvoshllt+mcKXsaRh56g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5122
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 0/6] drm/xe: Add engine scheduler control
 interface
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
Cc: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: Wednesday, June 28, 2023 5:17 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Subject: [PATCH V3 0/6] drm/xe: Add engine scheduler control interface
>=20
> Patch series introduces this in several patches, 1. Add basic directory
> structure under its GT, as below
>    DUT# cat /sys/class/drm/cardX/device/gtN/engines/
>    ccs/ bcs/
> 2. Add default entries with its value for user to go back
>    to default
> 3,4,5 : Add individual engine properties sysfs entry
> 6: Introduce min/max to control in what range these properties
>    can be set for elevated and non-elevated users.
>=20
> VLK-46764, VLK-46767
>=20
> V3 :
>     - Improve class_mask logic
> V2 :
>     - Rebase to solve conflicts
>     - Use sysfs_create_files in this patch - Niranjana
>     - Handle prototype error for xe_add_engine_defaults - CI hooks
>     - Remove unused member sysfs_hwe - Niranjana
>     - Restric min/max setting to #define default min/max for
>          elevated user - Himal
>     - Remove some unrelated changes from patch - Niranjana
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>=20
> Tejas Upadhyay (6):
>   drm/xe: Add sysfs entries for engines under its GT
>   drm/xe: Add sysfs for default engine scheduler properties
>   drm/xe: Add job timeout engine property to sysfs
>   drm/xe: Add timeslice duration engine property to sysfs
>   drm/xe: Add sysfs for preempt reset timeout
>   drm/xe: Add min/max cap for engine scheduler properties
>=20
>  drivers/gpu/drm/xe/Kconfig              |   7 +
>  drivers/gpu/drm/xe/Kconfig.profile      |  38 ++
>  drivers/gpu/drm/xe/xe_engine.c          |  62 ++-
>  drivers/gpu/drm/xe/xe_gt.c              |   6 +
>  drivers/gpu/drm/xe/xe_gt_sysfs.c        | 671 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sysfs.h        |   9 +
>  drivers/gpu/drm/xe/xe_gt_sysfs_types.h  |  13 +
>  drivers/gpu/drm/xe/xe_guc_submit.c      |   5 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c       |  11 +
>  drivers/gpu/drm/xe/xe_hw_engine.h       |  31 ++
>  drivers/gpu/drm/xe/xe_hw_engine_types.h |  23 +
>  11 files changed, 870 insertions(+), 6 deletions(-)  create mode 100644
> drivers/gpu/drm/xe/Kconfig.profile
>=20
> --
> 2.25.1

