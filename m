Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A268CF9C6F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 16:15:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE3010E279;
	Mon, 23 Sep 2024 16:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FSNdawme";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8F410E279
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 16:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727108152; x=1758644152;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SEZmp4fnRzRWqBq4iYkMjR7msz06NO72hwOxX4/SALM=;
 b=FSNdawmejNYix9UymCwVywVK9fDdaZcYnB+f0Y+G7hLLTxwXqHfRnN8n
 bIb1K8zJlQNC7N2LMKGkggsINhEc6j0tvIC4pE4Y74EGi1FKOsjsi/EYS
 /j8Y7EPci5vA42V2W/nYOF8UqGzbR2JM0wueiXWaZo5IPXkJpliCIisfu
 aAFErYuUXbVGCgVGaImsR4XuAUt0vroHCjf5HwLII35ZWi+6TtWfjB3NN
 UG3fJ1gtBwOlKwQLfnUH31hknQw8hE5hNTUIaM5watj5DMNK/Etjft3zY
 a7ffiBPoXJuOWF/azfRweHJ5q19HfKk+Sk8deabKHYbsRQSebzfnnKqpQ A==;
X-CSE-ConnectionGUID: rIV0RwjaSJGl1yyuMbqE1w==
X-CSE-MsgGUID: mA7H/uP5RDihx7BcqlgEpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="36635962"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="36635962"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 09:15:52 -0700
X-CSE-ConnectionGUID: KJXnPuH8RWGnjMEAVjCQwQ==
X-CSE-MsgGUID: n7jeVnArRyyN8KpHtwFn5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="71156369"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Sep 2024 09:15:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 09:15:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 09:15:47 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 09:15:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrUDoc4Iqc+nro6gECJ0FPnOEifqElKTYkKkWGE6DVGCbbxrxs2ICg3ulhXWI9VHUHjUrYMWM5Pt9n6XTyb0Mo4BLL8N8NwdrJp2E6qVfXqSocElefCCqy67on56f2XoOVFvevAxM9powVWtismAXLrurHY8UUeaVRBf77UnmaHcK65QiHXd7kP0nW01oPhUWsuidzTT7deT1Sil4UdNlviHKgv4gW3Coke5YrBCqdKvoMpWpv3ve1bALFFF+w9i1pH+tQ2YElilKWome/cNJcUJ5stICSXNw2k5qsHV7hzRQGYweZvHHBeq9/+5Q206xGvqbbJ+zRbcZ8aly3WpVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0GUQpK4VrJ2L45cxRNSZoOPCdp1nNY0y5a9/msaIp0=;
 b=yDU90qJpiIUuqDdY3mqPNQ0Z8n9u/EGVx3BJVQ0Llw1X0KkRZu++qbn3fqDFDstp/zjmni++g4rTxHRGEeQ0IFtuMY6nD/iB+8RHQhtqGIf2Mbxyc+vzTzuRcn0m+w+zQspI841JJ/J5balNuuH8aW3beA1uHYInzYnYNGeZTAWo0UrhTXVM7Y9+s3qwhP6y7TXxh0BMHyYmu7OGOjpI4Mk0k/Daxe9QIrpLjMBtLcOw2LbiB/9xHrs/XJe7BmAtmb+vBKgd2LtS+3ppCQD9TEpfODT6TA8U3Cjsh6DpHAxN7Jx1QQHvR8mw+6l4yrQTWiKngEWNc2x0CqkVfplBgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB6445.namprd11.prod.outlook.com (2603:10b6:8:c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 16:15:42 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7962.022; Mon, 23 Sep 2024
 16:15:42 +0000
Date: Mon, 23 Sep 2024 12:15:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v2 01/23] drm/xe: Error handling in xe_force_wake_get()
Message-ID: <ZvGUKdTyK6G5xTg7@intel.com>
References: <6ea536da-fed3-429f-82d4-f118d53309dc@intel.com>
 <4853d43b-0eb2-414c-816b-96e25bc6d604@intel.com>
 <7d1e6ccc-3dc1-4cdc-a30e-f0f1b0f12193@intel.com>
 <ZunPgOAndPtrl74H@DUT025-TGLU.fm.intel.com>
 <271c25c3-401c-43b3-8d9c-dc13027a6ea7@intel.com>
 <87v7ytbf9y.fsf@intel.com>
 <de0252d3-2af4-4abe-b4a6-f188b8062221@intel.com>
 <87a5g3an93.fsf@intel.com>
 <276dee6b-4d2d-4ed2-b141-76b311dd269a@intel.com>
 <b2046f22-5ac3-4ae8-a81b-28bfc733fa1a@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2046f22-5ac3-4ae8-a81b-28bfc733fa1a@intel.com>
X-ClientProxiedBy: MW4PR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:303:b7::11) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: e167298c-d703-4329-a8e9-08dcdbeaf817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXhZM0QwWEZUVlhPc3hMdWhKbmN4WWU1UkNKNElCc28wTzYvVHpMY1lGZnk5?=
 =?utf-8?B?d0JNbkJZZDVBOERjMDVMUEJCOXljbGUxUzN6RVNOK2FPRE9tMHNMaG9qZTdQ?=
 =?utf-8?B?QUtMU1hxcitWTnA0VGVlT1ZJeHNwdnpWcExVbVA0c2lyM1cwK3RjVzkvTzdD?=
 =?utf-8?B?NWFhSWtJVzhvei9Vb0JvVGRGVllMTVVLcmxXZHJBZ0k4L2h2YjVlS1h4emFG?=
 =?utf-8?B?T2xDcUpVSHVQeEFhdWo0clVqMFRqRThHN3dGaE94WWcvdmRaejNpZjNPYU1T?=
 =?utf-8?B?djNidWFjcTFrdE91T2JjZDViSnliTjRLSHZ2SytCY0JHQldzTDhrU1A3dkdt?=
 =?utf-8?B?NDIvbVZ1Wk9EV3V1S0RHa1U4N05RMWdlQVFHeldGcDZUWmYyRWpqazNxQjNs?=
 =?utf-8?B?TWFBVkhoR2Q5eHJJUllQVS83cHg1NGFzZDFUaGk3Uk5OYUlua01ya09udHdk?=
 =?utf-8?B?WFoxcG50dzNIYloxRVlVZmw3R2JLNnFMcmxPUTBab3QyZlJVRXFhcWRIK0Rk?=
 =?utf-8?B?eVNzYWpYQlF1WWdmK1hxZTBFOXRLOVZ1UzBOd2UrSHdlVFZ4NXpyWEZNYVM0?=
 =?utf-8?B?MnVoM1BBc2QxVEdvbngzaGRSQWREY0Q4RG1KalVKbnhZamZMMTFyRnkvMjUr?=
 =?utf-8?B?NUdjRnJ3QWRhVUwwb09TcmwrYWg5ZHNhRkptYjFnenQ2dTRsYi9kT3VMc1VG?=
 =?utf-8?B?cGVoZnlzQ0RlR2RoS2NRTGlHd0xXRTM0VUF6a01xOUp4U1pVWlJnQXkzd3I3?=
 =?utf-8?B?TDE3bkR5aEJZSjFkNnRrdkt0LytsWVEyODVkblR6Nm1Tc1NVZW1wSFFldU5j?=
 =?utf-8?B?blFZOWg0UCtkNHZpd1FzMjVlVC82cFMwNVRkQWpLSVZLa0xSZ2lYNVh6Z2FL?=
 =?utf-8?B?RkxPQjdldzIyd0xWeGVLMEppbVE4ZFdRSStuR2pqY05scm8rZ2RuWkdVOHNJ?=
 =?utf-8?B?TWV2dG1tdkhIY0ZXSmlyY0o5SmRmdVF0dzQyTW5SS25SREd0RjI3emp4NHdJ?=
 =?utf-8?B?RFphSWFkZXQyM0doM2ZtdmFjdmloaVF6S25tb2RPS1o0MmpUdldOd1FHSENr?=
 =?utf-8?B?U2YwYWZYc1NDVUJGYlRqWGlYOEx4V2Q2K0o0MEtEUUlmT3l1cWNVL2J1WC9N?=
 =?utf-8?B?NHo0Qk1ZMVVoT1lwb2oxZ0JaVmVtVGtmRHJraVNxK1lUcVl6bXN5Nk9GUFFX?=
 =?utf-8?B?cG9rVkpDWlp4blMvNFNJeHh5ckE4UzVxUUpGYy9TSkx3aDgwZkdqOC8xb2tz?=
 =?utf-8?B?VFoxcjZlVDBrcUwwRU05THNlZUU0Umh6SEMrWjRIOHgwbEs3bVIwWDFVT0NB?=
 =?utf-8?B?V1ZqRU8zM3dGU0xZNWcvZ0daUlF4bVFuRzZFazRkTVBsL09xS2gwS2FLS3hT?=
 =?utf-8?B?dG1oRlpORXFYWmhyRTZCMWlOMVp6cm5jZ0dKWDNFRUZFV2UyamQweEE3Mkt3?=
 =?utf-8?B?U01WMWt3a1NCYkhrQnB3YzQzLzkrZUJ5UmJkdmZsQ0JRNFpQdE8wNDBEWFpz?=
 =?utf-8?B?Z2lhbW41RGNCQ1JEOUo3c2xTdTVTY2haUjR6NlNXRENMM3pPUE4yRUpqaHUz?=
 =?utf-8?B?WDN0VlBOaGQxVzFleWo1VHorNmhQRU9TUkhvbzVoVlN2SDFiekJjcHM4Nml3?=
 =?utf-8?B?bktiSzh4a0k3TEJ3V1lCU3JUUE0xTVMycWpCS3A4d2VnWDl5QkFwaW5Pdlgx?=
 =?utf-8?B?M1IrNU1XdE5UL2VhTlIycWswcVMzRUJSYlVHcDJsS3ljUmZCdDFyWktnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alZWdDdvMnI2YzBTZkFvVXVnZHgrc3dQNzVCMlRUd0RqSUxyUHFYTEVaRXln?=
 =?utf-8?B?YUlmQTltbmN1UFltcWZ1di9pdlRQcTljYjEzRFJvQ2prcktyVEEyRzhsNk81?=
 =?utf-8?B?a1dxMjlITnNrSzFuMVZzbWlrdUU5eGg1ZStMQ2pxc3RIWU42Tzk1cEN1UGow?=
 =?utf-8?B?NElKMzQ1V2dxeHFFYWtENjFxbGNzeERtV25LU09xUEFsaFdiRmE4RjFpNzFL?=
 =?utf-8?B?enJMMisrQkZzMW9tM2s4UlpyMk54RlNnNEg1TDFRTEhOVXJiU3B2OGJCU1dt?=
 =?utf-8?B?M0VwRnczWU82QVBJalUrbFpJbE0rUUFJQ28zTjhXYWp2bDdHWG5DRVo2T2Y3?=
 =?utf-8?B?KzE1cVdiWUp5RGFOUHNQTnl2T25heTgwejVNbFFXYkJaZVZEbHdYc01yMUpF?=
 =?utf-8?B?UlUzcStkQ2NIUkN1S3U3cmVkNHVmYm5vd0hRSElIVmdaRDhhT3d4ZVNTbStV?=
 =?utf-8?B?NjdocjMvN094QjZ3U0t5SGJwUWpkWjdDRGFTTmpMbWtaUkxreUxxaEduU25K?=
 =?utf-8?B?ZmVNWlRGcjhua3A0K1ZBb2NuY3JaVmJsY3FuSVdDSEZlNkNSVnd1cG5KSk03?=
 =?utf-8?B?Y1dpbHBhM084dkNOWDBvZUZ6bTc1bnUwNHUzVkU5UGFWMTZMZkkycW5FRzNR?=
 =?utf-8?B?Z1BIb0hQajdSb3F5a1BiaGo1OGUxTi9sVFlyL0ZWSklQMHJXc1BjRDM2dHNw?=
 =?utf-8?B?MzNjQk9EbHEyT3dkK0xIQ3FiYXVwamJhc3o2dE1OMTlsODNYd2c5eC8wM0Fk?=
 =?utf-8?B?czFYZkZQWXQrR3J4WFA2TVpsSi9MaFNDZzF1UWJNSE5PK0JZT2tGbDlyVWU5?=
 =?utf-8?B?WTFRVzZtS2txbGFCd1dmQVc1WG43NnlNdE1rNWxRWU82MzV6Zmx1ZTJ5OTAz?=
 =?utf-8?B?QlJoOHN2NFhlK0FMb09seEFmL21rRm9wRzA0eUFDNHlhOWZhS3N2cVppTjFt?=
 =?utf-8?B?Qk5ybTFnTE9uN2dEMklRT3JSMTdiZlo0M3ZKYURmUXp0a2JzNjVQTTFZNy81?=
 =?utf-8?B?MFNQSEdpWHVVOTQ1OU9FM3AzTEJYR1ZwU3hNRnREeDNGOWJtSjcrVEwwZkpx?=
 =?utf-8?B?UURRTmJlSFd0SkRkMGRWMlhESTZFa25NTWtrOThuVUUrbk5lQlZidFhHbmlU?=
 =?utf-8?B?V3hTL2UrZW5nTnQ3ZGMxZmZ0MUVSN1pUNDV2M2RHc0t1dXR1QjhmZnl4bVc0?=
 =?utf-8?B?UDZEekRpOVVReWJNSTBLWmxmMkJiK1pXeGZFOUx5cXlGTEF1aEhjWjlFSE1w?=
 =?utf-8?B?dGRIZmFzMG0vb2FzKzhkMCtWQWQ1OVcxOUl3aXNJeWdTSnFBV3hHWnZISnlx?=
 =?utf-8?B?a21jeEJRSkROWTlnalZmYlZkZW5FYmZIdmhWMG1mdkw3RWNCTmNJQWZuUTFJ?=
 =?utf-8?B?eS9rN0N4U2ExaE1BbmVsV3ArTHFkcU9oUmVPUXUwMFdRRVJYc3VwWUFvcGY1?=
 =?utf-8?B?SkVRQmlyRWhZNlJQNTFVMlJGQ2hpUU9VZllsbUZieTRkQkphYS92SmE4cWZl?=
 =?utf-8?B?b2JWRTQyYkZGejhRcU1Vd29nL0RENTJQQk9ETzR3RG8xSWlycDdPSDQxYWZC?=
 =?utf-8?B?bDloTDlvbU0vVmFEcXVWd2JWNWtEWTRrL3VvL3M1VVE3Nmdza3M0TWd6RS9Z?=
 =?utf-8?B?TTZpckMrUEFuUUlzS3JiampMRGNPUkNwamRpUWdyYmM0OXcxaWxwQjZIOTRi?=
 =?utf-8?B?dVRsVlZYQlYwdlozdEVFcXZ6Qy81YUtJOE96aU1TZEhqMEk5bjhaZGFQUVp0?=
 =?utf-8?B?UGFLMmRLbkFQT2ZDN210LzVpTTFLUjVQWWVsMDhkM2FiTHVJbG1UckxkcVht?=
 =?utf-8?B?UmlFUDRuU3hsMHJmVkQ0MVRxV3hnRjFKblZ5eEdOWnU0K3BVSGZEYlJjbXM2?=
 =?utf-8?B?Q2t6TlMzRVA5QThWSU5QZE1LSGhiK3lFcjFyUzN4QWVxZE8zcjgyL3V3ZmZ2?=
 =?utf-8?B?YXRZbGJMQ1BKOVBkbmMwSFZjVk96cXVaekVNRmxBTU9VV05HRXo2cmFPbzBW?=
 =?utf-8?B?OVArVXJvaWJ4STIzU0dGSmxrUkprMzlPT0ZqdjhOTUU2bldjNzBrS1FOMHh0?=
 =?utf-8?B?ejlpbmZqVmhLa1J5ek5SZTk4b3U0NnkzQ2ZBZEdPaW0zMzNHY3U5WW8wSE8w?=
 =?utf-8?B?ZUV0KzFmMnh0ZVpMY1BDa3ZXYlpMSTk4eVp5K09NT3hIeFlxN1U3bnFVa08y?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e167298c-d703-4329-a8e9-08dcdbeaf817
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 16:15:42.6488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9tQvtI+qsRFLJRG9JmSRVFai/92JVvHjaxS3AtnMyj0ukIwrHcCp6YcPMjJTNvn+UTFFKQTnhLekHdXoyNxEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6445
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

On Mon, Sep 23, 2024 at 06:06:51PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 19-09-2024 18:02, Nilawar, Badal wrote:
> > 
> > 
> > On 19-09-2024 17:06, Jani Nikula wrote:
> > > On Thu, 19 Sep 2024, "Nilawar, Badal" <badal.nilawar@intel.com> wrote:
> > > > On 18-09-2024 12:49, Jani Nikula wrote:
> > > > > On Wed, 18 Sep 2024, "Ghimiray, Himal Prasad"
> > > > > <himal.prasad.ghimiray@intel.com> wrote:
> > > > > > On 18-09-2024 00:20, Matthew Brost wrote:
> > > > > > > On Tue, Sep 17, 2024 at 11:18:47AM +0530, Nilawar, Badal wrote:
> > > > > > > > On 13-09-2024 18:47, Ghimiray, Himal Prasad wrote:
> > > > > > > > > Agreed implementation/usage will be same,
> > > > > > > > > will use explicit type for
> > > > > > > > > clarity.
> > > > > > > > > IMO typedef unsigned int xe_wakeref_t is sufficient instead of
> > > > > > > > > typedef unsigned long xe_wakeref_t;
> > > > > > > > 
> > > > > > > > I agree with this.
> > > > > > > > 
> > > > > > > 
> > > > > > > What? Really? I thought it was pretty clear rule in kernel programing
> > > > > > > not use typedefs [1]. Reading through conditions
> > > > > > > acceptable and I don't
> > > > > > > use anything applies to this series, maybe a) applies but not really
> > > > > > > convinced. The example in a) is a pte_t which can
> > > > > > > likely change based on
> > > > > > > platform target whereas here we only have one target
> > > > > > > and see no reason
> > > > > > > this needs to be opaque.
> > > > > > > 
> > > > > > > Matt
> > > > > > > 
> > > > > > > [1]
> > > > > > > https://www.kernel.org/doc/html/v4.14/process/coding-
> > > > > > > style.html#typedefs
> > > > > > 
> > > > > > 
> > > > > > While running checkpatch on my changes, patchwork had also issued a
> > > > > > WARNING: NEW_TYPEDEFS: do not add new typedefs. I
> > > > > > reviewed the usage in
> > > > > > the Linux kernel tree and found it used in many places,
> > > > > > which led me to
> > > > > > assume it was safe. I now realize that I should have been more careful
> > > > > > in understanding the context of its usage and referred to the kernel
> > > > > > coding guidelines. This was an oversight on my part.
> > > > > > 
> > > > > > Since this doesn’t impact the CI or runtime, I will avoid reverting to
> > > > > > unsigned int immediately and will hold off until I receive the other
> > > > > > review comments. I will incorporate the changes to revert it in
> > > > > > subsequent versions while also addressing the other review comments.
> > > > > > Thank you for bringing this to the attention.
> > > > > 
> > > > > If you end up replicating intel_wakeref_t from i915, and go as deep as
> > > > > the rabbit hole goes, you'll realize intel_wakeref_t is a pointer
> > > > > disguised as an unsigned long. It's a struct ref_tracker *
> > > > > when you have
> > > > > certain configs enabled.
> > > > > 
> > > > > You could just use struct ref_tracker * everywhere. It's an opaque type
> > > > > to start with.
> > > > 
> > > > The original idea of using typedef for the fw return mask was for the
> > > > sake of clarity. However, Matt B pointed that the use of typedef in this
> > > > instance is not in accordance with the Linux kernel coding standards.
> > > > Additionally, I agree with Matt B that there is no need for the fw
> > > > return mask to be opaque; therefore, it is preferable to maintain the
> > > > use of unsigned int.

yeap, please let's keep it simply as unsigned int for the flags of the
domains which needs to be returned.

> > > 
> > > I'm not sure it's a hot idea to explicitly state that the return value
> > > is a domain mask. The callers shouldn't need to care, should they?

The caller doesn't need to know. But the relative put should only put
back what it was taken. Hence the flags.

But no need for any wakeref tracking or magic... it should be simple.

> > > 
> > > For example:
> > > 
> > >   +    fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > >   +    if (fw_ref != XE_FORCEWAKE_ALL) {
> > > 
> > > Under what conditions do you expect this to happen? Shouldn't
> > 
> > If any of the requested domain is not refcounted (not awake) above
> > condition will happen.
> > 
> > > xe_force_wake_get() flag cases where it couldn't deliver what you asked?
> > 
> > Internally xe_force_wake_get prints drm_notice when requested domain set
> > ack times out. In the driver currently caller is sometime returning
> > there is domain ack failure.
> > 
> > usage: where XE_WARN_ON(fw_ref != XE_FORCEWAKE_ALL) is used, which looks
> > redundant to me it can be moved inside xe_force_wake_get.
> 
> Agreed, the driver should warn, in case of domain ack timeout failure,
> irrespective of whether user wants to continue or not. Will move the check
> inside the forcewake_get itself.

I agree wit this as well. Always warn on non attended request and simplify
the callers.

> Similar to what _put will do in
> [v4,02/23] drm/xe: Modify xe_force_wake_put to handle _get returned mask
> 
> 
> > 
> > case a)
> >      fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >      XE_WARN_ON(fw_ref != XE_FORCEWAKE_ALL)
> > 
> >      //Here caller doesn't bother about all the domains are awake
> > and     continues
> >      func_b()
> > 
> >      xe_force_wake_put((gt_to_fw(gt), fw_ref); // Puts only domains
> > awake by xe_force_wake_get.
> > 
> > case b)
> >      fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >      if(fw_ref != XE_FORCEWAKE_ALL) {
> >          xe_force_wake_put((gt_to_fw(gt), fw_ref); // Puts only domains
> > awake by xe_force_wake_get.
> >          return -ETIMEDOUT;
> >      }
> > 
> >      func_b()
> > 
> >      xe_force_wake_put((gt_to_fw(gt), fw_ref);
> > 
> > 
> > As of now driver have both usages and this patch series caters both.
> > 
> > Regards,
> > Badal
> > 
> > > 
> > > BR,
> > > Jani.
> > > 
> > > 
> 
