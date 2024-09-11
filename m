Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B974EE0211
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 06:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A90910E9E8;
	Wed, 11 Sep 2024 06:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FjcpJezY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6834C10E9E7
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 06:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726036831; x=1757572831;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KJI4PMR79iX0enZRuQVTFmjMyAjZRrjzS3q2v/Khohs=;
 b=FjcpJezY5hZy8sR2qKVRNc7/1d2YunkSXRT+upNN+Img7/KPUWBPlWDO
 Uus1y2GzVnF2rZkf+4P7LATZwrE/WOQWXhMxUy9iPI7NgF5FzFUDNCi8y
 4FONrd7G+Vlp6PkNi84k9VeJCUbYoR2L/6VAFqhd8gSERLFQoVTVZoqAz
 xyNy8w15VT9wRvN9qI46gm5ZPUijDxZQUJiC6k6EjHlHLQDUWhm07TSw6
 8YVSml0MMYhzOebfMqjxbgF9efMRWkuZmHOmLWwUme6EJoQoqKfaVBJG+
 T8ZiSXwFCr5pV4VGhjnAGHZcDi2LYSkg2ehi5Jy++2eDTEhEO8rUkxPHX g==;
X-CSE-ConnectionGUID: bcq4sE3bTCaCpMdvBNMEnw==
X-CSE-MsgGUID: 5Omk+MiUSbaXTY6cWcI6OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="42296098"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="42296098"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 23:40:31 -0700
X-CSE-ConnectionGUID: afoRCY5ISgmjmDQORzSwiw==
X-CSE-MsgGUID: ZtjiG9/oTEOcD4lre1JbFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="72071423"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 23:40:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 23:40:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 23:40:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 23:40:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 23:40:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffzjQUL6FOgs7utLdtWkHtT2cNANPzdbBQIYxOEkHykzYXgb/MwvM6VDJas6FF54cDmd95EMbFWIrM3PVy6VOTfhqQ+w2Dsr2CGz5EERXkItqlxCcC9ygrICUbSNXEmpcb9GeKRhHhXKT7+PFQSUtwMLsremGcVhuJ/3UWtQtqBuT7rJVqUdBjC2xZ03kgj92TYF5nN88/d4prjs/SsDWVY48G7pmY/Lx2TMpN9wwzC5ywGM72QRuja3/bQp8QbPOkYp1sN7MlXuz4sOxOagDBTcuWbk1JbmQ76T/bys9LmdLHXhdMfOa3AHP1y2nJ9wjV2Rx9jQOD1GamIHayFR6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJI4PMR79iX0enZRuQVTFmjMyAjZRrjzS3q2v/Khohs=;
 b=iSoaOOWGZ2gK/dwltDojkmAmStaS0iZtnZbTNX9LjV8jfvLIBpYA5lUYgP+Sx9IE+Mz00ILC9IK5IEdn/cfn8zy+Q/GA2/WaZuInQtYIoweI8lYHDDt3Kuj/1eNHkZ4Z+hgkBAQSdI6PJu8401tmmomhVKt1fpe6+fEvc/bguUs1KVIjhp2BXyMRTVEUiQrJBuykpZQV+83Thj8xfv9seX6H7+s9fFgOKGcxKNfcaExgIPzqN8Uvhbjpir3moPedJYY/TqpsATAjul9lBai7Oblj9VW8maj8vDKrTlZqF2hBPy540mUclFVmlruUTCwMASKfARgVFYJYb6x9kiz4Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SJ0PR11MB5166.namprd11.prod.outlook.com (2603:10b6:a03:2d8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 06:40:28 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 06:40:27 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>
Subject: RE: [RFC 1/9] drm/xe: Error handling in xe_force_wake_get()
Thread-Topic: [RFC 1/9] drm/xe: Error handling in xe_force_wake_get()
Thread-Index: AQHa+ppT0R2FU4/qGU+R5XbzxJf9frJJnrQAgAAJNACACI1k4A==
Date: Wed, 11 Sep 2024 06:40:27 +0000
Message-ID: <SJ1PR11MB62040604D2F66A093B4C6F69819B2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
 <20240830052326.3707019-2-himal.prasad.ghimiray@intel.com>
 <ZtoGpjVmZbwLsD1s@intel.com> <82a78b3a-14e6-472a-8e45-2cb4af2ff3a2@intel.com>
In-Reply-To: <82a78b3a-14e6-472a-8e45-2cb4af2ff3a2@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SJ0PR11MB5166:EE_
x-ms-office365-filtering-correlation-id: 3974a189-6ce6-46a7-4d53-08dcd22c9fa9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?S2tRd1pNc2dJa2Q3QkxlWGNTQ0pWNFcyTGRVZ3hnd0FPMzJ3Z3dUUnZqaTNG?=
 =?utf-8?B?eVRSemNNemNGWTgwSWNJVks1T3piNEc5NmRMWk1KUllySVFBMVNuKzJHRytS?=
 =?utf-8?B?Q3VhNjRkN00wVGlNQnpIWFdDdCtDMytWVlZNUmt2M252RzlhUkE2MVVpdDZR?=
 =?utf-8?B?bEJVekJDbFViRlNYK1g3NWRmRW1TT2Mzekdxak5DYnpKdm56SEJ2TDJmR1pH?=
 =?utf-8?B?OTIxMnlEa2VPRzdVNk5URFFjUytuZzB5U0xIaWFtb1ByTWtabk9jRUNMQTlo?=
 =?utf-8?B?UUFjUVp2ZFRSTVR0RUR0NDRML3pJR3JJTVdocmZwM3lkekRwSFNSSzFuZnA5?=
 =?utf-8?B?ZFFMSmxyMktnOG1mOEcxc2FMb05hZDZPdE9qenpNU3d0TzZIQVhSb0d1K24z?=
 =?utf-8?B?YjlqcHFtZ2c4Z3dFMWU2Y3psSWxSbEw3MXdjLy9leUNrRkQ2MnJLb3dEa2N6?=
 =?utf-8?B?cXI0ZlpyQ1RGQ2szRy81SW1tOGlYZFVzYmYvOUVkYXV5K0cwUXVsWklWMmx0?=
 =?utf-8?B?NU8vSTR2U3BQVzFMbGpkV0dnbDZmdTQ0d2tHSjhzRHQ2N2p3TlczMVcyNmtH?=
 =?utf-8?B?bS83RDZ2WGZIaElRMEczb09kUExvcnA3Z2pQQkNMRUI0L0JLZTEralBPRitj?=
 =?utf-8?B?SXpwTlV5c2Z1RmRVWEllb01FWlp1OGpxRzVmbTVGNHM1aU13dWNya0VXOGdW?=
 =?utf-8?B?bzk3NWRFYm9YNm9pdmM2a3IvRll0QWRXTlBXNTRRV0ExQm55QkZnY1dtV0p1?=
 =?utf-8?B?Mlg1STNZYUR4dGNuVFpsNXB6bG5MR3JveFlkZFMxWXZONEpwUkZmbXpqZHUx?=
 =?utf-8?B?K1owQmdzS2ZTTkpQcmtQaHJHNDdUcU1TbS8reUo4VitIVHc2YWZQNjRzcm52?=
 =?utf-8?B?TDllVklISEVOQjlHZmRRQlFtbG1vNHV0cm1TMU1ZalBkY09SSHozMWpLcS9W?=
 =?utf-8?B?M1FhbnppSWZsMlVPWFhDM1d0N1Q2c1VBZ3RtbDRLV1JsMzdjL0RXTnFTd0ZL?=
 =?utf-8?B?bytUcVdUb2c1azVCSC9EWXgzMjI4cll4U1ZWeTA1V0g4TkFLV1JpelltNHl6?=
 =?utf-8?B?aWs0YTdkbjFzKzJDT2ttWWlqcFcyZVpIRGxUdkRxMWNUM2FISDdBQkpaVWFW?=
 =?utf-8?B?RC9OcVRNSmdlcTNHUE9yRkhwMTluKzZUaFZxVmlRWHdGMnprTkRjNVZyTDh6?=
 =?utf-8?B?a3p4RktjN25SL0E2NS9MUzBiSWR2SitwZVJIUDlBeEFnTjltQS9EMURMUzFF?=
 =?utf-8?B?bDRIMDVJa25HbzlXMnVrLzdjMDZHb0V3TTV1ZkZDSHpRTWQxQlVUY2UydjhK?=
 =?utf-8?B?TFZ4NGZWR0pTQUEvSWxDTW93UXZpOE5DMUVIV0NUdTR2ZGp0bVR5UkUxUXJ2?=
 =?utf-8?B?Tk8rQXBMMEswdXU5bFIwajFFbXI1dEQvN3FkWE0xb3d3RGM3Q3pNZnQwekp3?=
 =?utf-8?B?SzdTWjRMYXM4ZHlWT3BtSkVoZzBXVHh5Qm5EM21KdXYrNkhwVmZnUXJva0xn?=
 =?utf-8?B?VWVNU0FTYitjN2tuZ25TZjQ2b29MOVVETi9UUTkxMURqTC9lRW9SanRYNmtj?=
 =?utf-8?B?QktZS2QyeS9Gazgva3kyMTgxck1pUFhHV2ZnYTdrM283ZFlVOWxJays2elN1?=
 =?utf-8?B?QTIxcmF0aFFyWGsyVFBNVUhzQ2FuRDRzemtGSXYzLzhwWVdrUlgyV0lEUWQw?=
 =?utf-8?B?aHU0emUyRGFQcExDTGttWUpuc29IT1JySEk0ZnlTa09zZnVKSVBYQjBXUU9F?=
 =?utf-8?B?OVl6eE9heHRSbCt2ekdnWWgyOTFqM0VSbnNuMjI5c2NvL0pZM3dLMTMvR1Ry?=
 =?utf-8?B?T3dyWVdDcm9ESHlGTU5QL0kzMW9pUGVZa1MxNTFkMmsxMlYzcmsyWkp1K3dl?=
 =?utf-8?B?UmVpNjd4dmREOUtVTGhwUHpQOXB2K1lzMFlzYTg3VjVJeWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0Izbzd0clFnazJWazZ2ZXU3M21uT2Z5bXJndlpxek9UeHBQYkgzSmNuZTlj?=
 =?utf-8?B?MFk4Zit5WDlMWG9abGZtQk1EYnNycXBXaXlLaHJlK1N4UWJKZWZKWE1zZ3R0?=
 =?utf-8?B?WkhEN0o0SGN1VFVjNXhsNjVnVE5JYzlhNUdWZ2NHSlM2QVU4cnZYaGpHK211?=
 =?utf-8?B?emJtTWhBL1dGdHJvNGV0OUxtUlhFaTJmWXJpanQ2ZXU4VzI2ajJxUTVTUmE2?=
 =?utf-8?B?YmYvRWl6ZVFiNndFM1hDeHNzV3BsWk5rSFQ4b0dIbFAwY1JTRUF4bWllNk5T?=
 =?utf-8?B?QWZRNVJaSnk5bEhVbVVxOUNad3NZNW95NERlM3dKbW94NjV0ejA4WlNNMGI2?=
 =?utf-8?B?aVlhMGhDZmg5dGcwVXpXeXZlL09PZjVoMlZHanlqVWlVeFhtRWR0RXdWTm80?=
 =?utf-8?B?TEpJaGQ2Y1cxUTFlenlGZnJ5dUt3VHVneFJtQ0JSYk96UzhFa0k4UEFOakY4?=
 =?utf-8?B?dmpCazBFOEdDQVg5SFV3VUoxRUw3M3R1UE5rT0plNVU3bUpIZnN5RHZSQlZP?=
 =?utf-8?B?YzVQM29HbXYyRVhSQXgxdEp5MXhISzNyV0FDQnN2TXNNdm85bVZuM3JWMHVY?=
 =?utf-8?B?VFp3MkQrRlRRQ1JFWnRpbzRBbHdyaC9hejhDYkI0b2hMRXBoWndYaGNqL2hZ?=
 =?utf-8?B?cTJVV0t1aTI5MHZ5NlF0dnpRdnoyZ3ZEalhSTEFGSjU4UjcrTUlNNTNpV1Nl?=
 =?utf-8?B?WEVsVzMzV2w0Ym1QQUQ2RG54NDlFWHB6THdzTXBON2dDQzB0NVdSYnAxRnFP?=
 =?utf-8?B?aWRuYW5qdjdIUzZUTWxqRitUZ3J4dnZPZGtTTDRtWnpGUTc0aUdzUTlRY0V5?=
 =?utf-8?B?ZHFScFhUdFNMR2JSU3hpY1ltMVJPTXdUK2gwNGlBSytWQ3pDeU9KSTdQQjd0?=
 =?utf-8?B?STdsZURpK0JPU3UxT3NweEh1V2I1VkNuZytLYmhBVVhQZG5ET05Denpycjk0?=
 =?utf-8?B?cTVZSytwVTZDaitKQzgzc0k1OEl4VlJCaDY0aEwxVmFzY0cvOU0vbVNKa0Jr?=
 =?utf-8?B?OTRVZmp0R2Q1RjdtOVA4VisybTZ0Y0ZmekE2L2xPSktwQ3NZT0JQdkZRRElv?=
 =?utf-8?B?ek1SMnRneUFneU9uQkNSOWFQeEdkRWg2bk1pcFh1ZFRxcTdrZFhJZjV2VTRv?=
 =?utf-8?B?OXhpYnA1aHNNM095UkJNaUVUS29xTi9iSWJNSHpwS3E5L09EaUpGSmJNWFQ4?=
 =?utf-8?B?ZXZVWGUxcXNlSGRmT2EyRE9LQm9JbXhmQTVDcHVrRVlTZjRDdHgxN2htWDdF?=
 =?utf-8?B?bGdVZGJhQTFPRXVrZ2x4eGhXc2ZnbWdWZ09KWWtsK1NjK3hwK1lQQ2hLamJk?=
 =?utf-8?B?OVJmRTFDaVhXSEhjeWdtaGt4WVUrdjQ2aTlFb3Y5cm9xSENLMWZhdUZzOVlp?=
 =?utf-8?B?d0xrcGcvb1hkQWtnVWVKenUwNGNMWi9VNVprTWZDN0I0SlVoc0E4QjE4Q1Y1?=
 =?utf-8?B?NTZUQlBDWDAySHRMNC9MYUdpUS9hcU9TYmJzalJuSGVvMndOUzFCeE9KU28y?=
 =?utf-8?B?WStQT0hIY3FCOEVEOWlCSW91MG4xY2Ixd0JQZWNPczMwL0RWdHVrZW9mUzVF?=
 =?utf-8?B?OHBSUnp3STlWK1ZLSFJqT3E4TlBTMmdZQTgwZm9rL0U5V0N5NlR5U1ZFeHNn?=
 =?utf-8?B?L21oR1RaMUFUOVVpOTd6b0V5aWJlNERCekcrU0lWK0Jua2VmK1l2bUJHajdB?=
 =?utf-8?B?WHJUYzdzWHVoaFQ3Z1p5WUx2eExPU2QzNjVNQktiTEVhUUpZWHIyTk1IL3lR?=
 =?utf-8?B?NTdiaFFJODM0Ym15TC84NW8xWUwxamgwZDVyQnh5VFZJc1phT3RORkY2WHdO?=
 =?utf-8?B?enY2MW93cDI4M0xCK0R1UmdHdEQyclpSRWNkdVByRHBCbjdSRDI4MGpkOENT?=
 =?utf-8?B?TXE2VmFQMkJZMFJtemZwbXpFNmt3Z1ZXUExNU0s2aTNPWHVzeUhTNU1oRFIz?=
 =?utf-8?B?UmdKZE5OQS9yVXI3NXlGd1N4MWN6TVRYVlUvU3B1NU1HYVN1NFByZVZ1RFlu?=
 =?utf-8?B?ZTBDRDF4N3JJd0FTMXM3eWNsYmIyeDNBcS9vMVQ3Sm5rKzA4QTArb1lMWXo0?=
 =?utf-8?B?NlpXakV1TFg2QVdLQTNVVXVra0tTUFE4MHhXSk9uNVBDMjUxQW1VL2ZWM1VN?=
 =?utf-8?Q?OKlzwu7+a7Sorso1i7APyHUJQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3974a189-6ce6-46a7-4d53-08dcd22c9fa9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 06:40:27.8341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X1esfyBnNMlH71eDkt8Y33eGXAR6gcy4MXROskhA4UYuoIliFNKwhyLbuUqKzOLNjpg8qjZL4uEbtlmSJbESocmdwPLCwSApFh+Q8BSmf3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5166
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gR2hpbWly
YXksIEhpbWFsIFByYXNhZA0KPiBTZW50OiBGcmlkYXksIFNlcHRlbWJlciA2LCAyMDI0IDE6MzMg
QU0NCj4gVG86IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IENjOiBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IE5pbGF3YXIsIEJhZGFsIDxiYWRhbC5uaWxh
d2FyQGludGVsLmNvbT47DQo+IERlIE1hcmNoaSwgTHVjYXMgPGx1Y2FzLmRlbWFyY2hpQGludGVs
LmNvbT47IERhcywgTmlybW95DQo+IDxuaXJtb3kuZGFzQGludGVsLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtSRkMgMS85XSBkcm0veGU6IEVycm9yIGhhbmRsaW5nIGluIHhlX2ZvcmNlX3dha2VfZ2V0
KCkNCj4gDQo+IA0KPiANCj4gT24gMDYtMDktMjAyNCAwMDo1OSwgUm9kcmlnbyBWaXZpIHdyb3Rl
Og0KPiA+IE9uIEZyaSwgQXVnIDMwLCAyMDI0IGF0IDEwOjUzOjE4QU0gKzA1MzAsIEhpbWFsIFBy
YXNhZCBHaGltaXJheSB3cm90ZToNCj4gPj4gSWYgYW4gYWNrbm93bGVkZ21lbnQgdGltZW91dCBv
Y2N1cnMgZm9yIGEgZG9tYWluIGF3YWtlIHJlcXVlc3QsIHB1dA0KPiA+PiB0byBzbGVlcCBhbGwg
ZG9tYWlucyBhd2FrZW5lZCBieSB0aGUgY2FsbGVyIGFuZCBkZWNyZWFzZSB0aGUNCj4gPj4gcmVm
ZXJlbmNlIGNvdW50IGZvciBhbGwgcmVxdWVzdGVkIGRvbWFpbnMuIFRoaXMgcHJldmVudHMNCj4g
Pj4geGVfZm9yY2Vfd2FrZV9nZXQoKSBmcm9tIGxlYXZpbmcgYW4gdW5oYW5kbGVkIHJlZmVyZW5j
ZSBjb3VudCBpbiBjYXNlIG9mDQo+IGZhaWx1cmUuDQo+ID4+IFdoaWxlIGF0IGl0LCBhZGQgc2lt
cGxlIGtlcm5lbC1kb2MgZm9yIHhlX2ZvcmNlX3dha2VfZ2V0KCkgYW5kDQo+ID4+IHhlX2ZvcmNl
X3dha2VfcHV0KCkgZnVuY3Rpb25zLg0KPiA+Pg0KPiA+PiBDYzogQmFkYWwgTmlsYXdhciA8YmFk
YWwubmlsYXdhckBpbnRlbC5jb20+DQo+ID4+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2
aUBpbnRlbC5jb20+DQo+ID4+IENjOiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGlu
dGVsLmNvbT4NCj4gPj4gQ2M6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAaW50ZWwuY29tPg0KPiA+
PiBTaWduZWQtb2ZmLWJ5OiBIaW1hbCBQcmFzYWQgR2hpbWlyYXkNCj4gPj4gPGhpbWFsLnByYXNh
ZC5naGltaXJheUBpbnRlbC5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9mb3JjZV93YWtlLmMgfCA1Mg0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0N
Cj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkN
Cj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9mb3JjZV93YWtl
LmMNCj4gPj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZm9yY2Vfd2FrZS5jDQo+ID4+IGluZGV4
IGIyNjNmZmYxNTI3My4uOGFhOGQ5YjQxMDUyIDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZm9yY2Vfd2FrZS5jDQo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9mb3JjZV93YWtlLmMNCj4gPj4gQEAgLTE1MCwzMSArMTUwLDczIEBAIHN0YXRpYyBpbnQgZG9t
YWluX3NsZWVwX3dhaXQoc3RydWN0IHhlX2d0ICpndCwNCj4gPj4gICAJCQkJCSAoZmZzKHRtcF9f
KSAtIDEpKSkgJiYgXA0KPiA+PiAgIAkJCQkJIGRvbWFpbl9fLT5yZWdfY3RsLmFkZHIpDQo+ID4+
DQo+ID4+ICsvKioNCj4gPj4gKyAqIHhlX2ZvcmNlX3dha2VfZ2V0IDogSW5jcmVhc2UgdGhlIGRv
bWFpbiByZWZjb3VudDsgaWYgaXQgd2FzIDANCj4gPj4gK2luaXRpYWxseSwgd2FrZSB0aGUgZG9t
YWluDQo+ID4+ICsgKiBAZnc6IHN0cnVjdCB4ZV9mb3JjZV93YWtlDQo+ID4+ICsgKiBAZG9tYWlu
czogZm9yY2V3YWtlIGRvbWFpbnMgdG8gZ2V0IHJlZmNvdW50IG9uDQo+ID4+ICsgKg0KPiA+PiAr
ICogSW5jcmVtZW50IHJlZmNvdW50IGZvciB0aGUgZm9yY2Utd2FrZSBkb21haW4uIElmIHRoZSBk
b21haW4gaXMNCj4gPj4gKyAqIGFzbGVlcCwgYXdha2VuIGl0IGFuZCB3YWl0IGZvciBhY2tub3ds
ZWRnbWVudCB3aXRoaW4gdGhlDQo+ID4+ICtzcGVjaWZpZWQNCj4gPj4gKyAqIHRpbWVvdXQuIElm
IGEgdGltZW91dCBvY2N1cnMsIGRlY3JlbWVudCB0aGUgcmVmY291bnQgYW5kIHB1dCB0aGUNCj4g
Pj4gKyAqIGNhbGxlciBhd2FrZW4gZG9tYWlucyB0byBzbGVlcC4NCj4gPj4gKyAqDQo+ID4+ICsg
KiBSZXR1cm46IDAgb24gc3VjY2VzcyBvciAxIG9uIGFjayB0aW1lb3V0IGZyb20gZG9tYWlucy4N
Cj4gPg0KPiA+ICogUmV0dXJucyAwIGZvciBzdWNjZXNzLCBuZWdhdGl2ZSBlcnJvciBjb2RlIG90
aGVyd2lzZS4NCj4gDQo+IEhpIFJvZHJpZ28sDQo+IA0KPiBTdXJlLiBXaWxsIGZpeCBpbiBuZXh0
IHZlcnNpb24uDQo+IA0KPiA+DQo+ID4+ICsgKi8NCj4gPj4gICBpbnQgeGVfZm9yY2Vfd2FrZV9n
ZXQoc3RydWN0IHhlX2ZvcmNlX3dha2UgKmZ3LA0KPiA+PiAgIAkJICAgICAgZW51bSB4ZV9mb3Jj
ZV93YWtlX2RvbWFpbnMgZG9tYWlucykNCj4gPj4gICB7DQo+ID4+ICAgCXN0cnVjdCB4ZV9ndCAq
Z3QgPSBmdy0+Z3Q7DQo+ID4+ICAgCXN0cnVjdCB4ZV9mb3JjZV93YWtlX2RvbWFpbiAqZG9tYWlu
Ow0KPiA+PiAtCWVudW0geGVfZm9yY2Vfd2FrZV9kb21haW5zIHRtcCwgd29rZW4gPSAwOw0KPiA+
PiArCWVudW0geGVfZm9yY2Vfd2FrZV9kb21haW5zIHRtcCwgYXdha2VfcnFzdCA9IDAsIGF3YWtl
X2FjayA9IDA7DQo+ID4+ICAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ID4+ICAgCWludCByZXQg
PSAwOw0KPiA+Pg0KPiA+PiAgIAlzcGluX2xvY2tfaXJxc2F2ZSgmZnctPmxvY2ssIGZsYWdzKTsN
Cj4gPj4gICAJZm9yX2VhY2hfZndfZG9tYWluX21hc2tlZChkb21haW4sIGRvbWFpbnMsIGZ3LCB0
bXApIHsNCj4gPj4gICAJCWlmICghZG9tYWluLT5yZWYrKykgew0KPiA+PiAtCQkJd29rZW4gfD0g
QklUKGRvbWFpbi0+aWQpOw0KPiA+PiArCQkJYXdha2VfcnFzdCB8PSBCSVQoZG9tYWluLT5pZCk7
DQo+ID4+ICAgCQkJZG9tYWluX3dha2UoZ3QsIGRvbWFpbik7DQo+ID4+ICAgCQl9DQo+ID4+ICAg
CX0NCj4gPj4gLQlmb3JfZWFjaF9md19kb21haW5fbWFza2VkKGRvbWFpbiwgd29rZW4sIGZ3LCB0
bXApIHsNCj4gPj4gLQkJcmV0IHw9IGRvbWFpbl93YWtlX3dhaXQoZ3QsIGRvbWFpbik7DQo+ID4N
Cj4gPiBub3cgeW91IHN1cHByZXNzIHRoZSBtbWlvIGVycm9yIGNvZGUuLi4NCj4gPiBzaG91bGQg
YmUgYmV0dGVyIHRvIGZpbmQgYSB3YXkgdG8gcHJvcGFnYXRlIHRoYXQuDQo+IA0KPiANCj4gQUZB
SVUgdGhlIG9ubHkgcG9zc2libGUgZXJyb3IgY29kZSBmcm9tIGRvbWFpbl93YWtlX3dhaXQgaXMg
LUVUSU1FRE9VVCwNCj4gd2FzIHBsYW5uaW5nIHRvIGFzc2lnbiBzYW1lIHRvIHJldCBiZWxvdywg
d2hpY2ggSSBtaXNzZWQgaW4gdGhlIFJGQy4NCj4gDQo+IA0KPiA+DQo+ID4+ICsJZm9yX2VhY2hf
ZndfZG9tYWluX21hc2tlZChkb21haW4sIGF3YWtlX3Jxc3QsIGZ3LCB0bXApIHsNCj4gPj4gKwkJ
aWYgKGRvbWFpbl93YWtlX3dhaXQoZ3QsIGRvbWFpbikgPT0gMCkNCj4gPj4gKwkJCWF3YWtlX2Fj
ayB8PSBCSVQoZG9tYWluLT5pZCk7DQo+ID4+ICsJfQ0KPiA+PiArDQo+ID4+ICsJcmV0ID0gKGF3
YWtlX2FjayA9PSBhd2FrZV9ycXN0KSA/IDAgOiAxOw0KPiA+DQo+ID4gcy8xLy1FSU8vID8NCj4g
DQo+IEhvdyBhYm91dCAtRVRJTUVET1VUID8gU2luY2UgdGhpcyBpcyBzYW1lIGVycm9yIHdoaWNo
IHdpbGwgYmUgcHJvcG9nYXRlZA0KPiBpbiBjYXNlIG9mIGRvbWFpbl93YWtlX3dhaXQgZmFpbHVy
ZSA/DQo+IA0KPiA+DQo+ID4+ICsNCj4gPj4gKwkvKg0KPiA+PiArCSAqIElmIEBkb21haW5zIGlz
IFhFX0ZPUkNFV0FLRV9BTEwgYW5kIGFuIGFja25vd2xlZGdtZW50DQo+IHRpbWVzIG91dA0KPiA+
PiArCSAqIGZvciBhbnkgZG9tYWluLCBkZWNyZWFzZSB0aGUgcmVmZXJlbmNlIGNvdW50IGFuZCBw
dXQgdGhlIGF3YWtlDQo+ID4+ICsJICogZG9tYWlucyB0byBzbGVlcC4gRm9yIGluZGl2aWR1YWwg
ZG9tYWlucywganVzdCBkZWNyZW1lbnQgdGhlDQo+ID4+ICsJICogcmVmZXJlbmNlIGNvdW50Lg0K
PiA+PiArCSAqLw0KPiA+PiArCWlmIChyZXQpIHsNCj4gPj4gKwkJZm9yX2VhY2hfZndfZG9tYWlu
X21hc2tlZChkb21haW4sIGF3YWtlX3Jxc3QsIGZ3LCB0bXApIHsNCj4gPj4gKwkJCWlmICghLS1k
b21haW4tPnJlZiAmJiAoYXdha2VfYWNrICYgQklUKGRvbWFpbi0+aWQpKSkNCj4gPj4gKwkJCQlk
b21haW5fc2xlZXAoZ3QsIGRvbWFpbik7DQo+ID4NCj4gPiB3b25kZXIgaWYgaXQgd291bGQgaGVs
cCB0byBleHRyYWN0IHRoaXMgaW4gYSBzZXBhcmF0ZSBmdW5jdGlvbiB0byBiZQ0KPiA+IHVzZWQg
aGVyZSBhbmQgaW4gdGhlIC1wdXQgZnVuY3Rpb24uDQo+IA0KPiBMZXQgbWUgdGhpbmsgYXJvdW5k
IHRoYXQuDQo+IA0KPiA+DQo+ID4gQnV0IG1vcmUgdGhlbiB0aGF0LCBJIGhhdmUgYSBxdWVzdGlv
biBoZXJlLi4uDQo+ID4gRG8gd2UgcmVhbGx5IG5lZWQgdG8gc2xlZXAgb3RoZXIgZG9tYWlucyBp
ZiB3ZSBhcmUgbm90IGdldHRpbmcgYWNrIGZyb20NCj4gY2VydGFpbiBkb21haW4/DQo+ID4gRG9l
c24ndCBpdCBnZW5lcmFsbHkgbWVhbnMgdGhhdCB3ZSBhcmUgYnVzdGVkIGFueXdheT8NCj4gDQo+
IEkgaGF2ZSBubyBzdHJvbmcgb3BpbmlvbiBvbiB0aGlzLCBtYWluIHRoaW5nIGlzIHJlZmNvdW50
IHNob3VsZG4ndCBiZQ0KPiBpbmNyZW1lbnRlZC4NCj4gDQo+ID4NCj4gPiBCdXQgYWxzbywgaWYg
d2UgcmVhbGx5IG5lZWQgdG8gc2xlZXAsIHRoZW4gcGVyaGFwcyBzaG91bGRuJ3Qgd2UgYWxzbw0K
PiA+IGNhbGwgdGhlIHNsZWVwIGZ1bmN0aW9uIGV2ZW4gZnJvbSB0aGUgZ3V5cyB3aG8gZGlkbid0
IGFjaz8gcGVyaGFwcyB0aGUgYWNrDQo+ID4gdGltZWRvdXQsIGJ1dCBpdCByZWFsbHkgd29rZS11
cD8gaG93IHN1cmUgd2UgYXJlIHRoYXQgdGhpcyBpcyBub3QgcG9zc2libGU/DQo+IA0KPiBJIGRp
ZG4ndCB3YW50IHRvIGNoYW5nZSB0aGUgaHcgc3RhdGUgYnkgY2FsbGluZyBzbGVlcCBmb3IgdGhl
ICJhY2sNCj4gZmFpbGVkIiBkb21haW4sIHNvIGlmIG5lY2Vzc2FyeSwgRGVidWcgdG9vbHMgKFB5
dGhvblNWKSBjYW4gaGVscCB1cw0KPiBwaW5wb2ludCB0aGUgZXhhY3QgZmFpbHVyZSBzdGF0ZSBv
ZiB0aGUgSFcgcmVnaXN0ZXJzLg0KDQpJZiBhdCBhbGwgYWZ0ZXIgdGltZW91dCBkb21haW4gZ290
IGF3YWtlLCB0aGVuIHN3L2h3IG1pc3MgYWxpZ25tZW50IHdpbGwgb2NjdXJlLCBzbyBvbiBubyBh
Y2sgcHV0dGluZyBpdCB0byBzbGVlcCBsb29rcyBvayBoZXJlIHRvIGFsaWduIGh3IHdpdGggc3cu
DQoNClRoYW5rcywNClRlamFzDQo+ICANCj4gDQo+ID4NCj4gPj4gKwkJfQ0KPiA+PiArCQlhd2Fr
ZV9hY2sgPSAwOw0KPiA+PiAgIAl9DQo+ID4+IC0JZnctPmF3YWtlX2RvbWFpbnMgfD0gd29rZW47
DQo+ID4+ICsNCj4gPj4gKwlmdy0+YXdha2VfZG9tYWlucyB8PSBhd2FrZV9hY2s7DQo+ID4+ICAg
CXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmZ3LT5sb2NrLCBmbGFncyk7DQo+ID4+DQo+ID4+ICAg
CXJldHVybiByZXQ7DQo+ID4+ICAgfQ0KPiA+Pg0KPiA+PiArLyoqDQo+ID4+ICsgKiB4ZV9mb3Jj
ZV93YWtlX3B1dCAtIERlY3JlbWVudCB0aGUgcmVmY291bnQgYW5kIHB1dCBkb21haW4gdG8gc2xl
ZXANCj4gaWYgcmVmY291bnQgYmVjb21lcyAwDQo+ID4+ICsgKiBAZnc6IFBvaW50ZXIgdG8gdGhl
IGZvcmNlIHdha2Ugc3RydWN0dXJlDQo+ID4+ICsgKiBAZG9tYWluczogZm9yY2V3YWtlIGRvbWFp
bnMgdG8gcHV0IHJlZmVyZW5jZQ0KPiA+PiArICoNCj4gPj4gKyAqIFRoaXMgZnVuY3Rpb24gcmVk
dWNlcyB0aGUgcmVmZXJlbmNlIGNvdW50cyBmb3Igc3BlY2lmaWVkIGRvbWFpbnMuIElmDQo+ID4+
ICsgKiByZWZjb3VudCBmb3IgYW55IG9mIHRoZSBzcGVjaWZpZWQgZG9tYWluIHJlYWNoZXMgMCwg
aXQgcHV0cyB0aGUgZG9tYWluDQo+IHRvIHNsZWVwDQo+ID4+ICsgKiBhbmQgd2FpdHMgZm9yIGFj
a25vd2xlZGdtZW50IGZvciBkb21haW4gdG8gc2xlZXAgd2l0aGluIHNwZWNpZmllZA0KPiB0aW1l
b3V0Lg0KPiA+PiArICogRW5zdXJlIHRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkIG9ubHkgaW4gY2Fz
ZSBvZiBzdWNjZXNzZnVsDQo+IHhlX2ZvcmNlX3dha2VfZ2V0KCkuDQo+ID4+ICsgKg0KPiA+PiAr
ICogUmV0dXJucyAwIGluIGNhc2Ugb2Ygc3VjY2VzcyBvciBub24temVybyBpbiBjYXNlIG9mIHRp
bWVvdXQgb2YgYWNrDQo+ID4+ICsgKi8NCj4gPj4gICBpbnQgeGVfZm9yY2Vfd2FrZV9wdXQoc3Ry
dWN0IHhlX2ZvcmNlX3dha2UgKmZ3LA0KPiA+PiAgIAkJICAgICAgZW51bSB4ZV9mb3JjZV93YWtl
X2RvbWFpbnMgZG9tYWlucykNCj4gPj4gICB7DQo+ID4+IC0tDQo+ID4+IDIuMzQuMQ0KPiA+Pg0K
