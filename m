Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AFCD778BF
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 22:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7A410EC05;
	Fri, 23 Jan 2026 22:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DU0zXciD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA3610EBF6
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 22:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769207866; x=1800743866;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2EmXHFCqjWBqHtLZBLyVtbyqz/aqr1AinChe0RW1kqs=;
 b=DU0zXciDzX1/r085y/KpEGDJ5mAOen8ymOKm2HoR/to+1rpI8V8s9tXs
 fQIWhgkmxFs4n1bC0upGFQNyyNCAPpkCpDagbsQ+GldGZlnn4SEZRKzF1
 V2GS6B/8ri+YEBfA/3FuEUz3pc1PMrFhm6QK9ttVV9KqFTOVjzZ/MmmYL
 BxlNwjleTdsvIhJmSNIIpiKZGLTob+OmO+oivdIfqZtyonFuaBdZvDl1e
 dtRyQVPehso79JUUmiyJ2Ki6T/BPPvw7X1jU+56WxB+PcAmqB5i4omkAY
 Y6a4v6p3lsg8z73dm48wsbPk4khkyzv0eRkOHVRWC4AozAOyJL6sb+fzX A==;
X-CSE-ConnectionGUID: gRwSYQQsQNWHTD9DTxMSKQ==
X-CSE-MsgGUID: L3ulDGI+QJei0rs3KOBuUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70514862"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; d="scan'208";a="70514862"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 14:37:46 -0800
X-CSE-ConnectionGUID: EygUl32NQhefqLfgIDEVEQ==
X-CSE-MsgGUID: oFqLEXccQjyBxXqVTQ5oVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; d="scan'208";a="206942226"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 14:37:46 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 14:37:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 14:37:45 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.69)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 14:37:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xFVYzh+RGBap1OoKcbnfFohYCtzNgZsB3P6PsdNfF6npOTOUNij0HDytuigyYdinjpdwjY6zy3776a/wARdLXr8MoMERcQ3SuOUkFDM52PMB/AW14ZsD5XG7Uq2G7CrpU5msMmzjxHag7so2rOh7YqHfxyZS0qKM5yOHDx37ZSZxGSyth0r0V3SPeDgR3HI4NNjTWqCT5vY3irtnHtA7p458UT+MhBlOdxTv4/rr2mCodhwB7hDJAfmRjxDx9Ce9O38O++jDXFpXAMCMZg9XAbYCUbrekule892hR1xVypCNIez8iWjJMnsMioxXsljcS/cQqAzLVyMYOW70OTwwDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EmXHFCqjWBqHtLZBLyVtbyqz/aqr1AinChe0RW1kqs=;
 b=DfHMZ1+B9iZYMlpzDDLqXDlUGnqBT9a80bx6eGgzKSzTo09cTGw2uGYxfTwZlGZyK2FhXmAX0LBzzF1VA31l/35TkJ80Rzi76PTTPB4+Hd4YERNN+IIyiekscMnuSvL6sOmhHbMZeJSAE2rnKxBgeFOXhCOjpq6T2mRJEG63iuCNPXTRleA5hyxg0gPXvTP2PexlhPOgh6S/Lhg0gBiTyewp5S8RrmWVu7UkMVaeu2oP6qyjLTnoARwBayPKdAAhOhFTs+OWe5xkbe3bgbIV1LslagKZ2V/fZhCdP6/Q8FWY1Ph6lWyNHHy2iKHwmkotdNGPglW2Fq7NHRxC5aVffw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB6948.namprd11.prod.outlook.com (2603:10b6:806:2ab::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 22:37:42 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 22:37:42 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "broonie@kernel.org" <broonie@kernel.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Souza, Jose" <jose.souza@intel.com>, 
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: Mail problems for Lucas De Marchi?
Thread-Topic: Mail problems for Lucas De Marchi?
Thread-Index: AQHcjH46dqtjT6n8CUaWhLY9SILSBrVf7E4AgAAOee+AAACiAIAANPkAgAAA1YCAACeQgA==
Date: Fri, 23 Jan 2026 22:37:42 +0000
Message-ID: <0952430293e438fc76bfd1a8d080716583edc41a.camel@intel.com>
References: <3135e2fd-fdac-469c-be2e-6c1cb024883f@sirena.org.uk>
 <8542127c23736029c476033bc933e12503bc3fd3.camel@intel.com>
 <CYYPR11MB8430903D2AE8BDD782B59B128B94A@CYYPR11MB8430.namprd11.prod.outlook.com>
 <2919dcfb-68ec-46e4-858a-08a0d42c27ff@sirena.org.uk>
 <ca24e8a12732720302823d1571e217017e5744c4.camel@intel.com>
 <585d9e41-8627-48cc-aa3e-efb1ab9cbb90@sirena.org.uk>
In-Reply-To: <585d9e41-8627-48cc-aa3e-efb1ab9cbb90@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|SN7PR11MB6948:EE_
x-ms-office365-filtering-correlation-id: 2b19c5ee-2872-4ee4-a6a5-08de5ad005a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?a1VSSDFwM095aUtkRE5NUXdKdERuRVRETG9Sc1c5cy9LOHNubHY2ZXlTMDU4?=
 =?utf-8?B?dk5Zd1JoU3oyd1hYdFdLdmhaSTNBSG1RQVQwL2tnL2ttdTRXbmgybUxzZWxx?=
 =?utf-8?B?TVVkckcwdFhnYTh3WEVSbWZTdHlHWGdMa1hyR2JKRUErZFVPTXRGREhCU05j?=
 =?utf-8?B?ZGFDWmNMcStxZUY2cWV1ckJEU2gyWnpac0ZIa3hoYmRSTjVkWGliSlFFR1B6?=
 =?utf-8?B?Qk96WW9qNnBXUlB1UmxaSjcwRThzVitPRXcxbGJCbWpmeEhjM0xKRVgyOUtj?=
 =?utf-8?B?Vmw4ZHN5blhmUmxxUkhGRDJMd0MwZjVrQmZBTVkrbUFYZUk1WEhqdHVJZjhJ?=
 =?utf-8?B?d1pHK2wyUy81RS9vbmVrVkNMUEhJT1Z4cjQ1blZkY0V4S05uTXA1bzE5N1Nt?=
 =?utf-8?B?bUJoRkN4OW1ldDNlRFo0YTN5cGdiSU11Nld4QjBhVEc0cGlXb2Y2WmlURWl0?=
 =?utf-8?B?NnpiZDNhK3Z4VHY0ZjFSQmVNT3pjMkxhaWtPMFdiclpjOHRVbC9qK3V0dDNT?=
 =?utf-8?B?M29zU0ViQU9MMnFWS3BKb0dhMkMzYkFiT0lBVkZGNU1UQ3RvaDN5a3BXTmlS?=
 =?utf-8?B?Q0VCVTQvNFZoL1psZjEvNzlVbzNFMXZCMGxyUkR2U2RneDNhUFFqc3BhMGFa?=
 =?utf-8?B?TWtBWHovT2hyWHZlOGFjcHo0Z0t2aHpSV1pXclFwcFB3YVNNSElWaGJNWkZn?=
 =?utf-8?B?VlBHa3BXOFlneHZ6cjJkeVV3UmNjbkE5Um9yTmtYMTBLS3FLN3R0dUNZSUdJ?=
 =?utf-8?B?NUVZUGl1ZEo1Z3kvait0b1kxMUhMdVllNitrNnBjeHNFVjRyQ3FycUdWWUNL?=
 =?utf-8?B?d0VLSUNTMDAwWG15czd3UTlFSTdVbVA1dlVwSWl1WHB4K29TZVh4Zk5nSDNF?=
 =?utf-8?B?ZUk0REpWTUZ0R0NvVDE4YUZkSzBGd2tHVGcwaFpqU2EzZXNYNkFob0l0RGxK?=
 =?utf-8?B?L1ZLK1oveUIrRWhCY3JEc3FzRUIySTF1b3dGRW94VWFIaC9wTFdDdzhzMk9M?=
 =?utf-8?B?TWliT3dXOGF0ZkV4Mm1EVzQvN1NQVndpU2dTYzhQMURYRE01V2lLYXJHREVX?=
 =?utf-8?B?L1JEUGJUYmlxMjZnWEtWM0Uvc2pmeThjYlBxUHFSMnQ0SGEyOWQ5cjErcXNy?=
 =?utf-8?B?OFJqNExRaFFWbEJKOTg0c0FaQ3F6YVFvM2FzbTFTbW8zKzk2NUhhSGRyS3ZG?=
 =?utf-8?B?eGUxTlFlKzJFb1RibCswRlhpTWhTUkpxeGJsM2QraGhDOG5QZk9COVRGdkU2?=
 =?utf-8?B?TytZcitHMDUvT21OYWtJVjU3LzZpYjA5dTJBT0NUL29DVHU3aEVoUmI4T1NN?=
 =?utf-8?B?NGxyZ0ZsUURkUWRQY3JLMVRhTXNxN3VPcHNYdFB1U0hWOTZlSFFkUXoyM0RQ?=
 =?utf-8?B?WFpXdHhUakx1bDNGNUV2dnZIWDZzc1F6bk9PMGpyS1dSQmNab1RUNjh2MERO?=
 =?utf-8?B?eFk1Kys2NDJveW5mcHYzYytkdFFRWG91K1h6SFc3ditud0MzdnNpRUlTZ3Mz?=
 =?utf-8?B?cVAxS1NGTWx4bjdqenFJU3M0d1ltYURDT0RFZG5QNFlyZ3BGQ2JGeklxa3lL?=
 =?utf-8?B?WEl6Z2dNaEFabmpkalQrVkV5ZVV4Y3BUNTEyWVlyci8xc2VneW1OVDlLcjRh?=
 =?utf-8?B?UW5kL2c3VHJTMHE4emkwa1E1a3ZMd3pQYml1cXMyTXFQcWRGVm5OdVU4amRL?=
 =?utf-8?B?RjBMeG9UZHNnYk4wbWI4QTNJQk9yaVFIWHBVem5iczJMM2kvc2d6c1M4L1kz?=
 =?utf-8?B?QWZaK2NVSXJVc1VhcWtNNldGUmZlZUFoUnRmOTh2YjdkQUZkWkNHeVJtQ3FE?=
 =?utf-8?B?cXA5SUNNNkhDN05PWW1Gbld4Q0lDa0h2QWluV25HOUN4MkxNSmZTQWhlWlpq?=
 =?utf-8?B?U3ZUNU5VRDJwREZWV05mRTc1aitlUURodExhWUdGRC9sVDRXbDZPZ3pheG9Y?=
 =?utf-8?B?WnJlWit0ZUo5RWRJRFRyTXZqZU1uRERNNjUwZVdSVFhSNG4wMEhmUVNHYVZu?=
 =?utf-8?B?MkoxbEdYR3RSMEwxYjh2ZkhOK2hSRkZva21SMENKRmVYWTR0WWFRVUg0aEhu?=
 =?utf-8?B?UXVTZ3puZXE2U0lHL1RFVVcxd0x2UjBOR0lRQVZoNUpEWXFyeDQ4eXFSOWtr?=
 =?utf-8?B?OElNOTNxOWtZVU9LN244dm50Q001S1JkTTQ1Slcvb05IVFIySkcxU2V2S2ZD?=
 =?utf-8?Q?tA8vYcZ3chKw9RroFTWU9hg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3FtNWRsVE5SUWxhakdSc09SV3NvYlp6UHZWM2s5ektBOW1Udmk5dmV3L2NL?=
 =?utf-8?B?U3U1ZTlFWHRzc2JCUWNRR1JOVURCTXF4Y0ozYU9nRG90RjdSNTRqNFFBZHFa?=
 =?utf-8?B?cHVKRFVGS1hVb0dqbm9LQXdhRGhub3Z5Q2kzalkxOXQ2NG5lSkNaOG5vMFhm?=
 =?utf-8?B?YUtScjdpcVRyNVMvcy9YZHd0ZjBZblI2SzdtUVFmU2IvYWU5Wk1SbkJ2Q1VE?=
 =?utf-8?B?K0dxc29FbVdBcU5PaDJPM1hMNXVybU5CWEpEdFFPVVY0K3BQVUJzZ0pyb3d4?=
 =?utf-8?B?MkhWNG12QStJeFBnVnJDQ29kNFcrUWhBL0FlbkNuUGdReWplNkdwa2poelJx?=
 =?utf-8?B?Smx1K2ExbDdQSm1vT0J5cFBCR3pnTUx3aDlYUnNscmdNME1TNjdsZ3hyVHJX?=
 =?utf-8?B?cUE5WndSQzFOYnpCRFJnczJMd0htMldDeDVSNmNJR0Qza3RCQis2Uk5BcDhF?=
 =?utf-8?B?bkR0Q1ViOWpHYTVxUVZxSGhVYVpocVozMzdaRFgzZ2lYVm9EUkg3R0NZRWs2?=
 =?utf-8?B?blN2eFN5Z0JtVDhzSXByQzJURkl5N3hjS1V4KzlwcVFjT1FIdmNNZTBQTUQv?=
 =?utf-8?B?YzVlSk5QdDBicWtSTm16S3lCMlUyWG5PRkg2TitJMlVTOWVJM0tYTTlaV1B0?=
 =?utf-8?B?SVo5MTJ3QzhjUlBvYlRmcGJaWDl6TStyWG9WckFVNUY3S25vWGhNQWRGOUE2?=
 =?utf-8?B?U3BudjJaMzN5bldQRlNUMGlwaVdhTE10TTAxR2liOGxsUE4xOUordFQwbnN5?=
 =?utf-8?B?dEY5ZDh2TzA4UUxkeXVXYmJJK29mWkZpajBGSGFsUW5ZQUhMYWFkZ0lHVW9D?=
 =?utf-8?B?MVc0QS9lNVZVcHNHeHNiTXVRRkxnT2doZis4aXpmTUU3dXU2YXdzY3cxbDVz?=
 =?utf-8?B?T1paN2JaYjEzSElHM0c4YzlKTWE3YWowRzg0NStDZTJvU1o3bk9KZ3VaSERU?=
 =?utf-8?B?SVNFM1NibElEK3NsN1pWYWFZTHBjZjJUd21CcW5EVTM2TnFWRW5zRXpGcVlx?=
 =?utf-8?B?RHU4SlJvU3VTbDgwNEVpZURVUTFsTEVKQ2VFRms1Q0w0a1VENDMzbkxQbnBw?=
 =?utf-8?B?Q0hIa2NOVXB1V1NTdHgrWGdiTDF6R0U2UERWOWQ2WE9TL3krRVJxZFhhTWJI?=
 =?utf-8?B?bXljS3dycUt2ZHNqNXYvQUljN2ZRRWxDbFUvOFl3M1F6RTY5clFrYlVxbUdJ?=
 =?utf-8?B?NUR3Z21iVE1mc3hCZ29KM0tEWkRrUk5nL2djczRQVzlXTm1LQjh5VDVIcXlN?=
 =?utf-8?B?N2doa0pXY2xFbktweE1pYVVrMlhRZFVFcnNmcnp4K3o5ZjJaZmwxSGM0WTdt?=
 =?utf-8?B?Qmp5VS96Uk1zY1Q3MlA2bGUrRzBXRFpFdDVEVGd6azhMaWQxMDJ6V0svZjNi?=
 =?utf-8?B?bVlpS2JSZmRpMFNTaVhncVQ3OXRaTmFkaWZremZHL3hOWkY2OTlEWTAreTRv?=
 =?utf-8?B?UTFoemQrWVIvTG10OHJLaVNVU0xtTU5rV2V2bkJGeThOcm9rNGpKTnhxNTFJ?=
 =?utf-8?B?Yk5HRTQxeUg2UzZVVXVreWdtYVhKY3doK3RHOXZPWVlMT2RIWDRqbnhhcmlt?=
 =?utf-8?B?WlVVbHQxOXJ6QmhFY2JtV3ozZVZ3cjB2S3lDM056a2R1dlRXYnlwY0hLQzVy?=
 =?utf-8?B?Tmtudmx3NkhXRFE5Q2tFc1ViS2djK1ZHRzFKRDhiUzZxNmRNREZEQkgxdUxn?=
 =?utf-8?B?R3YzM0IvNjF2SUcreThQRVhDS2dpbXkwZ1RYL1ZPSlNnMTJKYnB1N1cxdzZG?=
 =?utf-8?B?S0xLS0NpN01kWlplVndjSWRJZTJ0TGlBUkMyTEtENmdBenhNeHZ4LzJjVkFk?=
 =?utf-8?B?VEFmUERkWFUvQmwrOXlSdVNkYm5RaldyVWN2TFg3MGVMa1BUMExrbWpLNity?=
 =?utf-8?B?UzlBWis4ZVZiV25JL0ZjbVZMejNRcUNYemw0c3k2UWxOZHpRRDRlTTNUTEpC?=
 =?utf-8?B?MVNiQXYyZ3hkVmVRZzh0Umg2VnV1WWJHSGdZdUNTVUZMN2lKRlhJdlFBbFhY?=
 =?utf-8?B?ZThlUDlObVpSbWh6Z1l1MWVuZEwxYUJHRjlPd3VQbjk4WE1NaTdOemRMM21m?=
 =?utf-8?B?ckowa3FGb253YWxCZDBTMFlVZURTVHVqREVUeGFqUzhUZ0V6eTN2Rkw1S2l4?=
 =?utf-8?B?ZlZjZWJoRk1uVGFaM3IyL01jTVpiUVBVWXJLLzVaT3lpV0R3cVpiOVgxTXN5?=
 =?utf-8?B?UXptTU9LT3JxaHBqWHJ5T1hBSnc0SEFXVjY3YmdKM2ZUdU9kTG45cHZWREJS?=
 =?utf-8?B?TWJUZkt3NFRySUoxMHVRWHNnY0o0TzFjQmxkbzRzZytZbWtzWFA5TlhJam50?=
 =?utf-8?B?YTJ1dDVCWC9sYVlERUZzeHk1NXdWM2ljck1MTHR6SmZoWVkvL2Rqek1WeFJK?=
 =?utf-8?Q?+LcNsMwzBGtrYdt4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E24C73B31916624F8580EBD8A2B54A6B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b19c5ee-2872-4ee4-a6a5-08de5ad005a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 22:37:42.6512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 36GfZl5RFuHmEvnHxhLZhes6oLOT+gqXiJ3etEDs6o0fn65lL0IeupmZNLswD3Ol/O5stPmO4LImjB+zl8PK4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6948
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

T24gRnJpLCAyMDI2LTAxLTIzIGF0IDIwOjE2ICswMDAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBGcmksIEphbiAyMywgMjAyNiBhdCAwODoxMzowN1BNICswMDAwLCBWaXZpLCBSb2RyaWdvIHdy
b3RlOg0KPiA+IE9uIEZyaSwgMjAyNi0wMS0yMyBhdCAxNzowMyArMDAwMCwgTWFyayBCcm93biB3
cm90ZToNCj4gPiA+IE9uIEZyaSwgSmFuIDIzLCAyMDI2IGF0IDA1OjAxOjI4UE0gKzAwMDAsIFZp
dmksIFJvZHJpZ28gd3JvdGU6DQo+IA0KPiA+ID4gPiBDb21taXQgYWE4MjI1ZDRlZTg3ICgiTUFJ
TlRBSU5FUlM6IFJlbW92ZSBteXNlbGYgZnJvbSB4ZQ0KPiA+ID4gPiBtYWludGFpbmVycyIpIGFk
ZHJlc3MgdGhhdA0KPiANCj4gPiA+IElmIHRoaXMgaGFwcGVucyBpbiBmdXR1cmUgcGxlYXNlIHJl
bWVtYmVyIHRvIGFsc28gdXBkYXRlIGxpbnV4LQ0KPiA+ID4gbmV4dCwNCj4gPiA+IHdlJ3ZlIGdv
dCBhIHNlcGFyYXRlIGxpc3Qgb2YgY29udGFjdHMgZm9yIHRoZSB2YXJpb3VzIHRyZWVzIHdlDQo+
ID4gPiBtZXJnZS4NCj4gDQo+ID4gSSBjb3VsZCBzd2VhciB0aGF0IGRybS14ZS1uZXh0IHdhcyBm
ZWVkaW5nIGxpbnV4LW5leHQgYWxyZWFkeSwgb3INCj4gPiBwZXJoYXBzIGRybS1uZXh0Pw0KPiAN
Cj4gSXQgaXMsIHRoYXQncyB3aGVyZSB0aGUgcHJvYmxlbSBjb21lcyBmcm9tIC0gdGhlcmUgd2Fz
IGFuIGlzc3VlIHdoaWNoDQo+IEkNCj4gcmVwb3J0ZWQgYW5kIGdvdCBhIGJvdW5jZSBmb3Igc2lu
Y2UgdGhlIGNvbnRhY3RzIHJlcG9ydGVkIGZvciB0aGUNCj4gdHJlZQ0KPiBpbmNsdWRlZCBMdWNh
cy7CoCBJJ20gYXNraW5nIGZvciBhIG5vdGlmaWNhdGlvbiBvZiBhbnkgY2hhbmdlcyBpbiB0aGUN
Cj4gY29udGFjdHMgc2ltaWxhciB0byB3aGF0J3MgZG9uZSB3aXRoIE1BSU5UQUlORVJTLg0KDQph
aCwgZ290IGl0IG5vdy4uLg0KDQpTb3JyeSwgSSB0aG91Z2h0IHlvdXIgc2NyaXB0cyB3ZXJlIGdl
dHRpbmcgdGhpcyBhbHJlYWR5IGZyb20gdGhlDQpNQUlOVEFJTkVSUyBmaWxlLg0KDQpJIHdhcyB3
b25kZXIgaGVyZSBpZiB3ZSBjb3VsZCBtYWtlIHRoZSBpbnRlbC1uZXh0IGZlZWRpbmcgYnJhbmNo
IGFzDQpwYXJ0IG9mIHRoZSBNQUlOVEFJTkVSUyBmaWxlIGluIGEgbW9yZSBicm9hZGVyIGZhc2hp
b24gSSBtZWFuLiBCdXQNCkkgY2FuIGltYWdpbmUgdGhhdCBpdCB3b3VsZCBjYXVzZSBvdGhlciBk
aWZmZXJlbnQga2luZHMgb2YgaXNzdWVzDQpmb3IgeW91Li4uIHNvIGZlZWwgZnJlZSB0byBqdXN0
IGlnbm9yZSBtZS4uLg0KDQpUaGFua3MsDQpSb2RyaWdvLiANCg==
