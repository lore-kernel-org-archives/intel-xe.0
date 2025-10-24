Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB33CCF9E0
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 15:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE0E10E1AA;
	Fri, 24 Oct 2025 15:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fEFkHZUG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0E510E1AA
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 15:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761320452; x=1792856452;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/t/9tWQOFZxhLuRFVVHVCcx4Wg/EnMwBq/Jiksa425Q=;
 b=fEFkHZUGFhoqVNbWk5De61D5JDcKJTmqrypZZVSeU0UkfghYAfAV4oIA
 wPMBlmUh8SS8+484MpvpzSYZZ2Tc9hPASbBEMOV2EmP7vWwMEwvBAIOhe
 e5lf8MVB8N/nklrK1HP1uKUlVBv773+KSKxEBIv8HXHSOSZqaZE6aFf7x
 GJr3iaqqERkPZcE8PEBRzXcwJU6Q9y9Fhl0856BlwvMIrBpbdvknGSKvz
 lkft+mE3sCiUjXGWZRM7uIw25HnAGx6uUMfDzhmk9AvrskeAbjsl8p97/
 EzrIu8bJmD5yVbkIZTLDhRQH/mY0gqNXetbcwUUEhkpAmM8WMrZCmlI3P g==;
X-CSE-ConnectionGUID: oZZSgRkkRa68xPYvp+jZVQ==
X-CSE-MsgGUID: MT/0AWjKRx+iVF64dvCScw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63544041"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="63544041"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 08:40:51 -0700
X-CSE-ConnectionGUID: xPpGDvd8T+yX9C5/n0lRHQ==
X-CSE-MsgGUID: EkZ2EnSaTcCh7LjKwfZzyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="189698620"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 08:40:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 08:40:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 08:40:50 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.57)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 08:40:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmclMVEzkZgGbT5gfFQfsPc+d1xNedrfHnnePFE+xa1RQlQfiNBVRdT2L4VNGOpGnjwbdKO+E8j/fMF/OHvsUrEkncskIYeuNGzIszFO5AKvTXiITVJ4r67NRDDcM5vgGbWLsCAgg/+SuDMRfdV7jyNOv33P4fbAwYGUxz+931iYeLzaUC9oIo6tfCITpntKmcTIpwlR8QY1lbQURobdLmSbGZcO994vAijcsAhY7peEipkhmV1kI2g01d7jLCP8os5JL7EJN+Yk4lTl4yHahsW2y1dGJMWPtczz+bc0jh++vHpzVrB6NkGCI17WcL54vay9CLTqiWIELK7NVs84jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wjto7lIptfHcHi6W0+oOTMpkPagK52q+5t0/TlUJfnc=;
 b=muWAO/0RQ1xqHzhYMCqpwCHJ/HQg+eIh8AgBdhl7fe4i29q/GwptguEtm1g7HtNHKt229ShlWMk9+DT0NYcGmr6efLzyB0GUG8oRghiTMd8k4/AkA9eIZBstm8C1g2+JzNgmET4Ke9qddnEmhQ/bJg3KHSFf+LI5P8uM1yIXjvdZmerwi1Ht+PhVI7JqgzEVbhLE7hK8vb4U8kzEfZUkeWX64fmufrEnttkOymkT3JtVl4TItLYPZfI08RjHG/TC5J+NVtDgxhK6Aw7M9YfQw1UDokrhIublmGvmiYuzmiyEpVrO/gH6lSFkfflSxnJ4UAMALJ1mtdEW6M7xm7L7GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPF5AD378C3B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:40:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:40:47 +0000
Date: Fri, 24 Oct 2025 08:40:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
CC: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v8 1/3] drm/xe/migrate: Use AVX instructions to prevent
 partial writes during VF migration CCS batch buffer updates
Message-ID: <aPud/MD5iQ22Ovxe@lstrano-desk.jf.intel.com>
References: <20251024133522.16970-5-satyanarayana.k.v.p@intel.com>
 <20251024133522.16970-6-satyanarayana.k.v.p@intel.com>
 <aPuFuykBdiwM41Z2@intel.com> <aPuHjlbbeJq8FpWr@intel.com>
 <670ce0ec-ce9c-4003-afc8-8e508e41564a@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <670ce0ec-ce9c-4003-afc8-8e508e41564a@intel.com>
X-ClientProxiedBy: MW4PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:303:b5::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPF5AD378C3B:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c8f901-7e64-43e7-d554-08de1313b394
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHo0b2VMSk12WkJRTTRDZGNsaHFHa1BJOEZUNnJiOE00L1lYUENvKzhnM2Vk?=
 =?utf-8?B?ZXNpcEoxSStsMTRmcVYwV2Rrbk5tMkRwdzRnMzJrc2pjdnlqZ09samdRdmpC?=
 =?utf-8?B?d3hyUlNNV0ZIVDk1UnZNK25keGQ5dktMYld1MlAwWDNzZ3NyNDgrbXNMOGJ5?=
 =?utf-8?B?WE5sYmJsTWF2bnA2dWtTU1JES3ZYc2M4ZElGZjN4YjNaMForc2JJZ2FYR2Uy?=
 =?utf-8?B?UGhlTEx2RlJLSTMxR2dLbW5VUkUydFo5bHh4WW9tMFNIa2pMbXhWRG9QSlhs?=
 =?utf-8?B?NmZmWFhmYzJ4K2cxZTFrZ0NrUFlLZ1g1THVrQWNxUXV0dzFaNUMrV2JxV09W?=
 =?utf-8?B?M2hFNkRDTUtFUXdGeWN3cXhON2g3MHV6STM3aGlwbFBNdWovRXloMXJXOWhS?=
 =?utf-8?B?T3JDc1JIWEo4UWUvblFyb1BqZnpDbkRmQnViM0dPQThJTEZNS3BhaVQyQlVp?=
 =?utf-8?B?aGRTRko0VE1JYmE0YzNxVmFkLzZSSDRXSndWZ28raDhnWFhURGREWFJ2Umw2?=
 =?utf-8?B?bGd2UHJLcFVVWnEyOEFvK2xBc2VEOXdQWHUrRmc2eFlWcDYrbm82V1dYWEU3?=
 =?utf-8?B?WnFtZDFoMHY5LytlK3Zuc0ZoTGd4NEVXVXJTS0YxWm9iaUFncEJ0WnBidTk4?=
 =?utf-8?B?U2VqaW1KV1ZTdElVRXkxRVNsRHcvNW5LN29ybVgrU1YrdmFzZis1dnkvQU9z?=
 =?utf-8?B?dHFKMUhSSHpGRlZ2cHNKNTBuUlAyLzRGS0c0b0RHKzJ4UTlDdzE4c1N0T0V6?=
 =?utf-8?B?WEJrUDlqUHFJQ3hZQUU0eVZwaC96MndkVnNqSHVmNWNqclNJMTJyaEZEc3Rq?=
 =?utf-8?B?cFovMjlzd2thNGloby85YnU0V2NWWC8zWUdlQmhscFJuWjhSZjFGR0kyZC8r?=
 =?utf-8?B?aEo2M1BSSzBTVXdocDRabzFlR290Z09ka2VBVVdyYlFvVy9jbDRqbWo0RjJq?=
 =?utf-8?B?ckVFbDdjdnBxSnU2RzFvVUlObDgvVkpOajkzQmVPejAvUWQ2MzI0clN3OXlO?=
 =?utf-8?B?TU5DVWJLOWNJS1FDaC9CaDZXdFRERUhOeldDM2lsazk3TWtyblYvZUpqeUN1?=
 =?utf-8?B?RlFQODFUVkNKQVU2M20vcktaeXJKZGkzVEtJeXIwSXE0RTlWTmpDUUxCbUJG?=
 =?utf-8?B?OVV5MlE0UnJMZE96Z0gxekM1YnpraTB3SVhuaTJVQUZIaUlUQjNCQnQxMGhs?=
 =?utf-8?B?dDJSY1JoZUNSYStNcEQ0YkFWUlBFSTRGSzJjU0hPZjJpd0pMTXRLREptYkVi?=
 =?utf-8?B?SFdWSCt5NGp0QVFsVVdpVWtkVHlmaVFmVGFZSXNnZ1RzcklZcHl2RFJnZW1i?=
 =?utf-8?B?Y2NJOS9idEVmam5uYkY1M04rZktGUlFkY1ZFaTNoWEFXamYxeURHdjZ1Q0x0?=
 =?utf-8?B?NU52WmJIM1N6Y0NTRTJRZ1hteTJ0dGRiaEVWZkJoQ1hqSE04eUxsOVRxMmR0?=
 =?utf-8?B?VTQ4L09ZSmxPVGxOVWc1YTJ0TkJoYm83NUNQU0tTTmJ6UTlUNWtld1BMNlBl?=
 =?utf-8?B?b2NLVjVKeUdaNGw1NjhUdElXa0xTeWc3TWNONGpHbHArbE5kWnBMeFJhUm92?=
 =?utf-8?B?b1pwZWhiTTc5MU0zRHJxWFloR3pnMUhxWUQ1d1NMZ0dUVm92ZTQwSlliVU15?=
 =?utf-8?B?Qk5VRERjUE94dkxqQXpaeHZWS1F2VEhBeWxWZmo4aHRKUW1odTU5bXMrOU9a?=
 =?utf-8?B?VWJ0d2JjelB0bG9SS3A1RVFBUVgrd3U1N3RnbVQ4QStpUi9DNllWRVpPQTNa?=
 =?utf-8?B?Tm9zUG4xN0ZvT0VIWUZaU05DMnJtZjk3aHZTRUN1d1VnRFNtdlFaeFhXelVI?=
 =?utf-8?B?QjczeE03bnQ5RWw5eWFLM0UrL2hEV0wxbWIzYUlnT2ZKejk0V0Z0WW5XcTUr?=
 =?utf-8?B?ckNrV3U1WnZsR2dnNEErdlVtbmhwaUdvSENGK1JGVjN5ZzhXMlQ2bnVFZU9X?=
 =?utf-8?Q?Vd1UL4Lhqoi8LIceiqCo92qR/qCMCPIf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHRVUjhiMEJZOGhPelZoWDdXbXpaQTd4RUNRM0plSkFHSjFISFhDM1hRZ1U5?=
 =?utf-8?B?OFdFZ3ZJZlh1TGdISmh2ckJLNjZjSFN0TWhMdW9vbWl3a01RZWJIOUNHR3JO?=
 =?utf-8?B?WDRWaHpYZmxGRnYyYzh0TVduZWsxeVJGTk5xdGNScmZkUE9QYmdHKzNWNmw2?=
 =?utf-8?B?SGRKSkZJNG9VV0s4VFIvdDRMT0U3QkFObWlFbE03alVyYnFjZW9QUjkvQS8v?=
 =?utf-8?B?QmRUTFBkNHRTeitUT0RJQmpCSklJRzlJKytuNG8vWE1idi81VXdlaW95SXdw?=
 =?utf-8?B?RVpmQjloa1ozSXZiTW9NQzZNRWppWlE1NHVrS1pyaDlSMkdkL0d0UmVKbnRJ?=
 =?utf-8?B?a0NzRlk1WDJLRmhEdXR5NEF5SXVDdVA5WHJYVUlGcnFjMVYwTkdXdGErUERn?=
 =?utf-8?B?Ujkwc0NzNWUzOHozOVNTMDg3bDFoZ3V5YjNyYU8rbjFIK3dIeUt6RDhDd2do?=
 =?utf-8?B?TTJXYzFtLy9lTXV1VlVJalVFaCtpK0F1cERGdVBjejYvVHpab3AyL210Z3or?=
 =?utf-8?B?bWpOS2tpczZMOWU5M0NtWWJ4MGpiUEhCclkwUi9ROGl1Nm1QOVhadmF6M1pz?=
 =?utf-8?B?Wis2eHkwOFNrNGpSU3BXZWtJYjgzaE9mSEJLM2NLRzAyQ2drMmk4VTJVTVd6?=
 =?utf-8?B?eDY2TDhJQlJKdFgwL0NZRVZsSmdtZGNIbVFVdzJablUyUHNWNDdCaWVIUFFi?=
 =?utf-8?B?TElmQ1NDcFIzQnI1UEhkS0lnQnZidWllelE5T0QzODljQ1pnZWhaMkhhTTdT?=
 =?utf-8?B?K1EyRHFPNUU5ZnMzV3lrWDQyQXoxWUs0NjdvdCs5MEkrS2tIb1RJM0M3ODIw?=
 =?utf-8?B?T2ZKUFgyOFdRdk5Nblg2ZHJFamZzSVFPRm5ERHlqcXk1a0ZiaUtWZjlPVGM5?=
 =?utf-8?B?K0ZuYUZ2UUxEbkJYY1AzMkFHcytCQjJSWWp5Vnpnd05scVViMUlxQWJleit6?=
 =?utf-8?B?OWFtVG92WFlqU09ReEpvM21Jakp0RWwrNUFGY3IwTG5pWkRFalU1a1oxcFNy?=
 =?utf-8?B?VFYyemVQUlhWbVdNbDhPY3RPMGNldGp3ZGdnbS9aMGtMTW9JczRtbTFoYkt1?=
 =?utf-8?B?Vmc5SzB5Q0dESkxVQmlkYUFJUG9oRStkUTk2ZlRiVDE1SDIxZHdJeGVJV0xZ?=
 =?utf-8?B?cWIxME0wVHVZQTZyWDVwenNPNHJCV1pPYUlEMkp4a3pFWm1mZ3NCL2hEaE11?=
 =?utf-8?B?b1cxZWhNOU5JUDlTOXRRcTJCNjY3S0ZGR1NDKy9mZllXMUlNc3FIbDFuQ28x?=
 =?utf-8?B?bWF1MThkTXhaSkZaSzZaWlFwQzdtUWNQVW9kWGZnYVdCdmlWZlJoZEpCQ2FO?=
 =?utf-8?B?UXFNWGhGT3FwMlB0T1dxV1BvdS9ONjRIeXpQYndpOCszcjdpN2ZxVEpzcm1p?=
 =?utf-8?B?WWtMY1RlWWlNMXR6S1VjcFd1bWh3SU9NeHJBREFVOVpLYkpGSEJQYUcrTEdK?=
 =?utf-8?B?Y3dpakYrMFpkUlhJenZWcGtIalREUDNBLzhCNjNHcHRNV2hsU3AyWjkyRWgw?=
 =?utf-8?B?YUtTd2VIMXdPOEQ0YXVpak1QWHRnakk2UjFDRFRnSTcvdkJSZ3lXWmVwZWVZ?=
 =?utf-8?B?aFIwVlVmYnhnNGllbzBGVnEvaThHRzdleWM1RGhDVTZaSGhBYlBtSkdFQjRK?=
 =?utf-8?B?SlJTQ3VMWUJiL3BmNGZzb2xkMTJ3ekxWL3k2Q2Vab2FMV3hYVitLdmw4SVA0?=
 =?utf-8?B?aWZuRXk5Q3RMdFp0UDJGL1N6Zmw5L2NlU1ZuKy83eEM2MC96dWdid0syWU5H?=
 =?utf-8?B?UzVCNm8vN0Nmbis4KzczTDVJMnFNM0hTMGMrWUgwOXFaNExhL21tTDlyeG5Q?=
 =?utf-8?B?Mk1YTjczUU5NVzdhS1loY3RLQklFK0E3Ukl0VDRMZ1F0cEdSSHlQNXVaWXYy?=
 =?utf-8?B?OGgvMGJwSGxndE9KUFliMDRjbDgrS0RiNTErYzlZR0dxdUZ1RHlMbWxWQW9k?=
 =?utf-8?B?N2txbVdlMUh6SjgyYjZNUDNWNVM5a3k2L3IzOEhuNUdyamxDOUsxeDJnTUFZ?=
 =?utf-8?B?VkVQM21lOWtyTHRXVFJyVWJQblhUMzQ0ZDFOWS9Ic1hqR3FGSkgvRDBsdS9x?=
 =?utf-8?B?bHlib0ZIRXEyY0pqSnJRdkF2cWZ1RVU3SWVrUGdUZ01Ra3JsTTJUMjJnVC92?=
 =?utf-8?B?NHczUS9vNkV4VFlrS1QzL2kyOWpxcDhHbEx0TFlIVGt5T0JYSnZVbDgwbWE5?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c8f901-7e64-43e7-d554-08de1313b394
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:40:47.3586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94Kawiotkjus9geAHKlmSSTXd5UFeQk0/uRb8Pqozs8e6ncx2c5Apy35CHorAm4XuuJApWWKk0NwioAU430NnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF5AD378C3B
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

On Fri, Oct 24, 2025 at 07:55:32PM +0530, K V P, Satyanarayana wrote:
> 
> 
> On 24-10-2025 19:35, Ville Syrjälä wrote:
> > On Fri, Oct 24, 2025 at 09:57:15AM -0400, Rodrigo Vivi wrote:
> > > On Fri, Oct 24, 2025 at 07:05:24PM +0530, Satyanarayana K V P wrote:
> > > 
> > > Hi Satya,
> > > 
> > > First of all, thank you for the updates.
> > > 
> > > Second, the subject is way to big.
> > > 
> > > This should be enough and under 75 cols:
> > > 
> > > drm/xe: Use AVX instructions to prevent partial writes during VF pause
> > > 
> > > more below:
> > > 
> > > > VF KMD registers two specialized contexts with the GUC for migration
> > > > operations. Save context contain copy commands and PTEs to transfer CCS
> > > > metadata from GPU pools to system memory and restore context contain copy
> > > > commands and PTEs to transfer CCS metadata from system memory back to CCS
> > > > pools. GUC submits these contexts to HW during VF migration.
> > > > 
> > > > Each context uses a large batch buffer allocated via sub-allocator,
> > > > pre-filled with MI_NOOPs and terminated with MI_BATCH_BUFFER_END. During
> > > > BO lifecycle management, segments are dynamically allocated from this
> > > > buffer and populated with PTEs and copy commands for active BOs, then reset
> > > > to MI_NOOPs when BOs are destroyed.
> > > > 
> > > > The CCS copy operation requires a 5-dword command sequence to be written
> > > > to the batch buffer. During VF migration save/restore operations, if the
> > > > vCPU gets preempted or halted while this command sequence is being
> > > > programmed, partial writes can occur. These partial writes create
> > > > incomplete GPU instructions in the batch buffer, which trigger page faults
> > > > when the GUC submits the batch buffer to hardware for CCS metadata
> > > > operations.
> > > 
> > > Perhaps we could summarize the thing here and move details to the comment
> > > near the assembly. The important part in the commit message is to have
> > > the 'why'. Some of the details of the commands like MI_NOOP fill and all
> > > could be in the comment near the ASM.
> > > 
> > > > 
> > > > Standard memory operations like memcpy() are preemptible, meaning the CPU
> > > > scheduler can interrupt execution midway through writing the command
> > > > sequence, leaving the batch buffer in an inconsistent state with partially
> > > > written GPU instructions.
> > > > 
> > > > Replace standard memory operations with x86 AVX instructions that provide
> > > > atomic, non-preemptible writes as AVX instructions cannot be preempted
> > > > during execution, ensuring complete command sequences are written
> > > > atomically to the batch buffer.
> > > > 
> > > > Expand EMIT_COPY_CCS_DW from 5 dwords to 8 dwords to align with 256-bit
> > > > VMOVDQU operations. Update emit_flush_invalidate() to use VMOVDQU
> > > > operating with 128-bit chunks. By ensuring GPU instruction headers
> > > > (3-dword and 5-dword sequences) are written atomically, we prevent partial
> > > > updates that could compromise migration stability.
> > > > 
> > > > This approach guarantees that batch buffer updates are completed entirely
> > > > or not at all, eliminating the page fault scenarios during VF migration
> > > > operations regardless of vCPU scheduling behavior.
> > > > 
> > > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > 
> > > > ---
> > > > V7 -> V8:
> > > > - Updated commit title and message.
> > > > 
> > > > V6 -> V7:
> > > > - Added description explaining why to use assembly instructions for
> > > > atomicity.
> > > > - Assert if DGFX tries to use memcpy_vmovdqu(). (Rodrigo)
> > > > - Include <asm/cpufeature.h> though checkpatch complains. With
> > > > <linux/cpufeature.h> KUnit is throwing errors.
> > > > 
> > > > V5 -> V6:
> > > > - Fixed review comments (Rodrigo)
> > > > 
> > > > V4 -> V5:
> > > > - Fixed review comments. (Matt B)
> > > > 
> > > > V3 -> V4:
> > > > - Fixed review comments. (Wajdeczko)
> > > > - Fix issues reported by patchworks.
> > > > 
> > > > V2 -> V3:
> > > > - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> > > > - Updated emit_flush_invalidate() to use vmovdqu instruction.
> > > > 
> > > > V1 -> V2:
> > > > - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
> > > >    (Auld, Matthew)
> > > > - Fix issues reported by patchworks.
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_migrate.c | 114 ++++++++++++++++++++++++++------
> > > >   1 file changed, 93 insertions(+), 21 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > > index 921c9c1ea41f..005dc26a0393 100644
> > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > @@ -5,6 +5,8 @@
> > > >   #include "xe_migrate.h"
> > > > +#include <asm/fpu/api.h>
> > > > +#include <asm/cpufeature.h>
> > > >   #include <linux/bitfield.h>
> > > >   #include <linux/sizes.h>
> > > > @@ -33,6 +35,7 @@
> > > >   #include "xe_res_cursor.h"
> > > >   #include "xe_sa.h"
> > > >   #include "xe_sched_job.h"
> > > > +#include "xe_sriov_vf_ccs.h"
> > > >   #include "xe_sync.h"
> > > >   #include "xe_trace_bo.h"
> > > >   #include "xe_validation.h"
> > > > @@ -657,18 +660,70 @@ static void emit_pte(struct xe_migrate *m,
> > > >   	}
> > > >   }
> > > > -#define EMIT_COPY_CCS_DW 5
> > > > +/*
> > > > + * VF KMD registers two special LRCs with the GuC to handle save/restore
> > > > + * operations for CCS metadata on IGPU. GUC executes these LRCAs during
> > > > + * VF state/restore operations.
> > > > + *
> > > > + * Each LRC contains a batch buffer pool that GuC submits to hardware during
> > > > + * VF state save/restore operations. Since these operations can occur
> > > > + * asynchronously at any time, we must ensure GPU instructions in the batch
> > > > + * buffer are written atomically to prevent corruption from incomplete writes.
> > > > + *
> > > > + * To guarantee atomic instruction writes, we use x86 SIMD instructions
> > > 
> > > Here you still mention 'atomic' since we already know this is not 'atomic'.
> > 
> > I still don't see how is this supposed to do anything useful without
> > atomic writes to memory.
> > 
> > If the GPU is executing the same memory we're writing then nothing
> > short of atomic memory writes is going to actually fix it. And even

The vCPUs are halted when the save buffer is executed—we only care about
whether GPU instructions are partially programmed. Storing complete GPU
instructions on a single CPU ensures consistency.

On the restore side, both the vCPU and GuC are active, but we have
barriers in place. Additionally, we should be able to guarantee that the
buffer isn’t modified until execution is complete (not handled in this
patch, but planned for a follow-up).

> > that would require careful alignment of things to guarantee that
> > each command is completely contained within one atomic write.
> > 
> The CPU and GPU operate on the same memory space but at different times
> during VF migration. The critical issue occurs during the batch buffer
> preparation phase when the vCPU is still active and writing GPU
> instructions, while the GPU will later execute these same instructions after
> the vCPU is paused.
> 
> During batch buffer updates, if the vCPU gets preempted while writing GPU
> instruction sequences (such as the 5-dword CCS copy command), it leaves
> partially written instructions in memory. When the GPU later executes the
> batch buffer after vCPU suspension, these incomplete instructions cause
> execution failures and page faults.
> 
> AVX instructions provide atomic write operations that cannot be interrupted

The word atomic is causing confusion. No, AVX instructions aren't
cache-atomic if unaligned, and it's unclear if they are even when
aligned. But as Satya mentioned, it's a single instruction. Halting the
vCPU guarantees that an instruction is either fully executed or not at
all—meaning it's either entirely visible in memory or not.

Caching isn't a concern here. The GuC and hardware parsing these
instructions are cache-coherent, and there are no ordering issues like
in interfaces that require cachelines to appear in a specific sequence.

Can we drop the word atomic? It seems to be confusing everyone.

Matt

> by the CPU scheduler. This ensures that GPU instruction sequences are
> written completely before any potential vCPU preemption occurs.
> 
> AVX instructions (VMOVDQU) guarantee that entire instruction sequences are
> written in a single, non-preemptible operation. The 5-dword CCS copy command
> is expanded to 8 dwords (padded with 3 MI_NOOPs) to meet AVX 256-bit
> alignment requirements. By the time the GPU executes the batch buffer (after
> vCPU pause), all instructions are guaranteed to be completely written.
> 
> Here we are ensuring that GPU instructions are fully formed before the GPU
> attempts to execute them during the migration process.
> 
> -Satya.>>
> > > Let a summarized explanation in the commit message and put more here.
> > > 
> > > I'm sorry for being picky here, but I want to ensure that the information
> > > around this code is clear so we don't keep having to explain this over
> > > and over in the future.
> > > 
> > > > + * (128-bit XMM and 256-bit YMM) within kernel_fpu_begin()/kernel_fpu_end()
> > > > + * sections. This prevents vCPU preemption during instruction generation,
> > > > + * ensuring complete GPU commands are written to the batch buffer.
> > > > + */
> > > > +
> > > > +static void memcpy_vmovdqu(struct xe_device *xe, void *dst, const void *src, u32 size)
> > > > +{
> > > > +	xe_assert(xe, !IS_DGFX(xe));
> > > > +	xe_assert(xe, IS_SRIOV_VF(xe));
> > > > +
> > > > +#ifdef CONFIG_X86
> > > > +	kernel_fpu_begin();
> > > > +	if (size == SZ_128) {
> > > > +		asm("vmovdqu (%0), %%xmm0\n"
> > > > +		    "vmovups %%xmm0,   (%1)\n"
> > > > +		    :: "r" (src), "r" (dst) : "memory");
> > > > +	} else if (size == SZ_256) {
> > > > +		asm("vmovdqu (%0), %%ymm0\n"
> > > > +		    "vmovups %%ymm0,   (%1)\n"
> > > > +		    :: "r" (src), "r" (dst) : "memory");
> > > > +	}
> > > > +	kernel_fpu_end();
> > > > +#endif
> > > > +}
> > > > +
> > > > +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
> > > > +{
> > > > +	u32 instr_size = size * BITS_PER_BYTE;
> > > > +
> > > > +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
> > > > +
> > > > +	if (IS_VF_CCS_READY(gt_to_xe(gt))) {
> > > > +		xe_gt_assert(gt, static_cpu_has(X86_FEATURE_AVX));
> > > > +		memcpy_vmovdqu(gt_to_xe(gt), dst, src, instr_size);
> > > > +	} else {
> > > > +		memcpy(dst, src, size);
> > > > +	}
> > > > +}
> > > > +
> > > > +#define EMIT_COPY_CCS_DW 8
> > > >   static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > >   			  u64 dst_ofs, bool dst_is_indirect,
> > > >   			  u64 src_ofs, bool src_is_indirect,
> > > >   			  u32 size)
> > > >   {
> > > > +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
> > > >   	struct xe_device *xe = gt_to_xe(gt);
> > > >   	u32 *cs = bb->cs + bb->len;
> > > >   	u32 num_ccs_blks;
> > > >   	u32 num_pages;
> > > >   	u32 ccs_copy_size;
> > > >   	u32 mocs;
> > > > +	u32 i = 0;
> > > >   	if (GRAPHICS_VERx100(xe) >= 2000) {
> > > >   		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > > > @@ -686,15 +741,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > >   		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
> > > >   	}
> > > > -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> > > > -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > > -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > > -		ccs_copy_size;
> > > > -	*cs++ = lower_32_bits(src_ofs);
> > > > -	*cs++ = upper_32_bits(src_ofs) | mocs;
> > > > -	*cs++ = lower_32_bits(dst_ofs);
> > > > -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> > > > +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> > > > +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > > +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > > +		  ccs_copy_size;
> > > > +	dw[i++] = lower_32_bits(src_ofs);
> > > > +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> > > > +	dw[i++] = lower_32_bits(dst_ofs);
> > > > +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
> > > > +	/*
> > > > +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > > +	 * save/restore while this sequence is being issued, partial writes may trigger
> > > > +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> > > > +	 * write the sequence atomically.
> > > > +	 */
> > > > +	emit_atomic(gt, cs, dw, sizeof(dw));
> > > > +	cs += EMIT_COPY_CCS_DW;
> > > >   	bb->len = cs - bb->cs;
> > > >   }
> > > > @@ -1061,18 +1124,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
> > > >   	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
> > > >   }
> > > > -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> > > > +/*
> > > > + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> > > > + * save/restore while this sequence is being issued, partial writes may
> > > > + * trigger page faults when saving iGPU CCS metadata. Use
> > > > + * emit_atomic() to write the sequence atomically.
> > > > + */
> > > > +#define EMIT_FLUSH_INVALIDATE_DW 4
> > > > +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
> > > >   {
> > > >   	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> > > > +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
> > > > +
> > > > +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > > +		      MI_FLUSH_IMM_DW | flags;
> > > > +	dw[j++] = lower_32_bits(addr);
> > > > +	dw[j++] = upper_32_bits(addr);
> > > > +	dw[j++] = MI_NOOP;
> > > > -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > > -		  MI_FLUSH_IMM_DW | flags;
> > > > -	dw[i++] = lower_32_bits(addr);
> > > > -	dw[i++] = upper_32_bits(addr);
> > > > -	dw[i++] = MI_NOOP;
> > > > -	dw[i++] = MI_NOOP;
> > > > +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
> > > > -	return i;
> > > > +	return i + j;
> > > >   }
> > > >   /**
> > > > @@ -1117,7 +1189,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > >   	/* Calculate Batch buffer size */
> > > >   	batch_size = 0;
> > > >   	while (size) {
> > > > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > >   		u64 ccs_ofs, ccs_size;
> > > >   		u32 ccs_pt;
> > > > @@ -1158,7 +1230,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > >   	 * sizes here again before copy command is emitted.
> > > >   	 */
> > > >   	while (size) {
> > > > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > >   		u32 flush_flags = 0;
> > > >   		u64 ccs_ofs, ccs_size;
> > > >   		u32 ccs_pt;
> > > > @@ -1181,11 +1253,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > >   		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> > > > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > >   		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> > > >   						  src_L0_ofs, dst_is_pltt,
> > > >   						  src_L0, ccs_ofs, true);
> > > > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > >   		size -= src_L0;
> > > >   	}
> > > > -- 
> > > > 2.51.0
> > > > 
> > 
> 
