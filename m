Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8E8C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 16:30:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430E810E417;
	Tue, 21 May 2024 16:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BSGq91Tr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2ACF10E417
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 16:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716309001; x=1747845001;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4FQWQZNilj+9SB0jnaBWlQNAn0QCS0A8OCSELnHE6xQ=;
 b=BSGq91TrD0bTr1aYZ5j2Puqskf+uy28WVFOGAFWGnx+bcRSpLAuFa94q
 lYLiDq5/2Wglwtjmb8iMIzHjwn6sT5RkjdsYdGiT5G5QkGxKQMpeWGuX8
 cYwPV6fQzDDzGR1a4DvGETAh58wwjKIpNDjCTU3ChYFMkYrVgxtiq6MON
 anllBOEnHYu9s+cVt2Gs3MkbaiXfJ1s+NfYemiWKMTvmkEXwEtHzDk/gD
 G8XXnxjN9uGW0dFUkPJYGkrXVyqhe7IWC8vbNmgFFPLBDIoSn7QUYE62D
 ReNSPhuaYYtnYEfjHEO+k9XNJcz12p/MI20ZloBvcZNIeEZZ+iEyxLVVZ Q==;
X-CSE-ConnectionGUID: ELbH9UoyQeaKY/YEyX0wUQ==
X-CSE-MsgGUID: WeNhAU6/RbaEcUWZpk3UbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12633497"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="12633497"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 09:30:00 -0700
X-CSE-ConnectionGUID: yMwdXNKcQ/OkN4YCduYVQA==
X-CSE-MsgGUID: Af4TEsa2S9S+yrltxhU0DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="32957116"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 09:30:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 09:29:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 09:29:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 09:29:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 09:29:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbgyEGrfQiURl9gv79iuOELMgypx3IU9Ed9Mxcy+tfcjf8aY1Fndqq5tOSJbzgw0+TQC5Am6vEyujmjpoyk/uuEad0N/oa9kFmjEXezxOXj7yQvuz+NRYBBG7CaskLJuQH6sRlK+67aK2GD4eSg/Y1OzBT67eQwIlPobLZeL2dLsHcybY+nzJ3i2e//ta/ztOSeHEOW3dmBiBj2nrJYcY5vwxXdi5I+vL2cgkZpxvxHKuHRFyfDCIlX6jfhcAx2VR/nQ/lqJWQgOj6F5TZCepxpoEuf9FZhdDVxUUpObRJbSFMjIzVuW7ZCQnhZOKaDwBNcNABCcgWuEHvMFZabF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FQWQZNilj+9SB0jnaBWlQNAn0QCS0A8OCSELnHE6xQ=;
 b=ikEtHj34e3RqMk//Q9BQgyw/0eCvvBHnOBROFvi7fc1RaKgTIcb6ZEunMB33IHc5I9NYHKQtJhoZ9HmGQYdNKOW73a/B9kEFZkGzurwGTelxRzA9cvwXjGjbsERxUazZBxcNd121NQcBi738e62TbevBPsxJU3IckGUYfPOVMo78XsrwGIE+qXp6/rdo2fA7enTCltm4XReAuCBfGTaGGLDHxQhUN8s9e1jM3cHEd+YdtklOvOv3rNokn/RsvcQATrEQBbNNpGyN5lBPt+EJ2g/JI+qW8i/X6Z3i4QB2vZN+tjkfvrzHjwzsM6eHr7WviavUAjYRcKE3YMY7WPmyOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH8PR11MB7096.namprd11.prod.outlook.com (2603:10b6:510:214::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 16:29:51 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.7587.028; Tue, 21 May 2024
 16:29:51 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 00/17] Add OA functionality to Xe
Thread-Topic: [PATCH 00/17] Add OA functionality to Xe
Thread-Index: AQHadnkcIUwutN2VakWosatViFIW8bGcJwYAgAB1PYCABZE6AIAAAUuAgAAW/ICAAAV7AA==
Date: Tue, 21 May 2024 16:29:51 +0000
Message-ID: <8f86d8ea1d555e8261aab25bda0011ff96698522.camel@intel.com>
References: <20240315013518.2848986-1-ashutosh.dixit@intel.com>
 <438b276a653bf56fe1e0e131709d615dec86ae3e.camel@intel.com>
 <87frufuc96.wl-ashutosh.dixit@intel.com>
 <96d03111d07e8182e7ecb3c0ca1942c7fef22e6f.camel@intel.com>
 <595ea35d63cd92777b36f6ab87cd1f6483a4b38f.camel@intel.com>
 <851q5v2ljw.wl-ashutosh.dixit@intel.com>
In-Reply-To: <851q5v2ljw.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH8PR11MB7096:EE_
x-ms-office365-filtering-correlation-id: 6914f6e8-efca-4ea4-ac9b-08dc79b33d4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?TmYyQXovWmtWK3JVYXZZN0QxUzIxUFIzVFJkc0Z3bVNDV3k4c3pUMlpPSU96?=
 =?utf-8?B?eW0yZ05LcDI1TFh4WnhValF2V3pZZ1JsOU9uZmVxUzd5dDZ2N0FWY1lJU0cr?=
 =?utf-8?B?MEJybmlyK28yL0paR2oveUFrR2tBYXg2L1N4N1VGa0JWNlFCMm1RNWxqQmEv?=
 =?utf-8?B?MFJGWkVHaDYzeEdEQjNjREw0SS9GNi9xSEJsclpTcC9aSGZWNnZlbkFnekdV?=
 =?utf-8?B?cDlJakcvdGdva0x2Qk8vUU5ud0pPc3lHR0x1WmpCbG9mcFBhcjh5U29PYUJ2?=
 =?utf-8?B?TlY3aE04d2RBbGVvT3VLQytvZ3d6OVExdFhMeVhmRVNrVFFiZTBIVklKcWU3?=
 =?utf-8?B?c3hoVGJVOElnNFhvZ01OR1JscFo3aUx3MUtMeEtucExxakdxcXFac05vNUI3?=
 =?utf-8?B?REVRWGJncVNNcTdsYTJrelB6SmlUS2hlT01QTFNKcTErZi9SZDZSdEtORG5t?=
 =?utf-8?B?K0RLdVkzM21PSEk2UnVrTzFFVXN4eXdZamVNQjNab3NTbnJPNUk3b3l3cEpW?=
 =?utf-8?B?Rk4xVkY5YStCcW04YmFzZldBQS9GR01VQmhSWjg2U09ZcmdLdy83bEV1ODd2?=
 =?utf-8?B?aEVzOU44aWdQb0NBRi9tK2tuMHY3NGNML09BMERLV1RGMnMxak4zZXNkNUJo?=
 =?utf-8?B?WS9GRmphT1k4cUs4U2lCWWZ6MFJ4K2wyTHV5VWJqQWFyWUsyMTByOFlGWjV0?=
 =?utf-8?B?RDZFRkQwaU0vcVl1aHhBZ3hOTmlmZ2R2UTNLb2JMV2VUUHhHU1c5QkFIVlNy?=
 =?utf-8?B?RFBDZjNvQ3REYTFGOCtIUk5Vb01NVkJxWGd6TW9CZ1o5RzZrbXFYMXpuUS9Q?=
 =?utf-8?B?c1N4ZytPczVldHFyeFhqYytYNUNpS0o5ZHIremI1TzFMa1ZCQ1ZWdjgyVTd2?=
 =?utf-8?B?RWsvQWNMUmZ0NjFVNkJxR1NaWndUcUtQNURUUXBqaXZnaExNSURVaUVkRWpN?=
 =?utf-8?B?UEp5SmdYdk1ZZlJyaGNESFJ3QVVtRzc3VFNoUFJlenl6czh3dWVSOXc0OEwr?=
 =?utf-8?B?YnROdHp3ckF4WlIzM1p6dWExN0lUeHBRUDZNNFBIdmc1UTBPQzJWSGFqTUVw?=
 =?utf-8?B?dCtmQm9oNHl0UHc2Q0pqRnNUdUJwQkJzd0U0cjI3TlF3cnpucytMNkNQcmFq?=
 =?utf-8?B?MTM3STZ2OVpwQlNKTXpRQzBzZTE5dVJnOGNBZ2gvNkwvMDNzbmNuS2YrMC9T?=
 =?utf-8?B?eEFrUnlDdFlpSlplYzdUM1Z2SE81M0NEdXhoYlJJOElBV3FuNndHeE1Bdy9E?=
 =?utf-8?B?Q2tGQmNUSktwcE5zTmZmYmN1VmRNcGxPWU8ycWhRNDk2MDlwK1RlRnpZWlha?=
 =?utf-8?B?VThnV3c5eVNmRVovUm5kNk53Y2lXbEVlUUk5N2NwMU51Y0dRNEZLWi9yd3hP?=
 =?utf-8?B?Q2ZRR0RiQzdUM2ppNXc3T3V6bmN4R2Y2bXpRVXk4alVIN3A0RllaNERLeENX?=
 =?utf-8?B?ZVRIRHR3RkcrNEJkdFZZZnNDa1hhN2dsckRLOXdoc1FTZ2Jwa0tHbjQ2Vm1h?=
 =?utf-8?B?RUVQdUpudkw5Z1RnaC9zWDI0eWZjT0RDMlJ5ejV5TEpaYjJBNksyUmVZRWsz?=
 =?utf-8?B?cWd0Y2FhVEdGWDViVzRqVllxNldNejNHczVaSlVnS1lqbG02SXVBUUp4NGF6?=
 =?utf-8?B?b21BQVBlZDBuTDNFd3g2cjBOWTZqRzVRcFM1SVFGcWlhS0g4T01mUC84V3Fo?=
 =?utf-8?B?ZGZrTHUwa1lrbERwWm5TcGZwYUYxUzgvMlIyaXI0Z2QxS0FybE5HRDRzeU1v?=
 =?utf-8?B?UVhCMTVFTFRLYmJ6TXlxTFg2c0JwOWtKaHN1bGcrOC9tcVM1c1VjYmJHdkQ0?=
 =?utf-8?B?T1BLUzNxdkNCMmsrRDd6dz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkVOcGNGWVYxZm51VU0zZytwR2M3NEpHUGpGMVZRbnFBNmZsS3I4aHpTVVNI?=
 =?utf-8?B?L2NPS2xIdzlTTHoza2xZODd4M3p3Z1BVQUQvL1lKRjN2RnZ3TldIbTJyQ3Q1?=
 =?utf-8?B?ZkpDa0liRUFOdkRUMEtzSVExUVJ1OW53cnAza2NzZlhnQkpxNkdNQU44d3lF?=
 =?utf-8?B?dVpneDZ1UWMvR1ZzM1lBMTUxNHVXLzA1UmdpV0Z4OWlmSm94M041UmFhaGVm?=
 =?utf-8?B?MU1ka1JIUVBpdjBwK3hwSHUydFVFT1EyL1U5OTZ3eERpWXMvam9yUmduL0hE?=
 =?utf-8?B?OFFtYnlHYzUrS0xDZCs3bWxOYmoyYnIxZXBMSnJpNlpKT212MnZTdkE0dVlJ?=
 =?utf-8?B?djlic1NLKzFyblFvVGR6NnMwSTFrU0trb1g3aStwclFScUxPMWZsT1ZQZ3pz?=
 =?utf-8?B?OG84cldYckttNXFxaWdBd2dNUk1qa2tBMVBhRGtPcXNJWkFvUmM3SmgwbXZO?=
 =?utf-8?B?Q25BaGZDSGlLSTFmcTh0VU5jQjZpZXFpQnYrSWhzcTNKWVBkN3ArbkpiMUF6?=
 =?utf-8?B?dTBEUWpXQzYrRXVia1BYM2RlbXFVU0RSRjFEZkpLMUZrWEVMaEQ5bm0wSEJZ?=
 =?utf-8?B?YW5YY0VkWUtTSFh6cGVLeFMxd2xVd1dZeGRweWNmRnY1U1Y1RU5kWjJpTXVF?=
 =?utf-8?B?bmNQS0JlYS9LSkZxTnVFYmtjb0lVbVpaQVNjS3prQkFBQVQyazQ2NVc3bWRI?=
 =?utf-8?B?QU9yQkdsRzF3YVpTNTI1SGtpN1c4OUc2Nm4xSDRYTCswNVpHSXVISG9MWnlM?=
 =?utf-8?B?RTU3SHE3SXQ3czB6Wnl1SlE3Q2V4elpmaFhFVXVZSVVnYyszY3JvVDRHRmZG?=
 =?utf-8?B?S2tCRERUM0FwVXBmanYxOE9VbDZtVnNEUXVVMko5eldhNDB0a2RxM09maXQ2?=
 =?utf-8?B?RVZ6aVB2dkljekZZTGJvVmwxV1NsV2liZFJDOG5GNDd5ZGMzZ1QxNFI2RzhP?=
 =?utf-8?B?dXhObWxqM3duMnFocGJ1aFduVlp6NUQ3VDVXMDlaVVBESjdrUTM0S2NURk9L?=
 =?utf-8?B?elJIS3d4VTBpVFYvUUtycVRPZElPZjBIZkhwNjQ0MTdRdDJacTBSR1pZV0Iz?=
 =?utf-8?B?YlJUZTBvdk1ZMi9HUTBsdjRuUTdlejB6YnBmU3JxcXZOQzZsdU9pQ1NuWk1M?=
 =?utf-8?B?OW4zTUdwU0dVdkJ6bGhwUHk1T0J0N1lLKzB6eTdHRnNsQlRaL3dBYml2RTJS?=
 =?utf-8?B?Qy91TG5uT0FsaE9CNWlTRFNheUtoMTVQbWVLTDRiQ0tVdFpFblp4ZUo0TUNn?=
 =?utf-8?B?N1I2TExrT0hadC9KUEs4N1IxOEg3TE5hTktxRXhnSEpwWE84STFYejAvaUd4?=
 =?utf-8?B?R0FFNEdHMmFWQndIQkJSVlg0R29mN3luL3FscmVOS0ZTMUNCNExNZVdtSHI4?=
 =?utf-8?B?NFJWYnozSDNGdFcyWHhJakpveGc0MW9YVVhPRVBKaGZpd1h5WDFiS1VrMk9p?=
 =?utf-8?B?eVp0L1ZWRS9JYWZIYVM2NnJtK3hDMEF4RGVBRGg2WFNaQmlWWDYwY2ZCSFo5?=
 =?utf-8?B?NDJDUmpVaUhhMDlSdTVlbDdXaFEzL1lyVGF0OS9ha1dsWENNOWVFTGVGUmxC?=
 =?utf-8?B?MEJ5RVROMmV6MVMva0tyOHYrb0F6RDNDWVd2N2FJTTk1UjJhMVhNWXd6VVd0?=
 =?utf-8?B?bWlCZitBL3drNWcxTFBVaE5BUjZWbTM5NXY4WlJYNzRHSzE0S2JiZVVQZUxZ?=
 =?utf-8?B?bVhwOVNwSmhMYnZ5UFl0UWs5My91ZVFUQUJRMHpMU2tGV3ZEN0ZXQjNMdHU2?=
 =?utf-8?B?aVZLa2xNRVZWcUxzeGxsMlFYeW5IZCttK2lCNmFYTjRnVGU1TEY3TDlyQ3Vu?=
 =?utf-8?B?aE1RK29HR2hnd1JmbHpwNmNVWWxFMFJwOXRMKzcrS0NUM3VwUGtvN2VYWWY2?=
 =?utf-8?B?ZWhIMlFWU0FXQTZzK0pUNFNjekxEbittN1pwUnhOZ09XazBVdk5reE1rT2x6?=
 =?utf-8?B?eXliaUttclI0K0xvQ3ludFJ0Ynp6YWJRMk8wVHJsOE5vVFFtTTVjNnBzYlNW?=
 =?utf-8?B?MnF3Y3c1cG14SVlqMjhmMDNva2xZS0Z6SXNXVHJsd3NrK2RJUGpTaVVCM0pX?=
 =?utf-8?B?MWFWaDFvUkY2Q3JEOWVaZUx4V0UvMlJxQUFLOWpza3BPdVpDQk1SSFN1TWN0?=
 =?utf-8?B?MThSeVpVdWlaQkcrbllKSHY3cjdyVFRjcDZOWHh6VFVNZWc5V1J1dUFCbmla?=
 =?utf-8?B?Rmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <19CDDDFDBFF00B49AB3129C4B3EED493@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6914f6e8-efca-4ea4-ac9b-08dc79b33d4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 16:29:51.3689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vOLYUPEbsFmZRE90bq2UqN+se9a4Cv+kF0SsKbLKHb53B5wzmmBhOvQOhjR8FNF/ZOtscV/P/EE//od11XywGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7096
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

T24gVHVlLCAyMDI0LTA1LTIxIGF0IDA5OjEwIC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIFR1ZSwgMjEgTWF5IDIwMjQgMDc6NDc6NTggLTA3MDAsIFNvdXphLCBKb3NlIHdyb3Rl
Og0KPiANCj4gSGkgSm9zZSwNCj4gDQo+ID4gPiBPdGhlciBhc2ssIGNhbiB5b3UgcmVtb3ZlIHRo
aXMgJ0ZhaWxlZCB0byByZW1vdmUgdW5rbm93biBPQSBjb25maWcnDQo+ID4gPiBkZWJ1ZyBtZXNz
YWdlIGZyb20geGVfb2FfcmVtb3ZlX2NvbmZpZ19pb2N0bCgpPw0KPiA+IA0KPiA+IE1pc3NlZCAn
SW5zdWZmaWNpZW50IHByaXZpbGVnZXMgdG8gcmVtb3ZlIHhlIE9BIGNvbmZpZycsIHRoYXQgbmVl
ZCB0byBiZQ0KPiA+IHJlbW92ZWQgdG9vIGZyb20geGVfb2FfcmVtb3ZlX2NvbmZpZ19pb2N0bCgp
Lg0KPiA+IA0KPiA+ID4gTWVzYSB3aWxsIGJlIHVzaW5nIERSTV9YRV9QRVJGX09QX1JFTU9WRV9D
T05GSUcgd2l0aCBjb25maWcgaWQgc2V0IHRvDQo+ID4gPiBVSU5UNjRfTUFYIHRvIGRldGVjdCBp
ZiBYZSBLTUQgc3VwcG9ydHMgT0EgY291bnRlcnMgYW5kIGlmIGFwcGxpY2F0aW9uDQo+ID4gPiBo
YXMgZW5vdWdoIHBlcm1pc3Npb25zIHRvIHVzZSBpdC4gIFNvIGl0IGNhdXNlcyBkbWVzZyB0byBi
ZSBmbG9vZGVkDQo+ID4gPiB3aXRoICd4ZSAwMDAwOjAwOjAyLjA6IFtkcm06eGVfb2FfcmVtb3Zl
X2NvbmZpZ19pb2N0bCBbeGVdXSBGYWlsZWQgdG8NCj4gPiA+IHJlbW92ZSB1bmtub3duIE9BIGNv
bmZpZycgbWVzc2FnZXMgd2hlbiBydW5uaW5nIHRlc3RzIHN1aXRlcy4NCj4gPiA+IA0KPiA+ID4g
T3IgZG8geW91IGhhdmUgb3RoZXIgc3VnZ2VzdGlvbiBvZiB1QVBJIHRoYXQgSSBjYW4gdXNlLg0K
PiANCj4gT0ssIHNvIHlvdSBhcmUgcmVseWluZyBvbiBFTk9ERVYgYW5kIEVBQ0NFUyBlcnJubydz
IGZyb20NCj4gRFJNX1hFX1BFUkZfT1BfUkVNT1ZFX0NPTkZJRyB0byBmaW5kIG91dCAoYSkgaWYg
T0EgaXMgcHJlc2VudCBhbmQgKGIpIGlmDQo+IHlvdSBuZWVkIHRvIGJlIHJvb3QgKGFjdHVhbGx5
IENBUF9QRVJGTU9OIG9yIENBUF9TWVNfQURNSU4pLg0KDQp5ZXANCg0KPiANCj4gVGhpcyBsb2dp
YyBpbiBYZSBzaG91bGQgYmUgY2xvc2UgdG8gd2hhdCB3ZSBoYXZlIGluIGk5MTU/IFdoYXQgZG9l
cyBNZXNhIGRvDQo+IGZvciBpOTE1LCBvciB3aGF0IGRvZXNuJ3Qgd29yayBpbiBYZT8NCj4gDQo+
IEhlcmUgYXJlIHNvbWUgcG9pbnRlcnM6DQo+IA0KPiAqIFlvdSBjYW4gZXhlY3V0ZSBEUk1fWEVf
REVWSUNFX1FVRVJZX09BX1VOSVRTIHRvIHNlZSBpZiBPQSBpcyBwcmVzZW50DQo+IA0KPiAqIEFk
ZC9yZW1vdmUgT0EgY29uZmlncyBhbmQgdXNpbmcgdGhlIGdsb2JhbCBPQUcgYnVmZmVyICh0aW1l
IGJhc2VkDQo+ICAgc2FtcGxpbmcgb3IgRFJNX1hFX09BX1BST1BFUlRZX1NBTVBMRV9PQSBzZXQp
IGFyZSBwcml2aWxpZ2VkIG9wZXJhdGlvbnMNCj4gICAobmVlZCByb290KS4gT3BlcmF0aW9ucyB3
aGljaCBvbmx5IG5lZWQgT0FSL09BQyAoT0EgcXVlcmllcywgd2l0aG91dA0KPiAgIERSTV9YRV9P
QV9QUk9QRVJUWV9TQU1QTEVfT0EpIGNhbiBiZSBleGVjdXRlZCBieSBub24tcm9vdC4NCj4gDQo+
ICogSWYgIi9wcm9jL3N5cy9kZXYveGUvcGVyZl9zdHJlYW1fcGFyYW5vaWQiIGlzIDAsIGFsbCBv
cGVyYXRpb25zIGNhbiBiZQ0KPiAgIGV4ZWN1dGVkIGJ5IG5vbi1yb290IHVzZXJzLiBPdGhlcndp
c2UsIGFzIEkgZGVzY3JpYmVkIGluIHRoZSBwcmV2aW91cw0KPiAgIHBvaW50Lg0KDQpJdCBpcyBw
b3NzaWJsZSB0aGF0IHByb2Nlc3Mgbm90IHN0YXJ0ZWQgYnkgcm9vdCBoYXMgQ0FQX1BFUkZNT046
DQoNCiJVbnByaXZpbGVnZWQgcHJvY2Vzc2VzIHdpdGggZW5hYmxlZCBDQVBfUEVSRk1PTiBjYXBh
YmlsaXR5IGFyZSB0cmVhdGVkDQphcyBwcml2aWxlZ2VkIHByb2Nlc3NlcyB3aXRoIHJlc3BlY3Qg
dG8gcGVyZl9ldmVudHMgcGVyZm9ybWFuY2UNCm1vbml0b3JpbmcgYW5kIG9ic2VydmFiaWxpdHkg
b3BlcmF0aW9ucywuLi4iDQoNCkFuZCBmcm9tIHdoYXQgSSB1bmRlcnN0b29kIG9ubHkgcm9vdCBj
YW4gd3JpdGUgdG8gcGVyZl9zdHJlYW1fcGFyYW5vaWQsIHNvIEkgZG9uJ3Qgc2VlIGEgcG9pbnQg
aW4gaGF2aW5nIHRoaXMgZmlsZS4uLg0KDQo+IA0KPiBTbyBiYXNpY2FsbHkgSSB0aGluayB5b3Ug
anVzdCBuZWVkIHRvIGNoZWNrIGZvciB0aGUgcGVyZl9zdHJlYW1fcGFyYW5vaWQNCj4gZmlsZSBh
Ym92ZS4gSXQgd2lsbCB0ZWxsIHlvdSBib3RoIChhKSBpZiBPQSBpcyBwcmVzZW50IChiZWNhdXNl
IHdlIGFyZQ0KPiBnb2luZyB0byBtZXJnZSB0aGUgY29kZSB3aGljaCBjcmVhdGVzIHRoaXMgZmls
ZSB0b2dldGhlciB3aXRoIE9BKSBhbmQgKGIpDQo+IGlmIHlvdSBuZWVkIHRvIGJlIHJvb3QgZm9y
IHBhcnRpY3VsYXIgb3BlcmF0aW9ucy4NCj4gDQo+IFRoYW5rcy4NCj4gLS0NCj4gQXNodXRvc2gN
Cg0K
