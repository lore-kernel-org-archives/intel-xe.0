Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0140BC71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 19:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A425D10E168;
	Thu, 12 Jun 2025 19:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZAhI2Ul";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B5B10E166
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 19:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749755725; x=1781291725;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jzXwNcBICbiBGfBWJAHvUI5z13cOM54NfVVmW36sFEo=;
 b=eZAhI2Ul1wEpDikhtg70pYMOtPwbyiFIgELqCJHcFBLt9+Y23P3EGsOW
 7pEgN14n1gJw0KfepnVYVE4nwkv95T853JI4sC1YIRH3U2wQlPqOazDCz
 myhWYSTnv4eLLyTvYEL4hU10Gyr119pmKAwSfybptopj7+7+3PRm9yS0G
 X3pLuAIri48XGe179pAzwHM0jJgRxA5MqRI2hJCNn+VD3CbDWlFZ2pGU7
 d7qE6CE2M9OzF0wJmPvz+SAaq7wuOwNqtESQtj0iM96KlOvVLSsM1SdsG
 Tszi7N9W1yjpdEfUvyvltEP7k8q3TQZT4jYUdVyyggIUzSiw7X7RUoCFl Q==;
X-CSE-ConnectionGUID: z00/w6coSR6sJ9dRJC27/w==
X-CSE-MsgGUID: FTeKnh3YRiGUalVAGzPbBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="55757395"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="55757395"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 12:15:24 -0700
X-CSE-ConnectionGUID: 3EV9CGOfTGqxEAhazDgNDA==
X-CSE-MsgGUID: mH578VXrQECKf9y/Cuizzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="148497989"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 12:15:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 12:15:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 12:15:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.44)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 12:15:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enr+8SaDmaLgOy8jNks+gxT6dtKryLjXFMjsuiByjUGWlHJSpYIHWn7zdvPyjFlZfYEEmL9rCXO3totvCByP2Q8vTKcaIEN0jlcedUC0wLBmLxd7KGeeUniYJ1p7+Q6kwOsdrGXsAdYGRrntZx7O7JHSEGi7XYLCunePher+7whLYtHtuTUpGalFUzotpBMVE7iAUaof2tjkO+uuOre4lwt8LcJPFxFSTjlF6LIn77p8qBp6X2T4HNMFJ/FN3bXWLIjrhRS6FSWhPc2g0fw88jwPT8GtxtoEnK/tqKHlp4hzsLIewRH/aYMV0d17F5mATR+DSxReYkoWcwHFSkWBuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzXwNcBICbiBGfBWJAHvUI5z13cOM54NfVVmW36sFEo=;
 b=AN6OmYEmr3m42Y9Hysg5PtLOqAMUCD2/q6SOVAipuj21s2fzM4bZR/h3YCnkzsKz4DpVdRrJ7fwrG3tCf/NtuC0n709ErO6dYmzn2wdkJQu0aRDIDrj668NZ7trXVb3/PtyZQhWQMa7EsGEiSpcUVjGeWL0BOAdzA4e/+wXjovRfbiUoWLyVIhmvEbgytfFggpZtUgB6Y7VWxBtPlrpUUMhvMMiyzn+RDXmMxa6Uqg+MgIAx6DzIDa9aveWDcA2Z28RbYXi7CwHFWtleRX9dLwqoTM5S4+8//qzZuDoLqFrZhFg1Qjs0pWT0Gfq7dggvjisxg+w1Kxvt99Eiu03NAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MN2PR11MB4725.namprd11.prod.outlook.com (2603:10b6:208:263::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.24; Thu, 12 Jun
 2025 19:15:15 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.8835.023; Thu, 12 Jun 2025
 19:15:14 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v4 3/3] drm/xe/bmg: Update Wa_14022085890
Thread-Topic: [PATCH v4 3/3] drm/xe/bmg: Update Wa_14022085890
Thread-Index: AQHb22jx3OilhmcdxUKYTQ8oA/XCjbP/5dKA
Date: Thu, 12 Jun 2025 19:15:14 +0000
Message-ID: <928717cd75ee2ee36dee435d31bd7bbf7ab60f0d.camel@intel.com>
References: <20250612-wa-14022085890-v4-0-94ba5dcc1e30@intel.com>
 <20250612-wa-14022085890-v4-3-94ba5dcc1e30@intel.com>
In-Reply-To: <20250612-wa-14022085890-v4-3-94ba5dcc1e30@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MN2PR11MB4725:EE_
x-ms-office365-filtering-correlation-id: 882fb286-9b26-46d3-cd3e-08dda9e575fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dzBidDBjT0UxR1JxbmZUKzZIZU5xWXpTM1ZGRTN6RndDVDI5VzZMK2dPcG9l?=
 =?utf-8?B?eU5uVUtzL0xSUXpJYUd4c3N6OXFFYzQ5SDViZS9pY3pOV2NoVnRtU3hzS1Bn?=
 =?utf-8?B?MmVCNEcxeG1wZzNBdmlTRWZ6U2dSczJ2UVIrOVc4dmlMeU5FN2NUc1I1L1Vx?=
 =?utf-8?B?dk5ZZ0NoL08ra3p5anMrblY3YUU0M3BMaEliT2Q0enNxNW81ajBDZzI5Zjl1?=
 =?utf-8?B?bmJsYUtsQmtOYmFGSE00VkJzb3dWN2VBSGcyT0c4Z2d4RnhhencyazJIckNk?=
 =?utf-8?B?M0ltVWMyaWpQd0pBQ1JzOVpORWhNVWY2Zm9yMTNLVzhMeW9qNG1KM1R2QTl3?=
 =?utf-8?B?YTVxOXBhVmZnVkRsV0I5OGRKMG9uTFdVMFpPbHpkYUFlWEdHdDBPbGZRMlB0?=
 =?utf-8?B?SitnYnVyWFFFalVDT1ZtMW5BSUFnM1hjb2lZZDcvR3Z4NVcxUzBlbDVDQ0lk?=
 =?utf-8?B?c2QvdW1wUHFXYm5VeWd6d0ErVTdXeVhlQzNYY3d0STY4VHM5WEc1SnlkanBz?=
 =?utf-8?B?Z2Zwbml0Y3p0MWtlWHhDL3hXTkgzOE4wUTg3VHpYc09qUVU5WE5DTHdFdmV3?=
 =?utf-8?B?aTVZZy8rTEdDclE5cTcrazB6R2NjaTEvc1RjNGV4NlZsR0FOeCtOUjd0dThZ?=
 =?utf-8?B?YUVpM2FENDBLU2p2c2svWnQ4WGJ3UHNLaUxkdlU0R1NqbFhSeU5BYnQ0NWVZ?=
 =?utf-8?B?cm5nek1Jc29SajhlemdZZE1pWmUxTDRkMWxlTHN6dUlxbWNheERzRXRxMlM5?=
 =?utf-8?B?NnhJb25PY2tIYy83bWdMNVBJK1Vwb0RJem42enltWWFQRzBvVlRNM29UaHMx?=
 =?utf-8?B?Rmhnc1g2NHkrdHFNN1JRcENLdGUzMVhKTWs4QkRkdzZPZUdMQWVqUWc2aXpi?=
 =?utf-8?B?UVJRdU1BRkI4ZXVabW5iSjRSUjJQbmRXT1dueWM4czhmUDJWR0RFUXd1a0Vx?=
 =?utf-8?B?RmlnR1ltT2F1bk9rNGlXc0psVm5XOU9haUk4a2pCYnhVYWFMMTBHeHZSaTNG?=
 =?utf-8?B?NW9LV0x0RHBTYVRlL2tGeHBITWp1NHBMclg2MGt5QkF3eGloVXpIWGluaFhF?=
 =?utf-8?B?UklRT1VXdHl5cHcrdFNqR2pFM1l0OUFwV2dSMlhLUnFLL2V0TUxiekdSQ2hl?=
 =?utf-8?B?Q05HVXhpUEdYWGM3cUNCNmNucWl6NjVHcE52L3FzdHVqK3BoNTBwM2pQMmFM?=
 =?utf-8?B?Y2pZM2VKdWxwSHk5Rnk4dlF4SHN4NjlYLzFoSkszcmZZYWN2a1BnamhCbWtx?=
 =?utf-8?B?b21sZkRHc1ZXUEhKV041MGl0R0xGZDRVM3FhZVZuWkVxQjZWV0orMDVxSW02?=
 =?utf-8?B?TWVzNWtYdEZMKzN3OHlVN2J4b2oyY1dycGNtenNmUnBIWTRKbDJ0anMvZVFZ?=
 =?utf-8?B?ejZmTHhOMGNxeCtFNC9hbjcxS01QaVlibjhOOCtUQWljbVYxWmtLck5aemsv?=
 =?utf-8?B?ejZWYmE1RlYvRyt6QUIrQ2cxOFlicm9UTnZrdldWaWJmY0Y4WEZSTmZ4M2Rt?=
 =?utf-8?B?WVVON0U4QXJwUXgxWnR4UlFqcFUyUlVuTVhmbHZSUWJJcXV2aC9NakFTUmJD?=
 =?utf-8?B?UnNGOHBxNzJGbjJ6U01RRVlLVnkxb015S2s5Rk56WlhDRVNicFo1dTJPMnV2?=
 =?utf-8?B?alpnNUJaTDYyNDdPSGJrQ0hJbWVBZWQzUHUyTnBLTXZocnFhREk4SERCbHpQ?=
 =?utf-8?B?M3ZSUG9xUkFCaXpGYk1sTzNISmtycDdYZEFJdTZ5OWU3UWFMZitDSEJpTTlQ?=
 =?utf-8?B?T0hsTG1qUld5ckU2RlUyQklhd1ZUT0FQSlA0bjdiZG1rSnlwQ21HcXRrYVZw?=
 =?utf-8?B?S3I2K1owU3BmRkp0bW40ekw0dVpQT2pETUliTmw1Y1YvbUEwYVJwUTg0aG9T?=
 =?utf-8?B?eXdoUU5XQVZzWWo1V1dnUUhFcXNJK2s4SE4xUCtRWnVCSitKYzRMMGtVQ1B4?=
 =?utf-8?B?QWVBRU5LMHA4dEphK2JFUDlLYXBrSkNIQk8wWUREUklUc3h3ampMbXBtcXNK?=
 =?utf-8?Q?DEutq7TjubgoBZ8BZ7RgKuV2fXh260=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkJmYXUrbHVGSEhGaXczYU1nbjFnVDRKTWJJWVY0S2RQK2phNWRMbHhEMWpj?=
 =?utf-8?B?OFIwdXZudlFZTCtsMlk3S2dJb0JZZXVzcGRiSDFmTkh0ZkNMTGJ4dEdrVWpi?=
 =?utf-8?B?TTlucGxjcDJjTDJVb1IvUFMweXQwMlJ2VkRNeHJ1UnZNZ3lhMGJXekdtK1A5?=
 =?utf-8?B?VFR1RWF1T2Uza3AxZlpHRkxlb3pKQWEvU1NRTG5KTGNZczlZcU9aRVBhWlZi?=
 =?utf-8?B?eVJiMGl1VHR6Q09GWnJXWnNZdW4zTnh4S2xPQWppQUhXTGt6TEw1ZEFMVlh0?=
 =?utf-8?B?eDdDQWZxaWFDNWZqTlprMHpKOU95NVFjVmZCY01Ec1MxWG5URHhyUXJrUXdJ?=
 =?utf-8?B?S0JNNnZzQW12dk9sYnQxKzVELytHZlJVVldZQlIwdGlMZ1VMVlk2ZHNRUUJC?=
 =?utf-8?B?ckFXYzM3RG96enR6T0dmREQ3T3B1YzhsSk1zQ1NadDZzZzM5ZXZ4S2MyOTFY?=
 =?utf-8?B?N2JTZ3dtVElZZDZhODU1ZTcraG4rZytTak1TRTZLMDAvL2Juc2xwR0YwQUtJ?=
 =?utf-8?B?dkpQbVdud29GYUhjZTFSWWdyalRyenRmZ3E0b1R6RlpkbUtHdG9mUXpjMjRm?=
 =?utf-8?B?N3QzcWN5ZUFlLzlDbHJMQWhKMzdZSW1FTXptazVFVnErYThBR0RzYms2M2Ft?=
 =?utf-8?B?U1AycmNJOGlUMDlZME5zQndoTTN6bHlnTlh1RVZLdjQxQTdPZzA0VnVrcm9F?=
 =?utf-8?B?RENGYU9nSEJMZEhoZmk3RU4zU2VnN2UvMUt4eHZyVDhzaVZIa2I2L2JObTVr?=
 =?utf-8?B?YTg3VTd0dlJtN2wzM3FvUzNoeENndlBPRVN2UFl5VnRjZEg4SVVid0ZXNVZZ?=
 =?utf-8?B?MCs2b0ZQQmI4OFJrVE9GUXJKMERqNXRTamYxaU9Ba0Z5U2I0QkgwT0V4QTFE?=
 =?utf-8?B?R0pPSW14WlY5MEt3eDdpd2tZRjRrMmV5QlB1YWRYR0JrbnhUN3RqTzNIQXJG?=
 =?utf-8?B?Z1VyYThLTFNOSllqVm52akh4Wk54b2dHcVNmbTY2Z1FaS2tWM1RzQzBIeVdu?=
 =?utf-8?B?Q2MyWGRJMlk5VSs0dUc4SWowR1krK1ZhTWxXdHRZeUY3R05UUTQxSmw5WXp5?=
 =?utf-8?B?RTdJdzhiZHZyQXpINjUzQSttVy9mQXBheTVwSE83eHJsTDNaYjdZUERGdGxE?=
 =?utf-8?B?ZTNlTm9MakdpVXZZZ2NEYS9vQ1pGZmZXS2t3OTc2WmtpMmxTdWVXUU5KYXFW?=
 =?utf-8?B?NVVXVjFJUE8wOHlyZlBBUjFWTVhVSmRXTVNVQ1JlYmRneVh2QXExc0JybE1q?=
 =?utf-8?B?bkRaa0VlZGNsVUhybHN1b1VwUE9GdG5NZUtjSGdnTjdtWkxxOGRPVkpVTDlw?=
 =?utf-8?B?bERhcmlkNExoUGdrZjlOUVBDQUZaYUpCQUxzYXRZWlQzTGdJV3ZQNVRtUytr?=
 =?utf-8?B?MVJUTm5mSTkxUlBCSm9QM2RoSzA1aDZzNVdWNWE4YTJHa2t2QVBkNXRZUTBS?=
 =?utf-8?B?UkJxc0ttVTFoQnUzamJKN2k3UDhiQVRiTDVkaDBLT2VRYWpWcHN1bG9sNGJw?=
 =?utf-8?B?OG05UkZPT1RFeEF1ZUdZNVQxd09VeVZrVHlLTnBjUW8xd0w0QUVuVEV0T3Zl?=
 =?utf-8?B?VE5WU3F2cUNEQy9TaUp4RmFnM2M5bVdReVk5QkZpOXB5aTcrd3BhQ0psbVMz?=
 =?utf-8?B?MWl1ODdKVXZYaHkxRkhuZ2pTbEkzNU5qT3R0bDluVEpqbUpYZ0ZZeFh5VHZr?=
 =?utf-8?B?S1JDQmttOUZYNjVhNkNYRzJUNGJLNFB2dEg5WW5wZjBHcTNRVnpMNWc5c1FX?=
 =?utf-8?B?ODRDTjQ5WW5ZN2lrait2TllyQ2pudUtKYzVxM2crRHlHVzlFSzE4SFIzTnhj?=
 =?utf-8?B?L0FIYU9acmlQR0lWRmNudzJueC9DdHp1emNjZm5OQndMcXdYbUFXRzA5KzBB?=
 =?utf-8?B?ZjBFajU4am5xRGdzdUFEbURMUThtS3V1MVN3LzkvUXJvR21zUllVQlRybEh1?=
 =?utf-8?B?L3NHc0tzSEduYTQ4OUdwTWk1TzJGcURFOFh2Y29lMHJDRkVVcU9JeTUweWFO?=
 =?utf-8?B?REtyczVDbnRwUEpYU3MybUJNSlpyb0RkUDBvaFJMNXlzL1BIOTgzVUkya0hN?=
 =?utf-8?B?RXVvc0xYWjBtOWxvZ2w3RlNrZHlVN002TlZKZEppUlY1cVZzaWRLeVNGN1lI?=
 =?utf-8?B?MzVqRjExb2pFajZDeW5WR01FL2lGaURTRzRSZEFzRTVuMENGczRoS3RKeVZo?=
 =?utf-8?B?S2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A54A5BD47CFC946A68660EBE51A30B6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 882fb286-9b26-46d3-cd3e-08dda9e575fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 19:15:14.8469 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dj0YmC6F95lv+ZQlrd2k90IocO5FPPAVLEOKiLWT6f3+RMlat7VPwUWTY3k7FTFu38HoSd3Ce+iggljGXA7kbvbhgg505oGp3M6KOlch62A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4725
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

T24gVGh1LCAyMDI1LTA2LTEyIGF0IDAwOjA5IC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IEZyb206IFZpbmF5IEJlbGdhdW1rYXIgPHZpbmF5LmJlbGdhdW1rYXJAaW50ZWwuY29tPg0K
PiANCj4gU2V0IEdUIG1pbiBmcmVxdWVuY3kgdG8gMTIwME1oeiBvbmNlIGRyaXZlciBsb2FkIGlz
IGNvbXBsZXRlLg0KPiANCj4gdjI6IFJldmlldyBjb21tZW50cyAoUm9kcmlnbykNCj4gdjM6IEFw
cGx5IFdhIGVhcmxpZXIgc28gdXNlcl9yZXFfbWluIGlzIG5vdCBjbG9iYmVyZWQuDQo+IHY0OiBB
cHBseSB0byBhbGwgR1RzIChMdWNhcykNCj4gDQo+IENjOiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQu
cm9wZXJAaW50ZWwuY29tPg0KPiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwu
Y29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBWaW5heSBCZWxnYXVta2FyIDx2aW5heS5iZWxnYXVta2Fy
QGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1h
cmNoaUBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMu
Y8KgwqDCoMKgIHwgNSArKysrKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2IucnVs
ZXMgfCA0ICsrKysNCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMuYw0KPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndWNfcGMuYw0KPiBpbmRleCBhZWRmNTkxNjI3MDlhLi4zOWQyYWNiMmYz
MGY2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3BjLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jDQo+IEBAIC01MSw2ICs1MSw3IEBADQo+
IMKgDQo+IMKgI2RlZmluZSBMTkxfTUVSVF9GUkVRX0NBUMKgwqDCoMKgwqDCoDgwMA0KPiDCoCNk
ZWZpbmUgQk1HX01FUlRfRlJFUV9DQVDCoMKgwqDCoMKgwqAyMTMzDQo+ICsjZGVmaW5lIEJNR19N
SU5fRlJFUcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAxMjAwDQo+IMKgDQo+IMKgI2RlZmluZSBTTFBD
X1JFU0VUX1RJTUVPVVRfTVMgNSAvKiByb3VnaGx5IDVtcywgYnV0IG5vIG5lZWQgZm9yDQo+IHBy
ZWNpc2lvbiAqLw0KPiDCoCNkZWZpbmUgU0xQQ19SRVNFVF9FWFRFTkRFRF9USU1FT1VUX01TIDEw
MDAgLyogVG8gYmUgdXNlZCBvbmx5IGF0DQo+IHBjX3N0YXJ0ICovDQo+IEBAIC04MTcsNiArODE4
LDcgQEAgdm9pZCB4ZV9ndWNfcGNfaW5pdF9lYXJseShzdHJ1Y3QgeGVfZ3VjX3BjICpwYykNCj4g
wqANCj4gwqBzdGF0aWMgaW50IHBjX2FkanVzdF9mcmVxX2JvdW5kcyhzdHJ1Y3QgeGVfZ3VjX3Bj
ICpwYykNCj4gwqB7DQo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV90aWxlICp0aWxlID0gZ3Rf
dG9fdGlsZShwY190b19ndChwYykpOw0KPiDCoMKgwqDCoMKgwqDCoMKgaW50IHJldDsNCj4gwqAN
Cj4gwqDCoMKgwqDCoMKgwqDCoGxvY2tkZXBfYXNzZXJ0X2hlbGQoJnBjLT5mcmVxX2xvY2spOw0K
PiBAQCAtODQzLDYgKzg0NSw5IEBAIHN0YXRpYyBpbnQgcGNfYWRqdXN0X2ZyZXFfYm91bmRzKHN0
cnVjdCB4ZV9ndWNfcGMNCj4gKnBjKQ0KPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHBjX2dldF9taW5f
ZnJlcShwYykgPiBwYy0+cnAwX2ZyZXEpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0ID0gcGNfc2V0X21pbl9mcmVxKHBjLCBwYy0+cnAwX2ZyZXEpOw0KPiDCoA0KPiArwqDC
oMKgwqDCoMKgwqBpZiAoWEVfV0EodGlsZS0+cHJpbWFyeV9ndCwgMTQwMjIwODU4OTApKQ0KPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gcGNfc2V0X21pbl9mcmVxKHBjLCBt
YXgoQk1HX01JTl9GUkVRLA0KPiBwY19nZXRfbWluX2ZyZXEocGMpKSk7DQo+ICsNCj4gwqBvdXQ6
DQo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Ow0KPiDCoH0NCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2IucnVsZXMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfd2Ffb29iLnJ1bGVzDQo+IGluZGV4IDQyNWNiNDAxYzI3NjIuLjM4YjU4OWZlOTE5OGQgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2IucnVsZXMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhX29vYi5ydWxlcw0KPiBAQCAtNTksMyArNTksNyBAQCBu
b19tZWRpYV9sM8KgwqDCoE1FRElBX1ZFUlNJT04oMzAwMCkNCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBNRURJQV9WRVJTSU9OX1JBTkdFKDEzMDEsIDMwMDApDQo+IMKgMTYwMjY1
MDg3MDjCoMKgwqDCoEdSQVBISUNTX1ZFUlNJT05fUkFOR0UoMTIwMCwgMzAwMSkNCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBNRURJQV9WRVJTSU9OX1JBTkdFKDEzMDAsIDMwMDAp
DQo+ICsNCj4gKyMgU29DIHdvcmthcm91bmQgLSBzaG91bGQgYXBwbHkgdG8gYWxsIHBsYXRmb3Jt
cyB1c2luZyB0aGlzDQo+ICsjIGdyYXBoaWNzIHZlcnNpb24gaW4gdGlsZS0+cHJpbWFyeV9ndA0K
DQpJZiB0aGlzIGlzIGFuIFNvQyBzcGVjaWZpYyB3b3JrYXJvdW5kIHRoYXQgc3ByZWFkcyBhY3Jv
c3MgR1RzLA0Kc2hvdWxkbid0IHdlIGJlIHVzaW5nIHRoZSBkZXZpY2UgSUQgcmF0aGVyIHRoYW4g
dGhlIEdNRCBJRCB0byBkZXRlcm1pbmUNCnRoZSB3b3JrYXJvdW5kIGFwcGxpY2F0aW9uPw0KDQpU
aGFua3MsDQpTdHVhcnQNCg0KPiArMTQwMjIwODU4OTDCoMKgwqDCoEdSQVBISUNTX1ZFUlNJT04o
MjAwMSkNCj4gDQoNCg==
