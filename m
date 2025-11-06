Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27828CCFA05
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 22:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1EB410E58B;
	Thu,  6 Nov 2025 22:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eq0gdX77";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC35910E9EA
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Nov 2025 22:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762466907; x=1794002907;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=MhNZteMEUb4npavYG3abxZIOREORoJZaJA+hTkhiA5g=;
 b=eq0gdX77JSgRRwksWAQIxP2atnxhOAIPrICvFa7/HYiaEfQV9TPe7UUZ
 JOv21tclQ3BLx6i6IRdSsucGdfJfTChIOXUtchMJGJjkOTxBIlGM1qQtD
 HhclzTUQMGqiHkMx3l8upMB/1Feeybf7km5XGM/e66tLKyz4i3mq8wHTw
 rHS23ISuP0LpPy7Qt+cyDrsvgyv5c3u5o/dHyDFKQAzBiSPVRa94/hnkf
 phf4gi9fc6BpuzGBK62VLScECetVUSjxVbAbkPJ7gS7JFhEdhyZFkuv/O
 314Pnic2/htWylEE+iaQ31XQoX0SR3X1YRnAmAmoHPhRrq7h6WoJEXj09 w==;
X-CSE-ConnectionGUID: D8wGBVNdS6yS51MQXxK1Uw==
X-CSE-MsgGUID: zgyp9lkMQeGjNTlki5wEww==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="67228855"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="67228855"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 14:08:26 -0800
X-CSE-ConnectionGUID: yCzVxOCsRwmv4OXdO78ZNA==
X-CSE-MsgGUID: Elgsc8sUSsC9DhZUh7i0Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="187823647"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 14:08:26 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 14:08:25 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 14:08:25 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 14:08:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TufyrIxX80YhcXbAgrysv1CRZeChGXyLG3Pf62I19fQQIDoChQLx+hfNPuA5S7gl9EZwD7b+P8uUVXo9kSAoBs8ugn1bda5dq0gtAtuktDb/RPGX9wUFk06FG828NQ5gce55YIVGe3LqdFoVqoRgUxyx3gZF7J9foORwCcN21OJyegfkslbtSpOrQzXt2K6j3sKIvCys0MBO0wStsQj4WcSYymCe6xFkmzaYJPv3k12qrDUT2+04YDnzPMnydnt5CjOuaAo+lDwJbLU+leM+jkAlWGDtUD1naRWLoHn9/QUn84lHoxwjLf971UhvC8G2ZtHGbaCWOoOPtEamahhL8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhNZteMEUb4npavYG3abxZIOREORoJZaJA+hTkhiA5g=;
 b=NTk6eUsXgM1fggQj9zYmlIbERtNbU5JjApz6QXpVv2AEwKNJV1U+Jx1z+sDmQNB5GTffmB4MBDK5eCeS39LHikBEvqL7fq/WqkgG1JT32963tniHHM/A0UwZDTH+StvE4YkC8teFrVgPExlujpwISZB+0WMCAzzhPz8bKKDn7QbZ2Q7iljmXUf+gP8mMI1eaO4BOg3//l7xLrMrd5sapPMKUnnEE2RUFzE16y5WpjaC5dRWMgi9soF1gr1IZmEje2Ii04jW/HynQpMsVN/ZKc3NnjfJs7nb1+EAe2pu3ewHl8C8EpBKHQdT4J1R9quh/LaaMbjs6q5YYinl+wc7IpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA1PR11MB6990.namprd11.prod.outlook.com (2603:10b6:806:2b9::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.12; Thu, 6 Nov 2025 22:08:24 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 22:08:23 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 02/12] drm/xe: Make usm.asid_to_vm allocation use
 GFP_NOWAIT
Thread-Topic: [PATCH v2 02/12] drm/xe: Make usm.asid_to_vm allocation use
 GFP_NOWAIT
Thread-Index: AQHcTcUfR4tinjB0BESxh+/3sMiG9bTmODAA
Date: Thu, 6 Nov 2025 22:08:23 +0000
Message-ID: <434ce6580dff4fd36e18fc3e72fca4ade750b072.camel@intel.com>
References: <20251104195616.3339137-1-matthew.brost@intel.com>
 <20251104195616.3339137-3-matthew.brost@intel.com>
In-Reply-To: <20251104195616.3339137-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA1PR11MB6990:EE_
x-ms-office365-filtering-correlation-id: 3944daac-7496-4398-a155-08de1d810112
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bmpONnRmYWNnb1BkVU9KWnNvc2FBYTVaMDh3NHpQR1Z6Wm94aXRJVWhUS0Rs?=
 =?utf-8?B?Z1FZaUp3MmJoY0RWSm1wTDh6UW9pTE05VFZmeUV3b3E4dkpvU0JnUEkvZE05?=
 =?utf-8?B?UlNFUEtjMGN2TTZkRU5QSVpGc0YvS29aS0ZNUHhiZEltUVlmYVhhbWIzOW9Y?=
 =?utf-8?B?bzlZMCtiWjlNMS94dXJtZk1MdW9oNm9EY0VTcHJEQ3FlSkg2bjhtUkNZcDFh?=
 =?utf-8?B?RUp0K2tQVGZIMFUyQU8wZmgzazZOMmg0NWJkN1BXcGRBRXIxUnV4RENNcENK?=
 =?utf-8?B?ZjJLNFV0S1AzQzU0MEwweW9LcHhTM3hvKzRZK3UxVk51bXV0MmVhMEdrTWpl?=
 =?utf-8?B?ZFEzVDM1V2FmVG5rK3k0THFNQytVUkt5aStaNFJ6Q08rdkhGWkpBeXRQY014?=
 =?utf-8?B?TEp6dGVTR2NqVGV4N1cyNkhIeTZ4UlBnM2NPM3ZUSzY4WVRUZHFvMDFKdTV4?=
 =?utf-8?B?UU41amFNNlh1MHdxVnB0K0hxTG1hNEVaZCs0bFM1VmpmTGVVR0U3bEx4aENO?=
 =?utf-8?B?S2c4WFJndTA1eHF4TlpMZTZuQ3JKQjFjQnpGdnlXSjFtZEdXcTVSNDg4VUJI?=
 =?utf-8?B?QmRwU3NFdENXMVZMWENmSzNNZVE4NDd6VjZpU0lBZC9nZStNWWlnV3lKbEVv?=
 =?utf-8?B?TnJ3dFk1alNMUDMrUDVCUXQ1M2hsWElHR0RDZjJ3RTYzYnlQM2w0TlI3QmF0?=
 =?utf-8?B?NjRtT0toZ2tDWk9EVG5DTHBYMjFNT0V0UjFiTGxRdjgyK0ZWbnlKRVRTNlJu?=
 =?utf-8?B?bE95bmJxMlU5YkhoZlo0azB3MVJFb1A4UG9ETTdMZjFURHQ1TkJNUVlRMkhV?=
 =?utf-8?B?UTlJdk9YcDVZbWcyNDF0THF4RnFPMGVjakhUQzl6R24rMW56dEZRc0M3d1ZL?=
 =?utf-8?B?TDBUdmFxT0xnZGRHZjYwUG9rdTlDalU4MjJEdHhSMWd4Rnc4MndROGl4Q3p5?=
 =?utf-8?B?Kys3Nll2ZDdwM1h2ZjlEeTFhTW1IQXo3K2F2YXZvRllpaXMvYlRoejVYWG5C?=
 =?utf-8?B?aVBaZmZWTkMxMHYzQkw4enhaR3JpcDNwQTZVcTUzRmNYQkJsYm5kUEJyVHFw?=
 =?utf-8?B?SzhwMEdUelVldkduc3dlSUxDbTlUK3FyU0dpM2s5bTI2eHNPMm9ZN201SjNp?=
 =?utf-8?B?VDJNQ1Nvam9La0VNLzZmY3RPSXcxTHB3VEdueThSUGpPNURoMU1OL09VdVp5?=
 =?utf-8?B?VWFwWksyQllQZXdycFNhcGtWSGQ4SUZSUUlIWmwyVGhsRkdYazFkUEh6V05y?=
 =?utf-8?B?MS9wemtkRHNHYkovTkZ2NDlDUDV0RnFPVGZnYndYcnc2aFJPQVdLZGV5bUp6?=
 =?utf-8?B?Tm02blJEZW9FZ3VLOWhpYWlZWE90SlVGb2R0RW9xOTFRa0RGRUpYQkM4SE9D?=
 =?utf-8?B?VGNmTUJKaDhJUUU4UXQ1THBXYW1UR1JiaHJOV0tIa1V6M0srdWxGK0VLcUFo?=
 =?utf-8?B?OUZKMFAybnRCWWcyckk3RzM1T2FYWm9FZ1podlY1ZlgvUGRtTWxpQnNjYkRv?=
 =?utf-8?B?d3VIRFBhZmZYd0U3WmNDOE1tdjltRzBFaWg3M1ZJQnpwSGdNRDQrYTI2RmlI?=
 =?utf-8?B?WFAvSERyd0FzbDJ2QWJUdEM4bUdpSHZVYXNTbmlTLzJtankrSnNPTGRWdWNp?=
 =?utf-8?B?aTZNVGZHS0lXN0pDVFA3QXhvL1N6YUpOTzFmRHhrNS84MEhDK2VYdXZXT3Z0?=
 =?utf-8?B?U3lFRS9KUVE4eHBnMjJBSXMwaGJJYUJYcXFGcklYOVM4WWEraVBwSGw2QzRw?=
 =?utf-8?B?N1RhRTV0SDNGYkxrNmFoWGMxWWlsVkZkaCtlZFU4UzFuNmhXTUdDMkY4RW5B?=
 =?utf-8?B?OElpQnF0TEFIYWFqaGpneFdZT25acHFVK0RGVzNkUGVsS1NMYW15Vnl2d1do?=
 =?utf-8?B?YW1nN3ZjNlpUYlhQTVZqMm11cFFqc1NqbDFLUUV6SCtDQkxBR1l5cTlCVk5H?=
 =?utf-8?B?eUJvRW9EM0VCbjVlYnhQZ3N6c1hoL2M0UTVTZWc3S3F0YnRFMDl2a0p6SjdF?=
 =?utf-8?B?SlVOdGlKSVczSlFYSVl6QldaT2Y4cnppU3hSeVNuUFpqWllGUzRwV25vQU9T?=
 =?utf-8?Q?VTzjsO?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enBnOEZYRlpzREZrQUpOZUFVV2JEV09rVW4vdU04aFgvakhiMnZZQkprQnQ4?=
 =?utf-8?B?aFdnQVlzeW9FQVhXVVgzdlRtK0lvdnJEZkhGTGNOanp2L3NkaStLd25zdlk4?=
 =?utf-8?B?R3pocDl4eGVDZE1yY2k4UlYwNXQzWmErQ0UzWm41cmJtUEV0cTBwcWc4S28r?=
 =?utf-8?B?WmkzQTB3OTFURmZsQlhRUllNWXhIdWdHOWhhWnNkczVBN2FJQ2E0UExrNXYr?=
 =?utf-8?B?QWYwRUZrOWJxNTZVVlJxdUF1TW5LNHdtZTNMWm5VRXhka0xsSXE4TWpNbTBa?=
 =?utf-8?B?OVdGODdpYkxYSmtpeHJmOTB3cmlpZGN2UkdoN253aXppTm9CbUJQSzQ5ZFoy?=
 =?utf-8?B?c0kxdjMvQWd3cXFIaUEwWk9OMm5NRk9hc21UNGVLWUxQL0FwRXpFR0JNK1FO?=
 =?utf-8?B?Tm11RFl6OUkyYStEdjBCUUFwb2NwNUtuOGpPbGtNZEJad0ltNUhhTkJ6dHhT?=
 =?utf-8?B?bVhtMFpPYlRLbTVIcmR1WS9tUDdKN2dhUHhHVUF3UGdManJzYWFuZHlmQzNQ?=
 =?utf-8?B?TXZ6UGVBL3hlQXFjY0hVUU5nYWgreTQwcFZsU0ViaXdGQnROZkNWWHh5SWY1?=
 =?utf-8?B?VUtpQWdtRk44TXVzVU1KQk9nU0VDdzd6WnBsZFJWbTRZNC9RNmpUWUkrd0hZ?=
 =?utf-8?B?N1lLeklYWEtFV0FhZkllWG5UdEZENEZkQnN1WXlmREpjeHpVWDl5Z2oyS25r?=
 =?utf-8?B?eTNUR281Q1JHeEt1d2Y5TWFyWE85ZG1sSllMeG9yWWNKN0lhU1o3WkJMNWdN?=
 =?utf-8?B?WnJhOVRtSkpXU3gzWldvb0h2c2JEZ2d6YkE1enJRZDEwU0RDcnA5ZmRCM250?=
 =?utf-8?B?aS9VVy9SdDlQSlVheHJMR0FnSmsrVWR5ZW1WUTJqQStSUkJRNG9tZXJGam93?=
 =?utf-8?B?RkNFTDlpV3JSbXFXRXN6Q0treTNyc0c0eVVoQ08rb3RtYXNvL2IxUkJmN0Fk?=
 =?utf-8?B?dzYzQVQrVmpuUklzQmlmRFhvc1JyZE1LUEQwUDFnNzVtYzBYWGhZZWIza09I?=
 =?utf-8?B?ZVA2ekEyeUZxcU0vb3g0N3M1L3cvSW9YY3ZqSXNYZmRtTlRMTkVzTVFFbDdr?=
 =?utf-8?B?VFFRMCttL2tJamJOUytUcVkrQzVrY1FWa1FZZ25TbWNqa0xQZnBWWnlVT1l6?=
 =?utf-8?B?ZERNVm1FTVd4d2JLM1JoYi9abDcrV29yQ1lEckRoeFV6MjVmZ2Y0UFFUeFdD?=
 =?utf-8?B?Z2lQcURhamhRcjE5djM0TlJiOFRFSjJTUURneURwSm9LUml3eWFyZmhyWFl1?=
 =?utf-8?B?Q0RpMVZtb1VJWUtyNE9CM2VZNU9DMFRQSHo0bmtWMjNxNWxFblphUUVpb2hY?=
 =?utf-8?B?SVV4V2NSR0Z1VnY5ZWJha1I0WU9oMCtkSEtvNWdYUXRYdnIxakhEalZ5Nm9v?=
 =?utf-8?B?aXRZWHl6M1BrMFZuSmlrZDRqZ1lWRk5RMUpyQXhESStQWlhBaFVCbWpTRUJ4?=
 =?utf-8?B?Vk5xRWVVVWlpY2JkR2lZZ0lYWjIvQWxqWCtjRlBkS01Odk5TSDZyaXIzdDVW?=
 =?utf-8?B?WkJPeWJhdEl2cWF3bEprOWN1c1duUTd2aE92TzR1WDBLR3pNSUQ2dGRTbmxZ?=
 =?utf-8?B?Q0xUdGRTY3BxZk83SllzOG9ERERpSFBLY1QyWnl1OUUySzM0amVwMVJFVUpr?=
 =?utf-8?B?NFJydEF3bzlwTzVjK2dCSzdQWlljNUJQZFZldzBuUnlFeWk5SExrOHlEZUFi?=
 =?utf-8?B?NDlwQUJQUDBZOGg1SlA5T0hEVmh3VUgyd3ZLcWJHZkxNY0FkS0VTUHJ2Vm9q?=
 =?utf-8?B?YTl4aHMyZ3VJblJvOVRYbG9mU1drRXFEMmt0ZWNkVkNDZFlIYStKeGE3MUpv?=
 =?utf-8?B?amVQLzV0TWRKYXdhRm0yZzhZTW5mUE8vVjAxcnhKL3ptYVpWSDQrS2xpT2l3?=
 =?utf-8?B?VTlnUkZoQll4dHVKS0tOdC8zYmFra0J0bFlBUFhubE1teWpHdUtoTmljb29D?=
 =?utf-8?B?RCtweG95MWcvN3BnNGV4QWxnR3YycGlnVGt4dnJJZ05CQUVUbHYyejdFbnBl?=
 =?utf-8?B?Zkl3NG1oMHZ5anFmM0JPYmY1VVFNam5ZMUhSM09LNk1YaWtpc0NvRmhqWFFY?=
 =?utf-8?B?ZENKRXpHWkdtZEkzZCtENEZTaDB1MklCSFdiOGZFbjBKbEkvcHFhZXNYSFg1?=
 =?utf-8?B?bDNZY0s1aEFtR05xV3B5UWcrU05BNlFOKzJhY3QvOEVSdU91MmpRelcrY09I?=
 =?utf-8?B?UGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F529B03DDCA66545B7D41793B39FC77C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3944daac-7496-4398-a155-08de1d810112
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 22:08:23.8697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: volGwd3UwsEVCnuJFlTYLUACAzie5AiLzSZod2dAE7oMc/SpZ4gg6wzdNa07CaVRyjyEkL0TgUiklcvMfXCMBwczF4KlBm/zUxBpOl2xAlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6990
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

T24gVHVlLCAyMDI1LTExLTA0IGF0IDExOjU2IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IEVuc3VyZSB0aGUgYXNpZF90b192bSBsb29rdXAgaXMgcmVjbGFpbS1zYWZlIHNvIGl0IGNhbiBi
ZSBwZXJmb3JtZWQKPiBkdXJpbmcgVExCIGludmFsaWRhdGlvbnMsIHdoaWNoIGlzIG5lY2Vzc2Fy
eSBmb3IgY29udGV4dC1iYXNlZCBUTEIKPiBpbnZhbGlkYXRpb24gc3VwcG9ydC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4KClJldmll
d2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgoKQWx0aG91
Z2ggYmVzdCB0byBtZXJnZSB0aGlzIHdpdGggdGhlIGZ1bGwgc2VyaWVzIG9mIGNvdXJzZS4uLgoK
PiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jIHwgMiArLQo+IMKgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMKPiBp
bmRleCAwMGYzNTIwZGVjMzguLjg0ZjRjOGYxYmUzMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfdm0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jCj4gQEAg
LTE2MzIsNyArMTYzMiw3IEBAIHN0cnVjdCB4ZV92bSAqeGVfdm1fY3JlYXRlKHN0cnVjdCB4ZV9k
ZXZpY2UKPiAqeGUsIHUzMiBmbGFncywgc3RydWN0IHhlX2ZpbGUgKnhlZikKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRvd25fd3JpdGUoJnhlLT51c20ubG9jayk7Cj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlcnIgPSB4YV9hbGxvY19jeWNsaWMoJnhlLT51c20u
YXNpZF90b192bSwgJmFzaWQsIHZtLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFhBX0xJTUlUKDEsIFhF
X01BWF9BU0lEIC0gMSksCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmeGUtPnVzbS5uZXh0X2FzaWQsCj4g
R0ZQX0tFUk5FTCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmeGUtPnVzbS5uZXh0X2FzaWQsCj4gR0ZQ
X05PV0FJVCk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1cF93cml0ZSgmeGUt
PnVzbS5sb2NrKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChlcnIgPCAw
KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8g
ZXJyX2Nsb3NlOwoK
