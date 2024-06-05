Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9828C25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 19:49:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3153710E1AC;
	Wed,  5 Jun 2024 19:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EFbwVCfT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8515E10E804
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 19:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717616941; x=1749152941;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oP7ilKCpC3iPJNwLWe6V9A9NZqf6TVNhW7332gV6PUk=;
 b=EFbwVCfTgzrF8mG4b40oXRYUeHa1wz5HcCVQX//D2cZuYtrYJXf5an/0
 JMiiCmCzE4SRCtSZQCM5r2CSH5wWf5pApE8CKwR7oi5FDeSADlbzRYaWd
 2qDOWnh+VnUjjUnDi9FAazIbKFsDkwpf7xpTxVXgKosIiZO6eNpqQGW26
 6jAtc1AhsGccGSYKQNKM2lV8OksjuK8wOlDQadoa1APNSnVuDW/tb7fvc
 osB6O/gkGNF7brkgczmoCo8Qw5s8zLkyNGNhpDG/jXfoQCqSoVrSXsWAn
 PLt/RJeOSAkrXc25l31bz+4nc3Pc3lPAv1OH5qjLK9DteW3TdQdjbvb24 g==;
X-CSE-ConnectionGUID: Fhp25XluR9eQaw/GjDbHfw==
X-CSE-MsgGUID: O7fGqCxYR5Sjh6v+awVL1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="25655683"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="25655683"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 12:49:01 -0700
X-CSE-ConnectionGUID: pCQdTVfTSqKHDBVxiw1r/w==
X-CSE-MsgGUID: tNbXWJisSZm7kCI6uk4idg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="42155263"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 12:49:00 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 12:49:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 12:49:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 12:49:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRXjyyAkKsku0HWkmPZIo98UDTazxcwWXs7BJiNped8+TvVJGdFdKjrWMW1Fh4JWIQG0Wqxs3GTIETHYqnJ3ZEAzQWEJHIeT1dvbSRC8eol/VTJA32HQoPDjyCayiEkjQiWy9z0YG0fMiE05hDTbTQ6aa77F+t6Z4A4BRgzPAeYCI6kdjfZuI0rq2uh4cGv0U3yaXyHpYW+Iaelvn4wf0A7+tyLr94fs4IyIIVNFcirUxwV0M+lnq1KUhXfFN9JEjD58RQ+YiOXOmxISYYJ+piFP5ip28CWj1eVFep74wEugXFonHtKr1UG6WS83rxnAXA084vBfaMiYyYl5vxXuXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oP7ilKCpC3iPJNwLWe6V9A9NZqf6TVNhW7332gV6PUk=;
 b=ogbh3sC10QI749/5bV73U29bhLQ4FnhRXRIJWzfLpLhFQ3rCSlusi0YIf1zBfmzFfUEXzK98WjEd+0qaj7q36Shtql/8BPj96BqPTpjK3Hq1LjrZJ2H5N6hbJ0RBdKvpGvnWqTeRx7dysLW/1j31GXJ+v1cJFY4OnCnWCeg5RvLwjcm7bs/A5efBhXJLHcZHxGuTTe/1Nsr0xGMMseWAN2GpFcGv2W47HYH6zP2Km8Bx1vNlo9ZHrKjv8VfEdf4wm3baYeyg3ZrwFWhKk0koWHmhOTAH6VeKPTK1+W8Sb5sO8mIIh2N6iglhYuoEYrzoq7hWQnzVRvpHRzjBJVoetA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7265.namprd11.prod.outlook.com (2603:10b6:930:98::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Wed, 5 Jun
 2024 19:48:58 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 19:48:58 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "Hajda, Andrzej" <andrzej.hajda@intel.com>
Subject: RE: [PATCH v3 1/2] Revert "drm/xe: flush gtt before signalling user
 fence on all engines"
Thread-Topic: [PATCH v3 1/2] Revert "drm/xe: flush gtt before signalling user
 fence on all engines"
Thread-Index: AQHatxpTiEWX76nSJUmUY62bxPPEAbG5lHIA
Date: Wed, 5 Jun 2024 19:48:58 +0000
Message-ID: <CH0PR11MB54448B9DC87039F79F5E260AE5F92@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240605-fix_user_fence_posted-v3-0-06e7932f784a@intel.com>
 <20240605-fix_user_fence_posted-v3-1-06e7932f784a@intel.com>
In-Reply-To: <20240605-fix_user_fence_posted-v3-1-06e7932f784a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7265:EE_
x-ms-office365-filtering-correlation-id: f2c3fe90-4672-4d78-8b16-08dc85988a9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?UG1zNFlzREFoVVpXWFNWenpScFAvTHZ2aXNlbE40aWN4bDN0eTFCWEcwR2JM?=
 =?utf-8?B?RWdLdS93dGJZcWZoT2FjWklTZkxGMkJIOVpjVExmK0VjeFRVNlowWWNyaXBt?=
 =?utf-8?B?T25qZWd4NGRVWU1jdHBsMVJFK2hSTTBxOXFKNmp3OEIrUVpuY1EvWHlVVUFw?=
 =?utf-8?B?cFRMMXRzcEZKLzNzN0IwN3JTZ3lVSnBFa0pXQmpvWC9HZmptRkxEc25ZL291?=
 =?utf-8?B?R1BoSXplT1gvemFsdWZBNmpwOUVUbS93K1U3QzhYZ2VNZGRhelpMcHRuWDN5?=
 =?utf-8?B?VzFFQVZSb1p1YnVlSEY1emd4N3FFcVB1TzFPL3dsMmdjWEd0K05EYldwZDhs?=
 =?utf-8?B?S1hmOEJlNjJLb2FqdmxKT2hna2Y2QXpYRWdvazlzMTZGZzZkd2FndE00cjZY?=
 =?utf-8?B?MElyOEZiTVZCaEtqREtSZThqc0FYKzZrRFN3UGJlN0JSeEVJRVBnL2w1cXIy?=
 =?utf-8?B?N09qTVk0Z0RkYndsZjFPWkFOQkdQbHhpWXpJS2dkMmUvVVdDTjdLQkQrLzRh?=
 =?utf-8?B?TktuTzg3VzJkYWhMVng3bFNmakVkbDN3S1ErSUlodXdZb3N6QlVKSENWMTVv?=
 =?utf-8?B?bW90aDd3KzZ5d0ZhT1pJZXdrN21TU0dXbFIrQ044N01reHFzY1VwOWtKT0Ji?=
 =?utf-8?B?TlExYzg1U0dKUVFIQXhCaG1Dei9xd0dRTmkyNjBQZnlET296azY5S3RxMDFB?=
 =?utf-8?B?Q1ZHQ2p3Nll4cmlKYkwyd25tclAwNTVwVm9oZHRNOW0wOXRQcWFvQjgxZ3Vs?=
 =?utf-8?B?a0xiVGdPL0lTQ05iUytmS2xGR3JzNjZCOTY1UUZicC9aNXc0cTFBY3l4Uzgx?=
 =?utf-8?B?LzRWNnBtd0F3RW1pMXRuR1BsYWtJSE1PdFd2czF2SjBwSEYyRDVLVnJrV1Bj?=
 =?utf-8?B?UExOZk95MlM3YkxwczBkK0NwWEVTb2dNZTMyQlBZNU1jZGRjZWhRSFZNRnJP?=
 =?utf-8?B?eE13NEIyQVYzNUlKb2Jucm5pT2xGOUtOUStqeHpoQlRTQlZFNVVIbmtjN0wv?=
 =?utf-8?B?WmhDSlNBL1poZTVWY3JrYUZIZlcxaFJTbWxxSG9iZ3VhcjBqa3BuM3lKeDVL?=
 =?utf-8?B?d0w4V0Y2bGJUVXQ5S0V6SXBkVWhDRlJKWXg3enBpbG16eENodXNxQ3YvWCt3?=
 =?utf-8?B?bzNtcitid3dwTENNMndXQWJaUDhOV1pvUmZKYm5FTUdpclJKTjgxWmEzWEY2?=
 =?utf-8?B?RWZkRnU2U2c1ejZBcnVJakxhT3JtUHQ4cHNjbm1wOUtKUDRGc2dpeG9yRUsw?=
 =?utf-8?B?SzBva1dnT1djNXh1d01WYU55aFdiWEtIOW4vSzI0S1phd2Vub2xnM3p6MDgr?=
 =?utf-8?B?bU5yUmVKSWlGazYyeGs2WTJmd2l6Y0VvOEthdDdJM1h0bVV0elVDR1ZSS21G?=
 =?utf-8?B?OFN4MjF3aHlMdGU2NHlnNUROWk9kUitreU5COFY3VnNrSjF0NVZxNGZQQTVV?=
 =?utf-8?B?U0dCelc5TFk3djNFYWpIOWRMV3Nqc3VMUlMxUjkwWHpGU1p3ZWFRMGlLZ0hR?=
 =?utf-8?B?R0ZLYytoZTVxTjN4Qmlmd0tFMU5aZGJBeGtEYzg5RDdrZ2pFdWFnV05LTWRv?=
 =?utf-8?B?T1kvRFMrbWpHa2cvd2FuWnJHZzM1ZlNzVzhPdFhZWFNsRjFoa0U4ejdkM2U5?=
 =?utf-8?B?Uk1mOHUycUNvSlBjV291eWkwREZiMXM5cEhIb2tENVdMR2w4YTg1L2p0UjNZ?=
 =?utf-8?B?UHJ5VVhhM0VTdWluRkJNVklSL0JLbjhLV20wUVAwdldGVXdXanY2ZWtkNkNN?=
 =?utf-8?B?YWJQaWxid3cxYThVZGJDakpXeVdmcDBRblk2cGxHSkhTMjJ2N05TN2paVi9t?=
 =?utf-8?Q?R7UVwWai/ZfutcaOXULR0vWOeSEDA/rx7ozBQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXJkYXY0NTdUTTZQMVNzZEUzOEVldEQ4b2cxaFlhYVZsZjh0WS9raCtHTzg2?=
 =?utf-8?B?WUJlNWlrSnhsQWNaUkxxcktWdy9RZzBmRUdBRWFEbUtkaHJuWmJGVVJzcUVx?=
 =?utf-8?B?WFBlSERxMnFLNnFIdkxvV3VhWHM3VFRwUHRETGhta1FXKzRkQlVyYUFXa0xB?=
 =?utf-8?B?VjBWYlJOcmN4Q3hNUUYzUUlZazFxRnVzOTdtS0IybWJuUGpyYXdPdHNzYlIv?=
 =?utf-8?B?VEFRSE5vWmhabnAxVmR0dDB0VXFDWXBQbGNOaGZCSGNjYUdOUWdpamVmWUE1?=
 =?utf-8?B?M1diWFB1Wmp1WXRvWEhlRmFpMU1WT1NscFlzTEMrbGFGRFNwK0lwV092amZR?=
 =?utf-8?B?ZWM2bFNhcmMzQlo4RVJSUWJWemxjTEIwZnFPdG84dHFvSzg0YXhZTFJQZE50?=
 =?utf-8?B?YjhiVW42bldmRFRnRGgwRUhyV3phY21DWHIrR3pTSkxwTUJOc1hSTTNoSk5q?=
 =?utf-8?B?OFd1K0o0OVMzOFc0aWxwWmRFN3FYbzVidC9MaDB4WDdvTGhIMzlkdUZ5ZWNB?=
 =?utf-8?B?YkZJYmhwWEZHRUs2ckRBRHNOcXlpVTVqMElEc3lxTHdmM05tYUM0NGtiTm4x?=
 =?utf-8?B?UFUxN1k0VXBHZ1lsZGw1U2FmNnR4MllzQUtmSTNHTDg3Uko2ekl0TUpqSkwv?=
 =?utf-8?B?M1F2Ujh6STM2alVEbStqN1VDckI3RWhRam9RNWxja2h4MDY3M3NGMDFvbXJ2?=
 =?utf-8?B?SkpHNmhuLzFUdVZDOTd2K1VFa3M1dHh1Uk9XUXgrUXU5ejRtcTZlY1RVamtt?=
 =?utf-8?B?dDZ0KzJzcjIvelN0YjVSdk1VTG11Q3RZWXFvYjh0eVJHQnhqbGMxRjErMEhr?=
 =?utf-8?B?VHBWM2hvMkh2RE5XNmYrRmhZMTYwaTZsVlhjZjdJTUdBb1ltS2llcmVUZXB5?=
 =?utf-8?B?eHVyOGhNVHpXZVBEY0tqUGxpMFFzRWJPL0wzS1oyY2x3RHZnV0dpZXZVODl3?=
 =?utf-8?B?eVdHSzd6bTJQQ05UcUFqM201V3ljYVp4TmEvdUFpK2NUam5JNlc2dW9hQml5?=
 =?utf-8?B?K2tHTjNXazRTMzF2ODNHS0tLWGMvSG9od3JseEdXUWh1Y0ZIMUt4Q2szdnhL?=
 =?utf-8?B?MzNNQXgrazYwcGg2UVp3S0t5TlZDdzhMUEVWdFZ4cEtIZVgvN3RhK0ZKQ2VY?=
 =?utf-8?B?bWxNTGN0QUdzYmp4U0dwNk5LbS9sdVlVZTZCZldrbjduZDhJUXBlSDRRSitS?=
 =?utf-8?B?OHZDRzdULzBuUEx5cm9JR29xOENCeHJ0UzM3NXF0V2Vudm9UdlFvaGlQempI?=
 =?utf-8?B?cDVDOXkwYXY4bVVxZFFVb25HU0tiWWZ6UmdqMDVQUnZyUGlWaU5hYm55Sm9k?=
 =?utf-8?B?RHphVHEwSU9xQStyOFdvMmZVOUtuaWlmQjA2UEZuSS9LcmlJTSt6MzB0ZEJZ?=
 =?utf-8?B?eE10dGl1Vm95dWRESFhkQm1ab1VySnlhSlcxRjJlWi9WOG9iQ3hTZTZ0RFhX?=
 =?utf-8?B?ckNmSHNKMEx5N0E4dXdadHJJcjNCeGwzS2NaZ1hra0dwMFFQUzhWTFpRWjBi?=
 =?utf-8?B?eG9OQlBrcStCc2hPWE9XeUw5SkFLb3JRampVaWpza2NDcFdycjgrZkY2UXlx?=
 =?utf-8?B?cjByK3E3bXBCYWNSNWFzK1gzYVNtTW1ETzVxTXU2U2JpOEtzNWRSNGU5bzJ2?=
 =?utf-8?B?ekFYa29YeWNFR041SG9GQWdTYkp5VkNNNTdHMGtKQ1hoKzVVVVo1dzhYZDZW?=
 =?utf-8?B?bkNGYUFkRjk4WDdMa29BYlRPV0dvRUJzeTZYYm5JeTRuODV1L0VSTTlJK1c0?=
 =?utf-8?B?VFNHRGNlek0zWmtpSFZKdktwM2ZaS2NySjMzMVZPNmdUelROczhkcWw3bWNi?=
 =?utf-8?B?NGNERHV3SEFMSHc1ajNlUC9jbjdOdER3Z3BETEplb2IyTnd1YjNiRjJCU0pH?=
 =?utf-8?B?SGtweEN0SzhzdmdpQ3VXeElKUGVuSnlLeFJlalB6eE1xQWhib2daL0h6V2Zo?=
 =?utf-8?B?ZGU3TG8vcWVWdFU1ZzZQZE9HRStnZEZqamkveFpPZ2ZWR0hYUTZ6Q1ZoYlhz?=
 =?utf-8?B?dGdkRVdVN21TWHQrMDUrclN3YkpYcWZOZ0twSGpuOXMxSDgvZk04NUZkVDBT?=
 =?utf-8?B?T2NGYytoaTlPbzdMRlZDUmRKSHF0T3RIcG1nd2QraWNqSVZyQk5IV1pwOWps?=
 =?utf-8?Q?pftjMko7sIBPVq869ETVhW7Oa?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c3fe90-4672-4d78-8b16-08dc85988a9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2024 19:48:58.6753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g7GccrLSJ2ZG2AlJ/cVMDdkZGGmWi9AaHxdpEapuY6pu9WYTeK6QsumGYu5YVkrTS2t9KvqDTG+2DZxFN9aGqQ7THdAQluQM1paWnn4Wl+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7265
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEludGVsLXhlIDxpbnRlbC14ZS1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEFuZHJ6ZWogSGFqZGENClNl
bnQ6IFdlZG5lc2RheSwgSnVuZSA1LCAyMDI0IDEyOjMwIEFNDQpUbzogaW50ZWwteGVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQpDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21A
bGludXguaW50ZWwuY29tPjsgQnJvc3QsIE1hdHRoZXcgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29t
PjsgRGUgTWFyY2hpLCBMdWNhcyA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPjsgTWFhcnRlbiBM
YW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT47IEF1bGQsIE1hdHRo
ZXcgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+OyBIYWpkYSwgQW5kcnplaiA8YW5kcnplai5oYWpk
YUBpbnRlbC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggdjMgMS8yXSBSZXZlcnQgImRybS94ZTogZmx1
c2ggZ3R0IGJlZm9yZSBzaWduYWxsaW5nIHVzZXIgZmVuY2Ugb24gYWxsIGVuZ2luZXMiDQo+IA0K
PiBUaGlzIHJldmVydHMgY29tbWl0IDM4MDA3ZmE5NjQxOWE5ZGI5NzE5ZjE3MGI5ZThhNzg3Nzgy
MWNkZDEuDQo+IA0KPiBTaWduYWxpbmcgdXNlci1mZW5jZSBhZnRlciBzZXFubyB3cml0ZSBkb2Vz
IG5vdCBzZWVtIHRvIGJlIGdvb2Qgc29sdXRpb24uDQo+IEluc3RlYWQgb2YgY2hhbmdpbmcgb3Jk
ZXIgc2VwYXJhdGUgYmFycmllciBzaG91bGQgYmUgcHV0IGJlZm9yZSB1c2VyLWZlbmNlLA0KPiB0
aGlzIHdpbGwgYmUgZG9uZSBpbiBzZXBhcmF0ZSBwYXRjaC4NCj4gDQo+IHYyOiBhZGRlZCBmaXhl
cyB0YWcgaW4gY2FzZSByZXZlcnRlZCBwYXRjaCBnZXRzIGJhY2twb3J0ZWQgdG8gc3RhYmxlDQo+
IA0KPiBGaXhlczogMzgwMDdmYTk2NDE5ICgiZHJtL3hlOiBmbHVzaCBndHQgYmVmb3JlIHNpZ25h
bGxpbmcgdXNlciBmZW5jZSBvbiBhbGwgZW5naW5lcyIpDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJ6
ZWogSGFqZGEgPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPg0KPiBSZXZpZXdlZC1ieTogVGhvbWFz
IEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KDQpSZXZpZXdl
ZC1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KLUpvbmF0
aGFuIENhdml0dA0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMg
fCA4ICsrKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9yaW5nX29w
cy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMNCj4gaW5kZXggMmE2MDdjMTQx
ZDY1Li5iMTFiM2NkMTZiNWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9y
aW5nX29wcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wcy5jDQo+IEBA
IC0yMzQsMTMgKzIzNCwxMyBAQCBzdGF0aWMgdm9pZCBfX2VtaXRfam9iX2dlbjEyX3NpbXBsZShz
dHJ1Y3QgeGVfc2NoZWRfam9iICpqb2IsIHN0cnVjdCB4ZV9scmMgKmxyYw0KPiAgDQo+ICAJaSA9
IGVtaXRfYmJfc3RhcnQoYmF0Y2hfYWRkciwgcHBndHRfZmxhZywgZHcsIGkpOw0KPiAgDQo+IC0J
aSA9IGVtaXRfZmx1c2hfaW1tX2dndHQoeGVfbHJjX3NlcW5vX2dndHRfYWRkcihscmMpLCBzZXFu
bywgZmFsc2UsIGR3LCBpKTsNCj4gLQ0KPiAgCWlmIChqb2ItPnVzZXJfZmVuY2UudXNlZCkNCj4g
IAkJaSA9IGVtaXRfc3RvcmVfaW1tX3BwZ3R0X3Bvc3RlZChqb2ItPnVzZXJfZmVuY2UuYWRkciwN
Cj4gIAkJCQkJCWpvYi0+dXNlcl9mZW5jZS52YWx1ZSwNCj4gIAkJCQkJCWR3LCBpKTsNCj4gIA0K
PiArCWkgPSBlbWl0X2ZsdXNoX2ltbV9nZ3R0KHhlX2xyY19zZXFub19nZ3R0X2FkZHIobHJjKSwg
c2Vxbm8sIGZhbHNlLCBkdywgaSk7DQo+ICsNCj4gIAlpID0gZW1pdF91c2VyX2ludGVycnVwdChk
dywgaSk7DQo+ICANCj4gIAl4ZV9ndF9hc3NlcnQoZ3QsIGkgPD0gTUFYX0pPQl9TSVpFX0RXKTsN
Cj4gQEAgLTI5MywxMyArMjkzLDEzIEBAIHN0YXRpYyB2b2lkIF9fZW1pdF9qb2JfZ2VuMTJfdmlk
ZW8oc3RydWN0IHhlX3NjaGVkX2pvYiAqam9iLCBzdHJ1Y3QgeGVfbHJjICpscmMsDQo+ICANCj4g
IAlpID0gZW1pdF9iYl9zdGFydChiYXRjaF9hZGRyLCBwcGd0dF9mbGFnLCBkdywgaSk7DQo+ICAN
Cj4gLQlpID0gZW1pdF9mbHVzaF9pbW1fZ2d0dCh4ZV9scmNfc2Vxbm9fZ2d0dF9hZGRyKGxyYyks
IHNlcW5vLCBmYWxzZSwgZHcsIGkpOw0KPiAtDQo+ICAJaWYgKGpvYi0+dXNlcl9mZW5jZS51c2Vk
KQ0KPiAgCQlpID0gZW1pdF9zdG9yZV9pbW1fcHBndHRfcG9zdGVkKGpvYi0+dXNlcl9mZW5jZS5h
ZGRyLA0KPiAgCQkJCQkJam9iLT51c2VyX2ZlbmNlLnZhbHVlLA0KPiAgCQkJCQkJZHcsIGkpOw0K
PiAgDQo+ICsJaSA9IGVtaXRfZmx1c2hfaW1tX2dndHQoeGVfbHJjX3NlcW5vX2dndHRfYWRkcihs
cmMpLCBzZXFubywgZmFsc2UsIGR3LCBpKTsNCj4gKw0KPiAgCWkgPSBlbWl0X3VzZXJfaW50ZXJy
dXB0KGR3LCBpKTsNCj4gIA0KPiAgCXhlX2d0X2Fzc2VydChndCwgaSA8PSBNQVhfSk9CX1NJWkVf
RFcpOw0KPiANCj4gLS0gDQo+IDIuMzQuMQ0KPiANCj4gDQo=
