Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCAACA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 16:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F5910E7E6;
	Tue,  2 Sep 2025 16:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jAy1LyOA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C48F10E7E6
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 16:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756831072; x=1788367072;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2Po08jPSXwEpWJZ1vuolnexii/wQ4N1TFhYW9LQ1tos=;
 b=jAy1LyOAB00FD+lp+7buw7DrRtCgcExzkYLdWzSN0dQ+rIvBHlY7eMvz
 hI+U4h+lPPb5JdykMqOrbBjQMEsCiDsAB4rAy1Tto3OV+Fo7pH/wJbDN0
 h2mPrNn94sprgCotcmphnETjxKgxRU3ekPbd3uJb8OKRzJQ+gQS55zfYV
 qqtV+bjiNA+EPx5wZgeVixk34AGvpVlkPNVRGdSpqM9oM1lHj0MvmeU70
 /v81ffjUDKVZXshjefuihjPMCb7kguPJTwxZM1pfNZNl18OSyzTaT17aQ
 zHbnxNuMCkFFCSfqc6UOuU6mSazt09zmNK0vhEssaHmjktizgdyUhU1Vs Q==;
X-CSE-ConnectionGUID: /kOQChvRSMWmjXu2taF1cQ==
X-CSE-MsgGUID: emMrevvARaqOZORuXz8GyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58149377"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="58149377"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 09:37:52 -0700
X-CSE-ConnectionGUID: eR2CRNiVRFi5IZuuNKDMxA==
X-CSE-MsgGUID: YA/fIY+IQXaHZC23SqDW1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="202279373"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 09:37:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 09:37:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 09:37:51 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.59)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 09:37:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQwrY+am58DWydUL3Hnrw7Xs1ZalEhMsjq+NJNPnPmYDq8UDtpMBXoLRctV5S/gqqOCvdLKkcpzMIEA6/5rAQGI5Ur02lziGm2+DfVxGT2LNxSBzKBulcJz0woRM3NJJfca1e5HXSAjwnTOha6JYZyPUGJGihnLa0jGl08FxToPEEwbQA7Z5CYH4TZT5MIZTlZ5hTfMsPAXFpR6O6rpEsUnT57qCq9jhBNcCE4Ppd38r8PBFLJU3ywJBfpaCSADdD4VxPw7ksnldwvEzdXtgv2UBLXY174KgFOsU59aheuZXc3rYjVHa4+7g3D/0hEbBsi/HWvIBEPdwGcw7EHPh6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Po08jPSXwEpWJZ1vuolnexii/wQ4N1TFhYW9LQ1tos=;
 b=nAkoMIxKeVoyAFoOBoZJyeJThJGJndKqiD5Ld0Ux/9JGlTIG+mKi+BkfcVUkeLF8E5ZD1zJa7nDxPl8T3HzCviMRs6SUmghGdguNfXRUuAme3mS9BezBN1M4ASqOwBo8Wdah7BEbNvhfAfYz0/nj5QxfLcpuWsOwITifnj3X8Of+aCzJJkwfWDZZqE1XKDVAOYjKmePlFyVLEMB/SUoA0i++3Y23qgRpIvcHMgYNz0OdwobfxQbKzGYB0+vfQU9zEKiTRuDr1O34KDiBAodrtGo7deXlb5FDs6WOgasz8N8rx7hXxGyUtt8ENGdAnIHoP9lBxezd+O3pXZJrF3DRyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CY8PR11MB7924.namprd11.prod.outlook.com (2603:10b6:930:7a::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.27; Tue, 2 Sep 2025 16:37:49 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9094.016; Tue, 2 Sep 2025
 16:37:48 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
CC: "Tauro, Riana" <riana.tauro@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/configfs: Don't touch survivability_mode on
 fini
Thread-Topic: [PATCH 1/3] drm/xe/configfs: Don't touch survivability_mode on
 fini
Thread-Index: AQHcHAwPOM5Xd97qmUiDGSj1Wa9BZLSAF7uA
Date: Tue, 2 Sep 2025 16:37:48 +0000
Message-ID: <5a5bf5041a0ae987b73df34a79bbc64ea11cc7e9.camel@intel.com>
References: <20250902131744.5076-1-michal.wajdeczko@intel.com>
 <20250902131744.5076-2-michal.wajdeczko@intel.com>
In-Reply-To: <20250902131744.5076-2-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CY8PR11MB7924:EE_
x-ms-office365-filtering-correlation-id: dba8cd63-8657-4a0e-5acf-08ddea3f0da4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RzFVWm0wOXpWNUk3YXR6LzJ3M2JMcEV3bGNiVXFlMlZZS1c3OE9mMnYrMW5q?=
 =?utf-8?B?RjVGWGRQVmczTlo4TlY3ZTFMRTFUWDYxRmxHaG54UXIrL1JKekMrQzhPekVW?=
 =?utf-8?B?T283RVVXKzlYWHVFei80dGtOdHc2VElkUjAra0t0cGtYMGlGdTFMMmplT3hp?=
 =?utf-8?B?RlpObk9KMWw0aWxJZDNITmFCYUQ4WlZ4Q0hHZHpkSTVhdzZLcnJ5YVlkTFM3?=
 =?utf-8?B?cC9JQVpkbkpZekxGVDJRT1lRclJMNXpUQUZwblFpc1FvUHRFakliT09zaXJQ?=
 =?utf-8?B?NEFOVWYxbHBEdmdrUkV6Wnc3cFN0S2RaeDBmM0VobFJ3Q3AxU2hmVndDZEVS?=
 =?utf-8?B?akZyTWR1MmxUdnFnNVc1cjBCNjRPQlRzT3hCTTBzenYyQkpxRG02MkFPcXJv?=
 =?utf-8?B?VUREelJMZmtXZHJGem1ZaC8xS1NSSjVSVmd1ZHJ2SnR0akUvb2JydEt3d3lO?=
 =?utf-8?B?NDlodVpqcmZZRURKNEJaOTRnZTI1SFhTdSt3WG9YSzJwZEhMQjlXS3F6RGdJ?=
 =?utf-8?B?M2ppM1FFSWFuOVIxQ0t0d1dYWlhzNFllWk1TZ1BhWGZ1SXRIR2k1TVdJLytv?=
 =?utf-8?B?UFlEQmZLOFFPVk4wMEZRMWI5T3NEY3NoY3MxeEYzUDFyeWhWYzk3cDlublAw?=
 =?utf-8?B?L09LRDZZOGk2VHVYeGtUUWFHdnhCcEE2TCt6YkNBZGw3U2dSQmRaSXVwYjBQ?=
 =?utf-8?B?WTBMbWlqczB6TGdwWDIremdtbURkNFBiQUZ3YldHMXRGVm0xazJHenNsSnJj?=
 =?utf-8?B?T3o2Qm1KN3J6dE1OVm1Qck9TR2RzbXJYb3hJWk8vK1dKSUxNdHcxUVBobkFX?=
 =?utf-8?B?UFpLY2ltd0V5QnQ0Sk1mMFlTNVR2MDBBT0djQXNkam02eHBGM3NtU3diMWRR?=
 =?utf-8?B?VGs1V3VXbXI4OVNxckNnakJiSUNGKzEvMXc4eFFrOS91TGwrVlpCNjRLalNV?=
 =?utf-8?B?RFgyYU9Ycklnd242RVVlb2pPYk5GTGNoLzE5eE1pTlRmYXFSTEV2bVhsMUNB?=
 =?utf-8?B?MDBuRU4xcEt5S2pndm9yMTZWQWFqR1V5U2xrVFN5cGhCMjFuRkg0cVhKZXJ4?=
 =?utf-8?B?WlN0cVRDZFMrcGZGbE5GWktnYjh2dG5CQ0pORC9vWFNnK3ZFWnFWRnZabFhT?=
 =?utf-8?B?aXdTVlFYdC8zTjI4bnFtaTNmS0JBOStuMWQ0K0M2TmxncldmOXpXVk5CbUdD?=
 =?utf-8?B?RXlPTFQxeEJTc2hyRnBiZEhKSzFjUnNPcHZ6UVJZVGhFTUFuTDE2bjR4d0R5?=
 =?utf-8?B?U1ZON2lQeWhEak9JZEtvOXhmbmVuSkwxR3Q2RVQ5OEtrZWhjNVU2UmZVYk12?=
 =?utf-8?B?WStaNlNNeGF4Y05NbVVhL2NwYnl3VWIyQUFNZ05kUVJicDA2a2V0ZHFIZjBB?=
 =?utf-8?B?eDdGUU9SaHJyU3lYQXJmM1hNbm5EUmdQdWUrMGx5MFpvazRxOXhabjFSem5K?=
 =?utf-8?B?UUh3ZVpibUFOZ0lQWURRRGducjExZFowekEzMlorVkkxa29COWxaN0hWdmw5?=
 =?utf-8?B?ZTk1dzZvRUdNbWxySU9yaE5LalRXbHhkTTlOeU9XU2pCY1l5eUVwcEtIdWUr?=
 =?utf-8?B?UHJBUGFOaUxGVUMzSGlHZVlZSitJT1Y1YzNkdERJYmRZelhZaFJTWFh6Rk9R?=
 =?utf-8?B?eWs2TDFtclBQeVhoTTVEWkRpS1lSVkRkNFdqTk40T28yMDBoMjhWK1FCMzFW?=
 =?utf-8?B?R3hCODNyQVZJWGpaVzM5TkdsT2M2VWtsdFJSVHZ3UDdxekJzenRQbFFjTlNG?=
 =?utf-8?B?R0hhak10cmQ3bkttVUU1dVk3MmU1SWJnM09wZ0pLKy9DMWxKN1g5QVNnNVRk?=
 =?utf-8?B?eU8ralRWQUJLNXAzZ0t1YWtUelNWRzZROURxcERjcHdXQTE4NndLOG9jd2I3?=
 =?utf-8?B?dFUzOUtVbEUra3lTOUV0d1U5VWE5TUYxMDFwdnFVN3lidEZLendneXZ6aCtj?=
 =?utf-8?B?U0tFcFlrS1ZlTnhzR01yZDdpcTltd1lkamFDbWE2OGVqU0tEOWN3ZEtxOU81?=
 =?utf-8?Q?yqBfas8TOBf4ReTlr6CO8kHU5GDMGw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHhkb3NDRGRoM3Z5VVplWUhHbTJCT0dYWjNWWFpEMGgvWWZUWExxZUE3VC9K?=
 =?utf-8?B?amlmRDRqNEpwOEhITzNWYkhjdUFlcXJTQlZUZmswMzRVenAzYmtnSlJZdjJq?=
 =?utf-8?B?NUxGWmJiTWVWSVJYSk5xeVhOcUFpZ2Nyd2xZOEtBUllhd2U5emJFekQwajNO?=
 =?utf-8?B?dDdHK3E4K3dlS2VuWTdYaUxlOTJjZEkxRTVqakV5WkxRaFRNcDRKZldGd1g4?=
 =?utf-8?B?RG4zZ0xybk5FTWNOT2lmbTdrbEJQQkJVUDgxbHZZY1NhVzU4dHc5NkNybG9m?=
 =?utf-8?B?TDU3dVlIZkNndG8xcEFiU292ZWZrbFlUZ09wYVdyLzViSisxT2NUOWgycmpC?=
 =?utf-8?B?UlQzbVlUSkxqTWpHdEdCTTJ1Y1ZlT0pSTjZnc0lkdjErY2VRVkxvdlZTdWx3?=
 =?utf-8?B?ZTR5UTBvSGRvYlFYSkNRVmJqZ3NKN3c0VlBjRFExaXl1QVJkYU5SdGM3MlJw?=
 =?utf-8?B?V0REREYzaXhvZXNIYkdmQUQ0TE85anlhaFVwQ1MyMEp1RHBHTWgrdFdPcXQ4?=
 =?utf-8?B?VjRmSEFTMFExcDRWaFZod0RnSkZyS0dEU3ZKdnlEVEIxa3dVbHpzSk9uL0ZP?=
 =?utf-8?B?NStWbE9tVXU2SnhHbjJhMWhMelRoU29RSHQ3dXhzcmRjOXA3N0ZkR3Ryenlw?=
 =?utf-8?B?dkNmYUIrSjFPVmVCMVRrRVJVOXdqTXlrcFFid1hrMFgvaEtJVmVZWHdLNWYv?=
 =?utf-8?B?NDNwNXcyRzd4RFB1b3dpc1k4OUFweVI3ZzNGYWFpd0tPcHgvRDRKb2lieGFE?=
 =?utf-8?B?ZThSaTZnR1NGdVZ1cTNyY2swa0VwTDFUN1VJSm93UE1HbHh1SEFVVHJHN0xU?=
 =?utf-8?B?MTJ5SCszM1lMRXpITDRaNnhWOTBNYVhZY21uSVo0T3k4RFl4M0Z3VHBEUkRW?=
 =?utf-8?B?N0J1SW9zMzAyTUNUT24wZWFtdVFwZWRQcCtobUVadVIxOGYyNEN5b1UvSWN1?=
 =?utf-8?B?N3pzUUpQREpqTXZ4MG5uSHdDbnRGTkEyanpMNWlPOWcwR0VlekZpWkdIYWVa?=
 =?utf-8?B?UVNJd2wzZUp2b3RZNzRIcDRYTXg4RjJYSkQ1dWJRdHJTSWFJZUphNWNmUmdE?=
 =?utf-8?B?cTRkKzIrcU80QS9uaU80RThjV0lpOGFDWXBnbEhSSnBCTWRaRDBDU0dOVWZT?=
 =?utf-8?B?WWl2NWtJcUVjZC9kQTRhaENCeG9xVW9BQWh4VFJlSlBQanFPcGo5L2g4VWJj?=
 =?utf-8?B?ZUI1V1BvTlRHdkVqeXJvTlZyTmVlcU5CcEsyTVEvaXoxTDhUZ3UxcldWZEh4?=
 =?utf-8?B?VFFTaG4yVnE1Q0FzY0FVQ0VucFlnKzlWYVpaTnYvcWFDV3YxNU1uNGlmdzBI?=
 =?utf-8?B?VytKK1RwVWRwSzRXZUgwM3YyRkdJL2RDZzUvRVM5Sml0ZTM1ejF1YlhJKzZV?=
 =?utf-8?B?YU00Q0MvaXJUYUt0SFV1OW11aWphVktVOXNLNVAyNksxTDB0NE1HQ1ZVazI4?=
 =?utf-8?B?UkczNzRQSFFKcWdMNEhpZjEwL3Rwb3RuWk9zSkJDSnMybGlHUmowRFlINnpu?=
 =?utf-8?B?QXJLbE5DbWZZbDZJR2pyTXFQS0Q0VUJJbUVHMjJ0TWZ3U1JmYmxOSGZ0UWtu?=
 =?utf-8?B?SkdlK0I4cEEzUysxdU85RTM4clBQUFZjcDgweGVpL1N3S2FUSlhrNVRrSjlv?=
 =?utf-8?B?MXNXUU93SDFaOGtFSVNhTTFQc1Vad0ZtNllIN050RmZhK2RPWTltTUkrNFJY?=
 =?utf-8?B?V2ZneS93VytvSGltck10V1VTdysyc1dBWUx4QUN0R2VVOE1LZWozRjZxZHl0?=
 =?utf-8?B?S3gxbmVZSW85RTZRSmVraVFITlhrS0lBR3JGTTJpR1c1VzZVcmVha21nZjVK?=
 =?utf-8?B?cjJzR2h5ZDI0KzhZVnVDVEViNVhYcGlnNEl6b25XWTVlUE1JRVRkQ082c2JO?=
 =?utf-8?B?NUZjbWd3U09RdVA3OCtHM2N0biswa01uQ3F3UmFTUmIxWURucys5Ylg3VTNL?=
 =?utf-8?B?dmMvVWNwb3c1V3Izb1QxTWxqd0RmOG91TlpxcTU5cEhXaVE5R2l6Wkp3bUZD?=
 =?utf-8?B?a0d6VmlGS3U0MEZpaEdoR3VrK3hMbHZXR2pzYU9HVm10RC9jVW9NbFRRanFX?=
 =?utf-8?B?RkE0WkhYaytyUTRRNi92OXF2Y3hVdFR3Rm4vQ2VFZlFaYUV4YkZKZThrQS95?=
 =?utf-8?B?L21sWHZob2Yxa2xzYXMzQVhwbG8ySmNrbTV6K0VlMHZUakVodXRIVnoxeTQr?=
 =?utf-8?B?R0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FB82188A6063A468E6476746B56C50D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dba8cd63-8657-4a0e-5acf-08ddea3f0da4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 16:37:48.9046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ClvXvQIwaEvG+yZcgfOGBii6Cd5vR+K6QX4vaMiFISAEKZ+7S+4V+cz9V7H4ryvV/XMjugqftpf6a63t88lEuh2ceNA1UOgU86MBOYAl2dU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7924
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

T24gVHVlLCAyMDI1LTA5LTAyIGF0IDE1OjE3ICswMjAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Og0KPiBUaGlzIGlzIGEgdXNlciBjb250cm9sbGVkIGNvbmZpZ2ZzIGF0dHJpYnV0ZSwgd2Ugc2hv
dWxkIG5vdA0KPiBtb2RpZnkgdGhhdCBvdXRzaWRlIHRoZSBjb25maWdmcyBhdHRyLnN0b3JlKCkg
aW1wbGVtZW50YXRpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgV2FqZGVjemtvIDxt
aWNoYWwud2FqZGVjemtvQGludGVsLmNvbT4NCj4gQ2M6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMu
ZGVtYXJjaGlAaW50ZWwuY29tPg0KPiBDYzogUmlhbmEgVGF1cm8gPHJpYW5hLnRhdXJvQGludGVs
LmNvbT4NCg0KWWVhaCBJIGFncmVlLCBtYWtlcyBzZW5zZS4NCg0KUmV2aWV3ZWQtYnk6IFN0dWFy
dCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQoNCj4gLS0tDQo+IMKgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3N1cnZpdmFiaWxpdHlfbW9kZS5jIHwgMSAtDQo+IMKgMSBmaWxlIGNo
YW5nZWQsIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfc3Vydml2YWJpbGl0eV9tb2RlLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3Vy
dml2YWJpbGl0eV9tb2RlLmMNCj4gaW5kZXggNTNjNWFmNGI4MTBjLi43OTQyNmVhNDY4NjEgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zdXJ2aXZhYmlsaXR5X21vZGUuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3Vydml2YWJpbGl0eV9tb2RlLmMNCj4gQEAg
LTE4MCw3ICsxODAsNiBAQCBzdGF0aWMgdm9pZCB4ZV9zdXJ2aXZhYmlsaXR5X21vZGVfZmluaSh2
b2lkICphcmcpDQo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3Bj
aV9kZXYoeGUtPmRybS5kZXYpOw0KPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGRldmljZSAqZGV2
ID0gJnBkZXYtPmRldjsNCj4gwqANCj4gLcKgwqDCoMKgwqDCoMKgeGVfY29uZmlnZnNfY2xlYXJf
c3Vydml2YWJpbGl0eV9tb2RlKHBkZXYpOw0KPiDCoMKgwqDCoMKgwqDCoMKgc3lzZnNfcmVtb3Zl
X2ZpbGUoJmRldi0+a29iaiwNCj4gJmRldl9hdHRyX3N1cnZpdmFiaWxpdHlfbW9kZS5hdHRyKTsN
Cj4gwqB9DQo+IMKgDQoNCg==
