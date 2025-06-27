Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14406C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 18:12:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5CF10E9E6;
	Fri, 27 Jun 2025 18:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EGN+w78e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988F310E9E6
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 18:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751047934; x=1782583934;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kU40tQ2/R5wPrf9zD7D872IP7C2r5dNIae5rYIxrtFE=;
 b=EGN+w78ea5dNtbgm+mpDsx0WcSLg+VPOlpoCKYv/ef1vtpaW7twYNY52
 dMNcT+NoUMnfxSXI4tokxsVLZQRt6BZptxJcrkIh2xUWEm8DOeFiJlskS
 0976COKCJw78+iIBabJVphLF8XWyt6ut18RmsfGu4sfdIZWiLhV1q0S+F
 WvyMqX+Cz/VXBwCYP/eLx8gb3prkNQuBWK5DgDBpzsNga/B76MbRzHnlI
 9spMDosevi6L/uYxoW7Il0MWkDmjQWWVloZ+HB4nVbP8J6nbWzA8sQctP
 DOUnLYLOmsj0cp2C3fzQtmuW/GRXnF7SA5+y1fBtfKLi5Q6qHxwP5W0aC w==;
X-CSE-ConnectionGUID: ZAwy1lECTuyKaRQrSm+6sA==
X-CSE-MsgGUID: ePi56AQVRKm0XRBtllWyCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="52597693"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="52597693"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 11:12:14 -0700
X-CSE-ConnectionGUID: m7p3VUqXRda33RtBMmdFqg==
X-CSE-MsgGUID: ca4jTzdRSmi2h3vgXwAksA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="152484588"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 11:12:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 11:12:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 11:12:13 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.78) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 11:12:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZxlUQElGaxpAGeItNJi36EvfLoZNf/ao1vVokqBdl6YQqQF3Nf2wqmKws1KexdD6e3FKzcuoJse8hJr4LoJwG/hRw7wW0tfEgi2gZmM/US5ke6VABKGbRXeeDNle4qW8DQMejEop4E5mcYjCYEbdAbozyEuusia+8QIePrtE7I/dq8bbytM9+huv7JjKB9w0yQkVpYF7nf+mk98HYw6x0c48UFoHJxQbGSIA0lDs6Xb5hswqAz3zEHx8eiM8UMfY3yGhtKrswqyrpF0HVYf5GP8NvPpkZ255yqHCTs7lBJ53Z5ikiH48XHPrd5y6LOS9JJZgGmNUoL3+nc5Bswh/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pmHKOYVUVQ/NMQwqYAvtZsTKS9vpQ5F8r8VE2tQmHs=;
 b=uEVD1Mn587ZyFwSVSCXRnq2jsd35fIYGnKBzG5CQl8AxXeOd/SCg7E6CdeB4zB3kHUmnL4RxfEbfnFYCoiv+hcr40wd2OT262eAvP9AzKiQkrfz1IbkASZcDnu2P0idlV2qq5LDC0l4+TpjxSGtZt216uzOlOtYjLP7SshDgm5yujtA4106KWesmw+hCo52wZjyJaohekrOpv5SkgkQCkoYEZMkl0y5hlOEwXIRYRRkhEj4fXRWp/eyiuTaPwiSt4UD6/WQP8xSeXIxl5YepPemLmPbV5K1lYXra2bJw46dTBneYtRT+z7ZF0uROMFkUfIgyFd1CC9L7Duykyx+lkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV1PR11MB8818.namprd11.prod.outlook.com (2603:10b6:408:2b5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Fri, 27 Jun
 2025 18:12:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 18:12:10 +0000
Date: Fri, 27 Jun 2025 11:13:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>
Subject: Re: [PATCH v4 02/20] drm/xe/uapi: Add madvise interface
Message-ID: <aF7fXjgdNs4DvK7A@lstrano-desk.jf.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-3-himal.prasad.ghimiray@intel.com>
 <aFjYdUYGIazU3XZZ@lstrano-desk.jf.intel.com>
 <644dbb1d98220f9e3c8044829fc7f95580c2eae1.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <644dbb1d98220f9e3c8044829fc7f95580c2eae1.camel@linux.intel.com>
X-ClientProxiedBy: MW4P221CA0017.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV1PR11MB8818:EE_
X-MS-Office365-Filtering-Correlation-Id: f536771c-78a0-41c5-f9fe-08ddb5a62282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUdBSnBTN3pjVGd0ZUdqcldmOGZmNWdSSWNTRi9idlZpVTBrNiszaFJwbTlo?=
 =?utf-8?B?anZZOUhmbFJmZndnL0I2T2RkMWxhdjRPVUtZNlpoWktDMms1WHJVNGk1dWVC?=
 =?utf-8?B?MjE4aENzL3d0OXM2WHlCTGx2WER4TS9zWHlNNEloeGV5Mk5zOUtDOGtaK2dQ?=
 =?utf-8?B?Z1p2Mi9IbVh5MzlpZnlkMU5vR2t2SUhmK29zU0VMR2htZHMzdUJua0hQR0k3?=
 =?utf-8?B?K05DNXpoOFBuRlkzcHZCVUY5ZURzeWRGY0JBaVJpMzFobXlmTnhWOUxRK0tp?=
 =?utf-8?B?TjB0dkpvMFgrRnN4TURQUmJxd3ZFTzBLeTQ3clppZ3ozSXBZQ3RScW1DalFp?=
 =?utf-8?B?Q0RveHAxcmY1dEQ5S2UrSDlSUTk0aG1uc29WR1lkN0s5VWxqM0FxaDI4RzBw?=
 =?utf-8?B?ejJ0bDcvclVCT0VSUVlEQVVCbmZuRmZrUGkwWnV4UWgwQUNab0NTQnlhSU5N?=
 =?utf-8?B?V3JVdytrT25BeWdnZlJXV3h5UXNyc0plTGxQbmlqWUZnc1l4cHhLRllzT1R4?=
 =?utf-8?B?L05ETHB6MGQ2SmRKc1JjM3Y3eVh1RGRIYVFrQWJYb2VMdGg4bEdvalhmeGRB?=
 =?utf-8?B?UFIyZm85bTFaaGJzZjdmQWlFT2pUT2hHSkkyZFA3aGFhV05XNUJHNVZqWkxK?=
 =?utf-8?B?OGRHWGFValFGQ1Qrd3k3ZzJ3U2c1SUFDZUVnRDNtbUN0TVY3c3hvd0lyOVpX?=
 =?utf-8?B?WjE3cWVONW50VjE1eEo0RVRMT2tQbVdnT2ZZVW9MaXczaXdMb25pS21BTjBN?=
 =?utf-8?B?K1VIQ2xISE1aYktOQzZ4eVBDQ3hYMndmeGlQWVZ2Q1JNUWc1dkMwWXlMUDh3?=
 =?utf-8?B?N3Y0UE9Wb1AvSWtHY2ZkTkpqL2pBenRyWlJIVldPYmNIRWNoRzJUdDl3dzVP?=
 =?utf-8?B?ZU9xTS94SXRlOE1YTmthQ3I2L3J0emVXdFgvNkFRM1F4YkJoaUV0djJwa2RK?=
 =?utf-8?B?eFVzbm1kVTlxbVF4TlpZWklwS3pEZWZISzdEVHlmNnBiN0dweTN5R2dDWm9a?=
 =?utf-8?B?WHhBMEc1S2tXQm14U0Nyb1Z1bk5jVXdha0NQQlF0Q0g4aUV4aGdJWE9SL2dw?=
 =?utf-8?B?R1IwamRCTExlbkxDOFpHTVJBNEJyNkF3WWhKaHBnaUhGSkFGa0FWcjRYTXZZ?=
 =?utf-8?B?OU42c29kSitTcTlqNXZhd1BOMFlySThaTEJwVjBPZmVpcWlEelBBMnVVZ2lL?=
 =?utf-8?B?dFcvTS8zVmFRTklFMkkzT0lOeEFXZlRSNkxOZ1BZVkRINTNKOExoY09mSTcz?=
 =?utf-8?B?ZXVuTlhUa0FWVGJkeE54dW9hMWV4bmZUQ1c2d0FFYXV0eUZuQlBMVXFGMUU1?=
 =?utf-8?B?TnBFNFMySk1JRmswSmJPdGtjaEVkOGtGeXdqVGtXeVJZRTNJZG0ydE9GR25h?=
 =?utf-8?B?bittVkdyVUZCZzd4MHRsVmN1b0o1SmRvTDZVdTJOUWhTNmJEVDJNN0VxWFpF?=
 =?utf-8?B?Wm1uelZLb0RkNDRnUVUzSFQwOHpweUdqK09UOVR1MnpBWFBZSkJWY1pZdzJn?=
 =?utf-8?B?c1IzejRLdzJNM3F5TXgyTlFMdWZGc09IU3g5YzJodEhkMHpad1RYdytwcTRa?=
 =?utf-8?B?clFXYTdReEJMcFpXdWlKZnJzUHlkK0RITGZtK3JybThvSzRZWkR5cTg3dHlE?=
 =?utf-8?B?VGZja0hmZjlBa0NmenNzaVBLRmJud2J4RUdqMW16UG9QUVZGaTRDNmoxSmdZ?=
 =?utf-8?B?Sllpam1xNlF2aUwrV2hqcEtMTzlJK25WNnN0cjNqUERtTlN0SjBoRlBCbFIw?=
 =?utf-8?B?S05zOGZMbFN0dE14cEhYY3lJc3dUakxvV25qWmtYSGZPRy9CK1JsejIyeU5j?=
 =?utf-8?B?Z0grZS9lemE4cFZDMGRGT0dJVkhFK0NxVVRFNFpRZWtDd2s3bnJPVnhSMTJU?=
 =?utf-8?B?UXhFK3BZWFAydXVBRWlsZXlFSWF2Z0daTTQzMEltdTJaTGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEpNMU9NT0Z0TTJCeUlaYkNWZzhWczAvaFdFWG1oWFFzb3dHaUc4cDBDVmFX?=
 =?utf-8?B?emFSMk5RamZiQ1BKTnlTeU5KTXBtTm1SUTJ3SnNGazBEbGJHcXNCbHQ3RjNr?=
 =?utf-8?B?QXQ0ZGpuVGk3ckRsSXdRSTB6T2ZRK1VJUjVFVy94K1BjMnpjS2RuY0JzZ0tv?=
 =?utf-8?B?T3J1NEwxbHNzck9ZQ2ZOS3p5VHNudlNqdTV4a01UMWJReEVxTlBDZDk2YlBw?=
 =?utf-8?B?ZDFveDBkNHdPQ1BkVFpSL2VldHVjcFlhbllNNVBSVjBnVnA1a1ZvanpMalNm?=
 =?utf-8?B?SHY2ZUM0dVRGRFg1NGVLQW5KSDlPcWhRK245QXRqNm1NOVlHQ2c1SXFlMCtR?=
 =?utf-8?B?cFBCVUxhNGhsbHNPNXVUVzhGSWZ1alFBTEpkaDhYUHFKNHB5V2FZR3g4dERX?=
 =?utf-8?B?SGh3Sml1SFo0eHlBd1RLd0E0SE9OalQ1QUFac3lCSTFrOXh2UEcrbTFFWWpn?=
 =?utf-8?B?KzlNZXRWYUc2SUhUa1N5eTNvbGNlaGZsdUl3U1RNMVRiZnhlNkNFK2R4U0FG?=
 =?utf-8?B?K2JmcmNzVzFGZDdPNGozK1ZtdHhiWW9GeFdBYzg0dmsxQy9tdXdaSklzNGZH?=
 =?utf-8?B?bjNVS015VzZHWmIwRnU5SUpyTEROV3RncDZ5clFJWDJVeUg4aWk5OVFJQnZD?=
 =?utf-8?B?STJzRTAyZ1lHR0c3VzdZK3p3UnJTcVh6N0kvY3JJNXd4QStnQjBkS0dVMWR5?=
 =?utf-8?B?VGpKUE0zcnNXaFdyaUNqZC8wbjVmVkZwbm5mWnd6TStNZURzMXpLVFRUMFQ3?=
 =?utf-8?B?RENLdFphaDJ3Z0NSaG5IL1dqeGI1QnUyTlpBckJEektmOTcyaUFuU2RuWlhi?=
 =?utf-8?B?L2lPVldoM3FVMm9sVzhvbkNWRGdnNDJvc3NRaGpucU9MejdQVm9RZ1p3ZHh4?=
 =?utf-8?B?aml3dUpIQWtJcGVEY24yTExGV2NHTE5xYkVVS3NvV25SbUphL1k5OFE1VDhv?=
 =?utf-8?B?K2dYR2pid3ZQZzQ1ZmpTWmJCTGZzbUptbzlFdkdRWkJsUFV0R3JHblZtQ0JW?=
 =?utf-8?B?bGQ5NEVlKzE3eEVOWms5bFZOOXNpeXdaNEVOOHBCUGUybEtyVmxBZFl4Mnpv?=
 =?utf-8?B?bDdnV0E3R1lkdnVVWDFOODBieEJacEpLa3hvcGdSK2MwREdTWkNoZTdIa3lx?=
 =?utf-8?B?VFVmenZZUWUxaU1tK0ZHUDdramVkck1YQlgxdHNxNHVvWTkyNStBZHNPalcz?=
 =?utf-8?B?UmNXMmlnSlVWeTlLUWVaQmlmcTFNREV5cXVEaGYzOTBFZVFSc0o5NDRsTHRi?=
 =?utf-8?B?bTRjWUUrdmdOK3dWZGxjdU42RXNWRU1ldE52Tkd6V280WnJwbFlXajBCS2lS?=
 =?utf-8?B?bTVieDBKR1V4SGlaM1Iwdy9qOXpTM0VQbWtMbHk0TTF5M3JrRWZkSFZvZjhU?=
 =?utf-8?B?Ui9TTXQzbDJOUG5SNStORlBPdDZTd1h5eHg0Ly9saG9qVUN1WVk4dkFFNXNE?=
 =?utf-8?B?WW5KbkRIMTNVVlhQQnYzTlF6REp1RnVmd3NmWjd0MW1MRGNyOXAzelE3eW44?=
 =?utf-8?B?T0xBMlptYUh1eUlVOWNneGdqL2ltTCtOcHpXQlN5QTJabkc4dWkwbTFveVZz?=
 =?utf-8?B?Z3owQ2F1dDVlRDRHMElTVnV3R1M2L1YrSCtQbHU5dnErVjFTQjZER2dKbG5u?=
 =?utf-8?B?MGpuUGJUUXVycXVoK0xkUDRQLzNDTG1DOVVCS3B5QS9GY2xDV0ZsZW51QXpT?=
 =?utf-8?B?Y1RibWxhdVY1RWRQeGV1Nmp6dUk0OW9IL1Z3WFBwa2kwN1hCYUlCMXBib01v?=
 =?utf-8?B?Vmt6N2U2dzlsUzE4cHNSSGY3WTEzSUZycUIyOTNDMExtUVRBaCtKQ3NrSDh2?=
 =?utf-8?B?SmVoSERJQ1doSk1wa3pOeitEbFJ6anlwRTg4ek5QWW9yUDBENjd4M3ZjWDl2?=
 =?utf-8?B?bVVrVmEwZEd1eEQwUlk0djM3bGlhbVY2ZWhtNVB6bnFENXhmMVBNcmF0ZkVu?=
 =?utf-8?B?RjNyZWxuaEg4OVBZS2pkME5rZThBVVh2YzdMQlI2ZzZpNlptclgxZ0RzeXNO?=
 =?utf-8?B?MnFGa2s4T3MwVThKMW91aTZibnNWejBiL1RzSzZJRGlZZ2Y4UFFCNnliaG5U?=
 =?utf-8?B?Q0d3K3E4emxDQmg2MUFpQXJZSk1KOWhDdGxrdC8zVTBpVHJWN2U3RWNLNnhK?=
 =?utf-8?B?Y2hCSG5uTnZ5VEd6SExhemgvc3RWdlRzcjBpMlJ4aC94aElPY0srRm94TjZW?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f536771c-78a0-41c5-f9fe-08ddb5a62282
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 18:12:10.7168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDPJRUK44nfWcj7/ckV/c6CozYoOIhFB1fRg2fW655MQ2qZ5o6zLnZr6UD4MbFrEDaPAXsRRp/nmwBWrEXpYJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8818
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

On Fri, Jun 27, 2025 at 04:29:02PM +0200, Thomas Hellström wrote:
> On Sun, 2025-06-22 at 21:30 -0700, Matthew Brost wrote:
> > On Fri, Jun 13, 2025 at 06:25:40PM +0530, Himal Prasad Ghimiray
> > wrote:
> > > This commit introduces a new madvise interface to support
> > > driver-specific ioctl operations. The madvise interface allows for
> > > more
> > > efficient memory management by providing hints to the driver about
> > > the
> > > expected memory usage and pte update policy for gpuvma.
> > > 
> > > v2 (Matthew/Thomas)
> > > - Drop num_ops support
> > > - Drop purgeable support
> > > - Add kernel-docs
> > > - IOWR/IOW
> > > 
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Himal Prasad Ghimiray
> > > <himal.prasad.ghimiray@intel.com>
> > > Acked-by: José Roberto de Souza <jose.souza@intel.com>
> > > ---
> > >  include/uapi/drm/xe_drm.h | 118
> > > ++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 118 insertions(+)
> > > 
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index 6a702ba7817c..b5f8d11faaa8 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -81,6 +81,7 @@ extern "C" {
> > >   *  - &DRM_IOCTL_XE_EXEC
> > >   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
> > >   *  - &DRM_IOCTL_XE_OBSERVATION
> > > + *  - &DRM_IOCTL_XE_MADVISE
> > >   */
> > >  
> > >  /*
> > > @@ -102,6 +103,7 @@ extern "C" {
> > >  #define DRM_XE_EXEC			0x09
> > >  #define DRM_XE_WAIT_USER_FENCE		0x0a
> > >  #define DRM_XE_OBSERVATION		0x0b
> > > +#define DRM_XE_MADVISE			0x0c
> > >  
> > >  /* Must be kept compact -- no holes */
> > >  
> > > @@ -117,6 +119,7 @@ extern "C" {
> > >  #define
> > > DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
> > >  #define
> > > DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE,structdrm_xe_wait_user_fence)
> > >  #define
> > > DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION,structdrm_xe_observation_param)
> > > +#define
> > > DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, structdrm_xe_madvise)
> > >  
> > >  /**
> > >   * DOC: Xe IOCTL Extensions
> > > @@ -1970,6 +1973,121 @@ struct drm_xe_query_eu_stall {
> > >  	__u64 sampling_rates[];
> > >  };
> > >  
> > > +/**
> > > + * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
> > > + *
> > > + * This structure is used to set memory attributes for a virtual
> > > address range
> > > + * in a VM. The type of attribute is specified by @type, and the
> > > corresponding
> > > + * union member is used to provide additional parameters for
> > > @type.
> > > + *
> > > + * Supported attribute types:
> > > + * - DRM_XE_VMA_ATTR_PREFERRED_LOC: Set preferred memory location.
> > > + * - DRM_XE_VMA_ATTR_ATOMIC: Set atomic access policy.
> > > + * - DRM_XE_VMA_ATTR_PAT: Set page attribute table index.
> > > + *
> > > + * Example:
> > > + *
> > > + * .. code-block:: C
> > > + *
> > > + * struct drm_xe_madvise madvise = {
> > > + *          .vm_id = vm_id,
> > > + *          .start = 0x100000,
> > > + *          .range = 0x2000,
> > > + *          .type = DRM_XE_VMA_ATTR_ATOMIC,
> > > + *          .atomic_val = DRM_XE_VMA_ATOMIC_DEVICE,
> > > + *         };
> > > + *
> > > + * ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
> > > + *
> > > + */
> > > +struct drm_xe_madvise {
> > > +	/** @extensions: Pointer to the first extension struct, if
> > > any */
> > > +	__u64 extensions;
> > > +
> > > +	/** @start: start of the virtual address range */
> > > +	__u64 start;
> > > +
> > > +	/** @size: size of the virtual address range */
> > > +	__u64 range;
> > > +
> > > +	/** @vm_id: vm_id of the virtual range */
> > > +	__u32 vm_id;
> > > +
> > > +#define DRM_XE_VMA_ATTR_PREFERRED_LOC	0
> > > +#define DRM_XE_VMA_ATTR_ATOMIC		1
> > > +#define DRM_XE_VMA_ATTR_PAT		2
> > > +	/** @type: type of attribute */
> > > +	__u32 type;
> > > +
> > > +	union {
> > 
> > Nit: I'd make this union is same order as the defines (e.g.,
> > preferred location
> > first, atomic second, pat third).
> > 
> > > +		/**
> > > +		 * @atomic: Atomic access policy
> > > +		 *
> > > +		 * Used when @type == DRM_XE_VMA_ATTR_ATOMIC.
> > > +		 *
> > > +		 * Supported values for @atomic.val:
> > > +		 * - DRM_XE_VMA_ATOMIC_UNDEFINED: Undefined or
> > > default behaviour
> > > +		 *   Support both GPU and CPU atomic operations
> > > for system allocator
> > > +		 *   Support GPU atomic operations for normal(bo)
> > > allocator
> > > +		 * - DRM_XE_VMA_ATOMIC_DEVICE: Support GPU atomic
> > > operations
> > > +		 * - DRM_XE_VMA_ATOMIC_GLOBAL: Support both GPU
> > > and CPU atomic operations
> > > +		 * - DRM_XE_VMA_ATOMIC_CPU: Support CPU atomic
> > > +		 */
> > > +		struct {
> > > +#define DRM_XE_VMA_ATOMIC_UNDEFINED	0
> > > +#define DRM_XE_VMA_ATOMIC_DEVICE	1
> > > +#define DRM_XE_VMA_ATOMIC_GLOBAL	2
> > > +#define DRM_XE_VMA_ATOMIC_CPU		3
> > > +			/** @atomic.val: value of atomic operation
> > > */
> > > +			__u32 val;
> > > +
> > > +			/** @atomic.reserved: Reserved */
> > > +			__u32 reserved;
> > > +		} atomic;
> > > +
> > > +		/**
> > > +		 * @pat_index: Page attribute table index
> > > +		 *
> > > +		 * Used when @type == DRM_XE_VMA_ATTR_PAT.
> > > +		 */
> > > +		struct {
> > > +			/** @pat_index.val: PAT index value */
> > > +			__u32 val;
> > > +
> > > +			/** @pat_index.reserved: Reserved */
> > > +			__u32 reserved;
> > > +		} pat_index;
> > > +
> > > +		/**
> > > +		 * @preferred_mem_loc: preferred memory location
> > > +		 *
> > > +		 * Used when @type ==
> > > DRM_XE_VMA_ATTR_PREFERRED_LOC
> > > +		 *
> > > +		 * Supported values for
> > > @preferred_mem_loc.devmem_fd:
> > > +		 * - DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE: set vram
> > > of faulting tile as preferred loc
> > > +		 * - DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM: set smem
> > > as preferred loc
> > > +		 *
> > > +		 * Supported values for
> > > @preferred_mem_loc.migration_policy:
> > > +		 * - DRM_XE_MIGRATE_ALL_PAGES
> > > +		 * - DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES
> > > +		 */
> > > +		struct {
> > > +#define DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE	0
> > > +#define DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM	-1
> > > +			/** @preferred_mem_loc.devmem_fd: fd for
> > > preferred loc */
> > > +			__u32 devmem_fd;
> > > +
> > > +#define DRM_XE_MIGRATE_ALL_PAGES		0
> > > +#define DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES	1
> > 
> > I'd double check with Thomas / maintainers if they want this
> > (migration_policy)
> > to be included in this version as still more or less unused in this
> > series.
> > 
> > > +			/** @preferred_mem_loc.migration_policy:
> > > Page migration policy */
> > > +			__u32 migration_policy;
> > 
> > Could we future proof a little, maybe migration_policy is a __u16 (or
> > __u8?) and
> > stick a reserved __u16 in here?
> > 
> > Matt
> 
> Yeah, I think we need to have a strategy for extensions here. Perhaps
> we could add new madvise types by extending the union and add
> additional types, but then I think we need to expand the union size to
> accomodate reasonable future additions.
> 

I agree that adding some extra bits in the member for the union is a
reasonable idea. Maybe add an extra __u64 to each union member as well.

> Additions could also be made using extensions, so that if a suitable
> extension is present, the union is never used?
> 

Implementing this purely as extensions could work too.

That said, these two ideas are not mutually exclusive. I’d suggest
starting by adding some extra bits to the union, and if we later back
ourselves into a corner where there aren’t enough bits for a future
property, we can introduce an extension for that property if needed.

Matt

> /Thomas
> 
> 
> 
> > 
> > > +		} preferred_mem_loc;
> > > +	};
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > >  #if defined(__cplusplus)
> > >  }
> > >  #endif
> > > -- 
> > > 2.34.1
> > > 
> 
