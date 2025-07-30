Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61522C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 18:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238AA10E222;
	Wed, 30 Jul 2025 18:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lVhUEoEs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB1C10E222
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 18:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753899103; x=1785435103;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TCi8vcqNpYFxIz03ElXf8qd69jcJ08hySWxWaIUZMOM=;
 b=lVhUEoEsCLvr7+fx59ugLM4xyxUQzs5yLvfz41TG9QNvj27I4VM9gnkx
 fifiiKzBX87MzTWrDUxUIK+BwZvEkxaq3lLjgBi7aYuH+7uddBgRcNpZ7
 CIlX3EmgonJ6/BMgBXt14Zk+7SgunvesOSK4vEYwaes7lHCOcLarPp3uj
 hc7G0tZFed/2pwBYa+fh/AJZWhXGBuaHZvlNEH/BXHZGrgJGzcQhuh/mQ
 OWKfrcxk9CheNwhyu0OB7g/lPkqycxwaZfEzg/Q94SlcljsAbYqf+nrBB
 99twrs72vD35z+1yatGBvvfWjCrYvEUEPwr2mvUpWlkbJiJjLJ/on0CVx A==;
X-CSE-ConnectionGUID: Olt3yNhrRTOhvu2qwJsVcA==
X-CSE-MsgGUID: 9k70GF7eQK22aftkOZrVPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="73801247"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="73801247"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 11:11:40 -0700
X-CSE-ConnectionGUID: sXLfAFBCQOSDddj73JPx8w==
X-CSE-MsgGUID: LfmdXzFHSxC+RH3HGNh9ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163843524"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 11:11:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 11:11:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 11:11:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.88)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 30 Jul 2025 11:11:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8rixb8zuzlf71r/xk0btW742Vr5CMTbQxH3zIcADnFfnRzSUcmtyYStxdkuLoR8qOZlXtaHB7N61owzzStozDQ6wW6FInMTfi79yYe2OWgKH1yEarYBt12e7Vs3jEsPXXl/x5xodjCAutqIQLgS4oCZo1HzXXADj73fIi2TY4lWsNJJXYQt5aV8b1G6vU91KzhWBN3LTjhDVmMRV7TdMC+y8e2YsoWn5GSiw9m34n8caiKb/fOf+/Lv7IMuuchUsAOwrBzERQtQUkkKzQsqCiiRfgCp18wdysl0jV2MzB+he3tv37InM+5BAZc3zfVmuhnqz6s6VSRtp0ZU3BlzRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCi8vcqNpYFxIz03ElXf8qd69jcJ08hySWxWaIUZMOM=;
 b=kcBT55xXNEtFat5TXVHO5XQDl1P4Vqw3sM1Uh8z24Vtc/YGD8pANhtjZe4QdwgZumqlUcSofuBqA8ZxCxpuqPBlmkUbUNEenft/AvyGTsHH3vxhlb3DClwPKKOFLPrbNuPKeu31IZYOCa/MFvUWlbb82ismudZZBrhCW8aHJHrhZj+a2w/ONv7LkfO+JdkvN5SZpc5dVLZ+jn4ajtCdyKq8Ruw3CAdOxWa9hbK/Ux5jCqA61sauRdUZu3uiGTOmqqOlTBaF9T8QvAP1Crtf9GKtG2rfTi8q2MhOkqrWXhH4qy4DTKGXcYan/UhyH0x5i1sjuQjE9Q/BSueyKsRCyyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CO1PR11MB5059.namprd11.prod.outlook.com (2603:10b6:303:9a::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.27; Wed, 30 Jul 2025 18:11:36 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8964.025; Wed, 30 Jul 2025
 18:11:36 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
CC: "Patelczyk, Maciej" <maciej.patelczyk@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/migrate: prevent infinite recursion
Thread-Topic: [PATCH 1/3] drm/xe/migrate: prevent infinite recursion
Thread-Index: AQHcAV8bP3Z8INyAxUqj3Sje1tq8m7RK+AUA
Date: Wed, 30 Jul 2025 18:11:36 +0000
Message-ID: <8947a74a8e0d73a50e29c20b5d6093d22e93d620.camel@intel.com>
References: <20250730143335.174373-5-matthew.auld@intel.com>
 <20250730143335.174373-6-matthew.auld@intel.com>
In-Reply-To: <20250730143335.174373-6-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CO1PR11MB5059:EE_
x-ms-office365-filtering-correlation-id: 0c8c7df7-74d8-4823-0c8a-08ddcf9485d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NXl1SHY3RU5ONDZKRDlxZHlGMjBJNWV0YVBuS2VibjhJM3BEbDYxUTlsYjFQ?=
 =?utf-8?B?QlJvZS81TkdqL1Q5cjZSY3NOMHh4aTdqN1dvMUUzb1p5dFE4RzJxRkdYK0h1?=
 =?utf-8?B?U0VvTERxUWxMRnlheTgyUXlPVWM4b3ZCZVI1eitGc3dYS3ZhRUREbFlSZ1FH?=
 =?utf-8?B?cTJUV1hFcHJiR2cwTWRDZU85RkRtYkhxUGFsdHpRUWJjeGtNSHk2enpQWVJU?=
 =?utf-8?B?Zm9uNktkV1p1czk2N1laRi9wZDRSWHZZTmpZMEJBcUVzLzdwQnF5aE9FeDh1?=
 =?utf-8?B?aWtUVVUxK0xoUXdyeU1DQUFCWDNwWTd1UHludDVoSFIySTNwdDNxMHI4cGxT?=
 =?utf-8?B?dzFhVzdLWWpxMkVpUHk0K0w3N3FDRkw3RnF2ZUl6MWVTRGYyQWd1cWZCd3dt?=
 =?utf-8?B?LzJFNTQ0dE9nZUZYWldDWi9HbkMvRktHU3dXcGZFZzV1b2RGS2VMZXdtOWNH?=
 =?utf-8?B?V3ViRXdRcEV3OGxmWm9ScUg2OWlvZ2w1NStCWFZVSXVib1Q4M0lDa0tuc0pt?=
 =?utf-8?B?KzJIN050Ui9QYmV4THNrZCtUOWhlZVhWV2JOY2xZL2FGZnc1RWFpcGViOHMx?=
 =?utf-8?B?cmFJaUxndjdVamgyeUk0ZkZ1d2wrUFZPQjJzdFUxTm1GQ1J1VEZLa1BXRllq?=
 =?utf-8?B?RG5DZFRIVU9uaGhVaXR3NEh2cXB3dkc3VDBaOVdDc1orbjF1TUNnVk5EdDgz?=
 =?utf-8?B?QnhqM3RBWVdBNCtYNmx1MGZtblRPYXljVUdXWmNWV3l6NkpJSjYySWFXMlUz?=
 =?utf-8?B?WVpENTc4QnBVUXIxVkQyNVVCQnhSRy8yRGh3RXljeDJIVkt5TmlvU1h0aTFS?=
 =?utf-8?B?MnpLUGpsS2RvZDBVL2dRRS9kNlM3dGdDaFc4WnNqdVZTTXZZdW1hc3UrRWQ1?=
 =?utf-8?B?OG9wMGJyc0U1dzVrN3lRNExFMWZSM1ZHcjZGM3VseklZMzZmRHVJU29sYVpx?=
 =?utf-8?B?cU9aeEpETnB3UFF2Y20yVXRwVElPT2dKaG1lUmh5Q3I4NEg4NS9nbWlNZHZz?=
 =?utf-8?B?NW8rdTg3QW1IY2F3UkIzQnZrdTFnQXQ1M3lKblhTYUp0K3JMMWUwZWRkN0lL?=
 =?utf-8?B?V2Jjc1ZieDRSTDg5UG9leGVncllPdzloa1dQQXcwd0pNaDcvRG1hTGh0ZDE5?=
 =?utf-8?B?SisrVGVTLzA5U2c2dmNlc3J3c1A1YnRUZjhQdUQyVU9FZURPY1cxWHRTbS8y?=
 =?utf-8?B?NHZZQ3o4VWMyd1VYNkZTSUV1azdlUHcrb1gyK25PaUNvOEFjdWs1OGdLeGJu?=
 =?utf-8?B?bk1TMlhSOGpiKzh4YUx2MUV3SWN1aUUwS0p2a0lINDVSMFRhbFJrbXo2Ujhw?=
 =?utf-8?B?SXo1MWhwWkFRM2hnQWZscGl2Rk5OZTd3UXdpVWFpSTJhVThqeEVPbmpPQmFy?=
 =?utf-8?B?TFM3QVpDOWxUbW5KTGZESWRqbCtUSnJOd1VQMVFYY1VEV20zeDU0eHhveUxK?=
 =?utf-8?B?aTdHdk1VaDNyTkIrZHFJK0MzUHhnK2V6RVZqRjFFRXVwU0RrSjVCVHdIRGdY?=
 =?utf-8?B?U1ZBVTZHZTd0NUJGNE9HK0xrVi93NkdhYldSZ1pOT3cxRzN6UDVNOTdhZHZF?=
 =?utf-8?B?TFN3aE93MW9jRDB0Q1BhRzBjM2N6dTdhTzVXMnpSU243TXhuMFVSWWZ4UjJY?=
 =?utf-8?B?UnRTbFhpRHBIVHEvWlBnUmt3M2xaaG05dG52cjNvUnQ3VTVIbDRSMHdVU28y?=
 =?utf-8?B?M0poZWlNd3FZTXhkc2E5ZkRjUytCbTBVbVZud29yZ3FHL0JuZWs1Q2hoVWw0?=
 =?utf-8?B?WW8zUmZCNnc5clpyTGdqM2FsRm9NR0U1OXcwT25FNDNBTmJISndvYllxRXBa?=
 =?utf-8?B?WUFoTXQ3ZktNY1ZBYkJLSisya1BicmNSYnlpV2xTWEZsQjN1Y1FJRjhlek5v?=
 =?utf-8?B?aVhTay9BY0h3N3dVK0NkSVlyNGhSSVVlR3MzMm9FazBRR2VTUnFOZStLMEJt?=
 =?utf-8?B?ZDV2NnVrdjhPR1N5SmxCajNIbnY4KzYyR256M3J6RFEzK0pNem5zRTZGTGdF?=
 =?utf-8?B?TStVSlhETWxRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVY5cFVNQ3d4UVpPZFR1Vk9hVGZTc0FnZkF1aWdEQk5Eb29pb1l5dVpHZDNZ?=
 =?utf-8?B?aTJvbHFEZzlJS01uY1B4Q2hqeFdTbUVtejZrdUswVWJUSDFFQVBsZnROQzR1?=
 =?utf-8?B?cGppNHNKZXc1NkhUbGdEVzJYQldIaVRzazZMb3A5Z3pSTEp5ZEE0TitiSlR0?=
 =?utf-8?B?bm1uS0p0SUtocm5MdlB3d1FoMGZwSHFtNEk4d3lWdlpTdm1sSG5nOXM1SDJ4?=
 =?utf-8?B?U21ta0d2U3lqMmQxaUw1bnJ0TFhWWDE1d2RSS1NnZ0lXR3FIRWI5K05EbWRT?=
 =?utf-8?B?MEN6Mnk4V3BTS0h0Y0FBZ3c4ZjFwd3AwQnpUSVFmT0JhL0w0WTEyclJESDNK?=
 =?utf-8?B?NG1XTjF5UzM0R1FLcUxIUWlxN2xEd1UvS1pzc1lEbFpZeGhOdUg3TXNkWk9n?=
 =?utf-8?B?SSswZDF4MjA1eHlQRVJoUHZMUmJGQ0xvLy96RTRmRy9GNlZXSnp1MjhGN2pi?=
 =?utf-8?B?WVNjSU1CaC9YQkpvTllBZkVyeXM4dUdQZnYzS3pPNi9Hb3lEUjF4WGthRERF?=
 =?utf-8?B?cXJNS3A1NExTSVVOczZvZFNRVVNPT1YvYkNzVk5lQWxkQlg3c3oraW1NdzM3?=
 =?utf-8?B?N0pvcVArNVNWRUJxUk5GOU92MDFSMGRxRzhzUEJxQ09jUWdVcHJ1Q25rV0VY?=
 =?utf-8?B?bThTVDVsYU9lRGJKck9FcSsrYnRaMUY4dFg2WUlQWjFwMEtpakVOU1RyeWtX?=
 =?utf-8?B?SzVQVEVGRkN4ZFVTV204cnc1L1N1OUU0YUdLSjdwWVJBNU9GUzRFdG5HQmFq?=
 =?utf-8?B?MGtLV1lEaGVhOUQ1cXhReHZqVk4xZHJzYW5GSGJzU2xCRnRuL2lNT0RDcVdB?=
 =?utf-8?B?Z3cwR0wvdlFvYVFoa1Fkbk9obmtiSy90d0dYajIzN2YvTzc1OVRFdVQ0aEZP?=
 =?utf-8?B?V1RwZDM3S09HRTBXeWowMy9pYmFIQU5vSFl4V1VoQ2ZwS2xpc2NrVzcrWGln?=
 =?utf-8?B?QitLTVdkRWZTOWMxMHZQR09GU1ZaQ2NEVkJrWEdibTU2UEtKK28rUDZFeW9K?=
 =?utf-8?B?Rm5oL2U3ODRVTVhmdGQ2R2NRYlJodGY3cG9IYmVWS2QyTVdlOVFjZ2pvWTdS?=
 =?utf-8?B?cmRlOGMxVXluQXVGUGJITEQvWjdERk9ycUR6bVpJTEZicythNVI3elE5K25m?=
 =?utf-8?B?UDZiZk5rclNxSi9iZkNRYXptcGoxTmUwby9DSXRSRTFwLzBLeksyVDhmYnVa?=
 =?utf-8?B?ODBjTFFETWhWVUw2QWJNMTNmTVdlSGpNM3lDQTczV0Z5ZFRDYUg5L3QxVWdx?=
 =?utf-8?B?K21qNXdzVysrQVZHbmpsR2k3MG1RUDh1L2lNL2YxTUxWUGJNVTNqVDd6emFO?=
 =?utf-8?B?S0tXYUYwZ3NiYUFtYlNrWDRkQWJsSUpWcXl5NXRWVzdrRGdNbnRhaVFYVTZY?=
 =?utf-8?B?V0dWTFdnaG9rSTIxZmJHK2lSSDhCL1BwV1hCOTVJQlFheVY2c0lkbW1JUkZj?=
 =?utf-8?B?RTJMaTQ4ZnF0QkRMbjNSUEJ6R2dUcmZIYXE0MjQ4b0dnRmJIRnFlcGRSNTcz?=
 =?utf-8?B?MGpYUmlCTldjN3JVV3lnOHZrcStLemhKRXNKaUtacVI2Y2k3YW9QTEFLTGk1?=
 =?utf-8?B?TFp2UmQ0ZEdxU0grTjltOTNJZmtLODFlWHR3dGRTVkRBVTZKUmpWR2NsM1Nw?=
 =?utf-8?B?RCs3dDJaNmh0TS9WVTBSMndPalJqNW1saHVUdXd2UXp1Vm9OTVorWmlpWGRD?=
 =?utf-8?B?R0NaY1pPUStMYnBJYlZEMjI5U1p6T1V3c0hIVk03b3NkdGlMMWtwQmpGaDFF?=
 =?utf-8?B?N3ZhWHFUM3RTeHQrRHRNNGNHci9Bek1PQUNRTzNiTjFJYzJPL3dZTXVEM0Uy?=
 =?utf-8?B?NXZBQ2hwNCtreUNETzdEU0Rzb3d6R2s2Q1VzRGxxcDQ4Rm8rbUQ4bTVuUVRi?=
 =?utf-8?B?T3hVZEtmVktJREF1VGN3RnZoNUZBbmhlWGZmMVRXSmZYS21tZXpVdVkvQTNj?=
 =?utf-8?B?ZzZvNWRVUTZ2anpjUWFMZGQrSkNKaDFNeUt0YjVWSWZkQmdpWWpOcW1CUUg0?=
 =?utf-8?B?NEQwT29rT2dKTWNsa0I5OVdiTGdaWDR3bVhuYzRXalJweFY4OENQUzJqUG56?=
 =?utf-8?B?bElpRDZYVGFUTFAzZ0YrVVlKYlYwSEd5d1RRRkljTW1jNnFrbjBEeFdRbHBl?=
 =?utf-8?B?ejFYdTVaaTRtL2FzWERWT1p1V2V0b25YVjhaN04rYTF3OGdJYWVoVi8ySFI0?=
 =?utf-8?B?ckE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEEEB61B33FEE54BA94254DAAE0653FA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8c7df7-74d8-4823-0c8a-08ddcf9485d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 18:11:36.3388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RuzNGKXUyAly7YxByIxxuOMVPVAXgQGDztN3jfxjXBbJVO/xeE4gK/24kQA9kG8qAoPIpcMfUOkFYx2Qqsm579GcPqlW3B9ADD8uz8GCD2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5059
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

T24gV2VkLCAyMDI1LTA3LTMwIGF0IDE1OjMzICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6Cj4g
SWYgdGhlIGJ1ZiArIG9mZnNldCBpcyBub3QgYWxpZ25lZCB0byBYRV9DQUhFTElORV9CWVRFUyB3
ZSBmYWxsYmFjawo+IHRvCj4gdXNpbmcgYSBib3VuY2UgYnVmZmVyLiBIb3dldmVyIHRoZSBib3Vu
Y2UgYnVmZmVyIGhlcmUgaXMgYWxsb2NhdGVkIG9uCj4gdGhlIHN0YWNrLCBhbmQgdGhlIG9ubHkg
YWxpZ25tZW50IHJlcXVpcmVtZW50IGhlcmUgaXMgdGhhdCBpdCdzCj4gbmF0dXJhbGx5IGFsaWdu
ZWQgdG8gdTgsIGFuZCBub3QgWEVfQ0FDSEVMSU5FX0JZVEVTLiBJZiB0aGUgYm91bmNlCj4gYnVm
ZmVyIGlzIGFsc28gbWlzYWxpZ25lZCB3ZSB0aGVuIHJlY3Vyc2UgYmFjayBpbnRvIHRoZSBmdW5j
dGlvbgo+IGFnYWluLAo+IGhvd2V2ZXIgdGhlIG5ldyBib3VuY2UgYnVmZmVyIG1pZ2h0IGFsc28g
bm90IGJlIGFsaWduZWQsIGFuZCBtaWdodAo+IG5ldmVyCj4gYmUgdW50aWwgd2UgZXZlbnR1YWxs
eSBibG93IHRocm91Z2ggdGhlIHN0YWNrLCBhcyB3ZSBrZWVwIHJlY3Vyc2luZy4KPiAKPiBJbnN0
ZWFkIG9mIHVzaW5nIHRoZSBzdGFjayB1c2Uga21hbGxvYywgd2hpY2ggc2hvdWxkIHJlc3BlY3Qg
dGhlCj4gcG93ZXItb2YtdHdvIGFsaWdubWVudCByZXF1ZXN0IGhlcmUuIEZpeGVzIGEga2VybmVs
IHBhbmljIHdoZW4KClNob3VsZCB3ZSBhZGQgYSBidWlsZCBidWcgb24gKG9yIHNpbWlsYXIpIHRv
IGd1YXJhbnRlZSB0aGF0IHRoZSBwb3dlci0Kb2YtMiBzdGF5cyBoZXJlPyBNeSB1bmRlcnN0YW5k
aW5nIGlzIHRoaXMgYWxpZ25tZW50IGlzbid0IGd1YXJhbnRlZWQKb3RoZXJ3aXNlLiBPZiBjb3Vy
c2UgdGhlIGNoYW5jZSBvZiB0aGUgY2FjaGVsaW5lIGJlaW5nIGEgbm9uLXBvd2VyLW9mLTIKc2Vl
bXMgbG93Li4uCgo+IHRyaWdnZXJpbmcgdGhpcyBwYXRoIHRocm91Z2ggZXVkZWJ1Zy4KPiAKPiBG
aXhlczogMjcwMTcyZjY0YjExICgiZHJtL3hlOiBVcGRhdGUgeGVfdHRtX2FjY2Vzc19tZW1vcnkg
dG8gdXNlIEdQVQo+IGZvciBub24tdmlzaWJsZSBhY2Nlc3MiKQo+IFNpZ25lZC1vZmYtYnk6IE1h
dHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4KPiBDYzogTWFjaWVqIFBhdGVsY3p5
ayA8bWFjaWVqLnBhdGVsY3p5a0BpbnRlbC5jb20+Cj4gQ2M6IE1hdHRoZXcgQnJvc3QgPG1hdHRo
ZXcuYnJvc3RAaW50ZWwuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3Jh
dGUuYyB8IDMxICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KPiDCoDEgZmlsZSBjaGFu
Z2VkLCAxOSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X21pZ3JhdGUuYwo+IGluZGV4IDNhMjc2ZTIzNDhhMi4uYjZiZGM5YmQzMmIwIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfbWlncmF0ZS5jCj4gQEAgLTE5ODcsMTUgKzE5ODcsMjEgQEAgaW50IHhlX21pZ3Jh
dGVfYWNjZXNzX21lbW9yeShzdHJ1Y3QKPiB4ZV9taWdyYXRlICptLCBzdHJ1Y3QgeGVfYm8gKmJv
LAo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoIUlTX0FMSUdORUQobGVuLCBYRV9DQUNIRUxJTkVfQllU
RVMpIHx8Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAhSVNfQUxJR05FRCgodW5zaWduZWQgbG9u
ZylidWYgKyBvZmZzZXQsCj4gWEVfQ0FDSEVMSU5FX0JZVEVTKSkgewo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgaW50IGJ1Zl9vZmZzZXQgPSAwOwo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB2b2lkICpib3VuY2U7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGludCBlcnI7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBib3VuY2Ug
PSBrbWFsbG9jKFhFX0NBQ0hFTElORV9CWVRFUywgR0ZQX0tFUk5FTCk7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGlmICghYm91bmNlKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FSU5WQUw7CgpFTk9NRU0/CgpUaGFua3Ms
ClN0dWFydAoKPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2Fzc2VydCh4
ZSwgSVNfQUxJR05FRCgodW5zaWduZWQgbG9uZylib3VuY2UsCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBYRV9DQUNIRUxJTkVfQllURVMpKTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgLyoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIExlc3MgdGhh
biBpZGVhbCBmb3IgbGFyZ2UgdW5hbGlnbmVkIGFjY2VzcyBidXQKPiB0aGlzIHNob3VsZCBiZQo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogZmFpcmx5IHJhcmUsIGNhbiBmaXh1
cCBpZiB0aGlzIGJlY29tZXMgY29tbW9uLgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICovCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkbyB7Cj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1OCBib3VuY2VbWEVfQ0FDSEVM
SU5FX0JZVEVTXTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHZvaWQgKnB0ciA9ICh2b2lkICopYm91bmNlOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50IGVycjsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnQgY29weV9ieXRlcyA9IG1pbl90KGludCwgYnl0
ZXNfbGVmdCwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBYRV9DQUNIRUxJ
TkVfQllURVMgLQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChvZmZzZXQg
Jgo+IFhFX0NBQ0hFTElORV9NQVNLKSk7Cj4gQEAgLTIwMDQsMjIgKzIwMTAsMjIgQEAgaW50IHhl
X21pZ3JhdGVfYWNjZXNzX21lbW9yeShzdHJ1Y3QKPiB4ZV9taWdyYXRlICptLCBzdHJ1Y3QgeGVf
Ym8gKmJvLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGVyciA9IHhlX21pZ3JhdGVfYWNjZXNzX21lbW9yeShtLCBibywKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb2Zmc2V0ICYKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiB+WEVfQ0FDSEVMSU5F
X01BU0ssCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKHZvaWQgKilwdHIsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAKPiBzaXplb2YoYm91bmNlKSwgMCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm91bmNlLAo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gWEVfQ0FDSEVMSU5FX0JZVEVTLCAw
KTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAo
ZXJyKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybiBlcnI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gwqAKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAod3JpdGUpIHsKPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBtZW1jcHkocHRyICsgcHRyX29mZnNldCwgYnVmICsKPiBidWZfb2Zmc2V0LCBjb3B5X2J5dGVz
KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBtZW1jcHkoYm91bmNlICsgcHRyX29mZnNldCwgYnVmICsKPiBidWZfb2Zmc2V0
LCBjb3B5X2J5dGVzKTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlcnIgPSB4ZV9taWdyYXRlX2FjY2Vzc19tZW1v
cnkobSwgYm8sCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvZmZzZXQKPiAmIH5YRV9DQUNIRUxJTkVfTUFTSywKPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKHZvaWQKPiAqKXB0ciwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiBzaXplb2YoYm91bmNlKSwgd3Jp
dGUpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoAo+IGJvdW5jZSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiBYRV9DQUNIRUxJTkVfQllU
RVMsIHdyaXRlKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGVycikKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0
dXJuIGVycjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfSBlbHNlIHsKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtZW1jcHko
YnVmICsgYnVmX29mZnNldCwgcHRyICsKPiBwdHJfb2Zmc2V0LAo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG1lbWNweShidWYg
KyBidWZfb2Zmc2V0LCBib3VuY2UgKwo+IHB0cl9vZmZzZXQsCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjb3B5X2J5dGVzKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqB9Cj4gwqAKPiBAQCAtMjAyOCw3ICsyMDM0LDggQEAgaW50IHhlX21pZ3JhdGVfYWNj
ZXNzX21lbW9yeShzdHJ1Y3QgeGVfbWlncmF0ZQo+ICptLCBzdHJ1Y3QgeGVfYm8gKmJvLAo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG9mZnNldCArPSBj
b3B5X2J5dGVzOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfSB3aGlsZSAoYnl0
ZXNfbGVmdCk7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGtmcmVlKGJvdW5jZSk7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBlcnI7Cj4gwqDCoMKgwqDCoMKgwqDCoH0K
PiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBkbWFfYWRkciA9IHhlX21pZ3JhdGVfZG1hX21hcCh4ZSwg
YnVmLCBsZW4gKyBwYWdlX29mZnNldCwKPiB3cml0ZSk7Cgo=
