Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDACCCF9F0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 18:39:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CCC10E642;
	Tue, 28 Oct 2025 18:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L9EFgQoE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A602F10E642
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 18:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761676755; x=1793212755;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Nc0/Y7toPuWi/0039VH2kYYs8FIfuteQ+iEZPPGkIVo=;
 b=L9EFgQoEA/cyyqF6S8kOJSpIQeOdUFrFgDQdKUTQ9WkO1QQZsASq+awg
 XAvcaZRSg1fPLklssBbHgOds7DqRa3VGT2MLaHT58rv6N6DelrNsyH4yr
 Iy6i8vsnXIOAvlBB7ANjEbq4HfmPowvxNOclYKZVaxO/lFvjQ/W0TltmC
 haoWNjjTHknA2ij+7mBcSeM54fB+jdVF4XB1CJVzsq19Oh/paQJ+mZ8z5
 BO3X5iMRttUyZMzazQ1E5Cx361PZe0gI7VxNbszDfdECaf7bfH8sTg4/w
 LcrJ1ZaWcOsxeTurvyoZ1eSQpIpdhwcZkaDLOoOMiAp9YAACngIAvYYJo Q==;
X-CSE-ConnectionGUID: /7vUfWOLQQmcmroJGj1x/Q==
X-CSE-MsgGUID: X0Hxt5SkRFC3C+sEsly3tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75235338"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="75235338"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 11:39:14 -0700
X-CSE-ConnectionGUID: MgdIWznnQiWSspg0YTMa6A==
X-CSE-MsgGUID: acYWsSi1TGug7fqhqB3YMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189477556"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 11:39:14 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 11:39:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 11:39:13 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 11:39:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7h7+/CGNjTp8Q35UsWV8uHIN45WLjgqNOj3eRSWKYu4YkR5YcSWvMnxSUqZG/Yyo+vFrxmLQqNUpxo35493BEAY16udND2KBrocf3IlUTFmVC6LPKR5wyfpPgx0QQg8JIPuut2he+CuhbMuL+GSGmLIXyQyTCdN6jUszk2EGF/Hjd72ifudhJFQte/d2wdSYl6q7qNv6rw9oeaZg0ZCGYNGGOLDm5O3+a8hkp2hU9eYbDmRmeAKxIcd/wGH8fNtCloeGIKy9FYgU9V5dCUszNi4Mo8q8vijZCBd8idECBY0eEKDnxG+NUagjcPEGm2cSHC/TNjut7QPDcelb7JwKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nc0/Y7toPuWi/0039VH2kYYs8FIfuteQ+iEZPPGkIVo=;
 b=sbue0LprGMpoY5/pW/SGOeYuVZ+xRzGk3wKM8lI+oUPVHw0z6s8STuhWUru6wkiTodMEo3O99MkLocIi/UekGuGSPBlwh8PxvddewtU24fD2bzqEJ4FGMu92NdqWPTCZ5HnPRFs1TvoPmia94/QUfUY2tQ6WbXhLavDmJT4Gti/u6C220kukEMiXUVzR6K94PnkzK+KDFkI3Slnm2f+jU1rmIgRKkk5xr6vihDrCO6FedXUNFo6dG0eSN0VjumwWGUhfQ9dpXY2MBOI38smv8DqqnRKLfnfmZZeBLwxFdsWrJTOsU/RKDOh74aifk/HwLIl6LTxi+5YGw2FO401eNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA2PR11MB5083.namprd11.prod.outlook.com (2603:10b6:806:11b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Tue, 28 Oct
 2025 18:39:11 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 18:39:11 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/xe_guc: Dynamically decide g2g buffer owner
Thread-Topic: [PATCH] drm/xe/xe_guc: Dynamically decide g2g buffer owner
Thread-Index: AQHcPf86nvI6BO9nyUe7LB3mniY/O7TWmHUAgAEWyoCAAEWJAIAAAi2w
Date: Tue, 28 Oct 2025 18:39:11 +0000
Message-ID: <CH0PR11MB5444B02E06EFA8485527DF49E5FDA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251015181159.92509-2-jonathan.cavitt@intel.com>
 <4c8b3cd7-13bc-4051-b58d-df5c68e45e2b@intel.com>
 <CH0PR11MB544495482BE4637C9A705605E5FDA@CH0PR11MB5444.namprd11.prod.outlook.com>
 <6609ff30-2c38-45dd-81ca-3ce852d5ff55@intel.com>
In-Reply-To: <6609ff30-2c38-45dd-81ca-3ce852d5ff55@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA2PR11MB5083:EE_
x-ms-office365-filtering-correlation-id: f9c69883-fe36-4da5-c26e-08de16514993
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?ZURDeDRJajRreGRQcHJENXdKWEtwNjNOcHdpMlNKNDlrNWEvVDVuMXdUN3lJ?=
 =?utf-8?B?TytUYTJGeENSK1BOSmZ4V1VVSzU1M3JuYzhWU091UlVkMXl1clQ1enBmNmQ5?=
 =?utf-8?B?aGpiUnhuQmpPcXNVdGszSndHL1VDOG40cERMRHNDM0xFYzdHNk8yUGJnL2dL?=
 =?utf-8?B?dkx0UzlWLzVjQ2IxRDFHT09LQUNNdXVINUZaZm02dGdLM1NjUGNCZXhVaXdX?=
 =?utf-8?B?MUdwYk5leHFuUE80VUZaVW80RVREd2RkTFVCWGQ1by9lRUxPYlVNOGFySGwr?=
 =?utf-8?B?WlJLSUJCRW9Za3RFcVZ4ZDFjT2VaL3p6ejFWVlI0Z3hJR2kxZzNsQUlESlVa?=
 =?utf-8?B?eTYvOGNYNG9jYTdWbGpTSlFsanEyVDFCaGhyMDRXRmVDdzJMbzBibzhGUDY2?=
 =?utf-8?B?Y0l3aGN4ZFZpSy9kdmZkWitjZUFzU2xwL0p4R2orWEpUSFFJbytaMS9RVUJR?=
 =?utf-8?B?UXh4elJRcHlMVnk0V2FHMEw3WkNKL2IwSXFZRS9qYVVjS1c3VXdidG1CQXNs?=
 =?utf-8?B?SlM4TEMrRFk0c0RxMUhjTXE5MElobE9BMjV3d3pqbUswaFN2L1lCZnhSSDIy?=
 =?utf-8?B?S2h6ODFBK0EvSTRXdmJ2dG4xa1Fqek9yQldQbTdrdmtlSERzWFFnWmJ4VElT?=
 =?utf-8?B?R0VPZE56K2dIeFVUWHlnZFJ0Sy9CTkZJeE9ubitKdmZncW1iaWswQ3Bqdklh?=
 =?utf-8?B?SE5NSldFcGhaa2ZmV29SRDNFMlR0d2NtcWJqY0VvUXdrVkgxSTlSNEhCeGc1?=
 =?utf-8?B?WUUzTGRBZ24xOGpjU1pjOE1seFVhbEZ2UWVMRFBSaE5OeWFLbU1IWTR4MWJh?=
 =?utf-8?B?WWZxUnRxQUVnalVMekpsTjJST1FIaER6RTl4cGpTdDkvNkxVcTJ3ZmxUKzNI?=
 =?utf-8?B?TGk3ZGZhdFp1NFZXMWNyZnFkZ2FuaGE0NHIra1VyV0VtM2dLdkVqOWFGRTlh?=
 =?utf-8?B?VzdiSWpBU0I0OTF0ajZCV2NGek9VYWJsSHphaFlUZVpMazBTL25JVVUvVnVu?=
 =?utf-8?B?Uk0yYSs1RXpmaHNLRXJZZkFJS0I5a040T1V6MlZ2VnVsSUwxTG1sMkJtb0dz?=
 =?utf-8?B?U3BVMFNsT2t5NDBtaWd6M0lEdEJjdXRzMnpMcnREb0VkdTFGMjBwNU9oakI3?=
 =?utf-8?B?eUFFK2RTQnJoTTBRYm1RRTRNSFd3S0pUZ1Q1WStGbU8wTE5DSUpNSFNiNjdK?=
 =?utf-8?B?NHN1UG1ZV0R2SkpINC9mSFFyTVBEdllIWlBqN2ZEalNzWjNVR0RzdGFZbm5U?=
 =?utf-8?B?VEdTMkFWWFRjK1RiaFRXSFphakRKNVRVdERGL3gveHpFRFJnZXRpL2lOTFF6?=
 =?utf-8?B?ejNSYmg5alZ3R3Q4ZHFhRnM1cGM0T09naTNnWk8zNkZINTZ4SFpaYW1QaDZa?=
 =?utf-8?B?SEFuakx4dTdnZTNHd2Y4QWlVcXZHRS8xTktLVXRWblVwOVpmWUN6SVhnVUFW?=
 =?utf-8?B?bE5SdEw2Ynhaa0VMNDI0ekg1anRVQWlBZHVWOW8vcXB4K2IralNVbmtpZmMx?=
 =?utf-8?B?czhLc09meFpUblFKZEo4eHYvK285TG4xVHNtZWdYZkpCMjBMbWpBVU9EWWtQ?=
 =?utf-8?B?TEZNNG9scVNLRXd4TW1QVHFBWE9uL1NxVklaRnpobTcwUEdub1Yyenc5b0Za?=
 =?utf-8?B?bDRoMkZHNS80ZE5aWVdxMHVSbzlrUWErYVp1YmNON2FOOUxCTFBvcGQxdThW?=
 =?utf-8?B?UEozQXl2aDIwd1JMeENxZUp5dzd0R2hCak9zVThkNGExNzJJYkRTMjFqMDlh?=
 =?utf-8?B?N09OY2VqbUpiWFBZYU9kR2tDT20xZ3BLQ082cXBJSGx0TU92eVkxKzRRSVVY?=
 =?utf-8?B?U3hmKzR6eWhwenBPamxYdzd6MmRYY2grZzVic3UveTVsVy94YzBMRXBlNjFV?=
 =?utf-8?B?Q2ZFQVhreHg5VmpzZCtlOHRXZVJFckI3NDRDdU1GUmM5T0ZZZzBhaDdPaWda?=
 =?utf-8?B?SlZWWmhPOFpDTXRYb2ZBaU8xZHA5SzhSWEtycVE2SWZFT25JVjd4QjF4K2Q3?=
 =?utf-8?B?Z1FQYzhHTE1kSWVhdk5iVDNLQXRkMEdzQTFwVjJHQVBUc0ZUQ2hTNjEweU9s?=
 =?utf-8?Q?/ev4Sh?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGZEeXN1VE9vaGRuTUdGaWhtZ2NheFU5KzhnS3VXYk9UUGNQZjBVNnBZN1oy?=
 =?utf-8?B?VmpiMzNtWXYwbzNUQkpkUTlsSHJMUHZFcTRNc3BySTJzUVprZGdZMmwwTXlk?=
 =?utf-8?B?QUdmOFk5L3BFZ21QNXJIZVdrVGpiMnZaYkpjcExCUlFud1U4VXlGZ3dCTjhH?=
 =?utf-8?B?OGVhWkxNU0FqZldMWWNMKzlzT0gwWUJCRFVYOVhxOTlQMFdxaFkvQVlkOGc0?=
 =?utf-8?B?Q1pIR1JFdFhxL0NlbWlvSEszdWwxcVFoSml6aDhTNTcydHd5VW9JUU5MQWM4?=
 =?utf-8?B?Q1FIbXpHN2Q1bzJkcVlSMFBkRTBaZlBURk9kdFRlQldSU0JxV3RUOFh0ZWlO?=
 =?utf-8?B?cFI5SmtpQkVzLytNd05vcDFaNVVzOERYVnhsUGhORFZCWVFJb0dNNjBLR1Vh?=
 =?utf-8?B?blhWaWQ0MmtRMVNmSkUzR3Fpamd5MFJwSHoyNzdONmozem9FRVU2RHJyOFA1?=
 =?utf-8?B?U3FLcG10YkRuSEc5MitDcTBIR0dnV3FnVmdhRFp3VnJFejE5ek4vSWFaLzEy?=
 =?utf-8?B?RTdLZGtET25LbGhyREtuaWptdHIxb1pVb3NNRzFtQlpNT1B3TzNaVGhLZHg5?=
 =?utf-8?B?cS85d0hCZytrVHlGWUFvZ0E3QkJOaHFzQlJURkRUUk95WERtTVdyZXpvZVpE?=
 =?utf-8?B?NS9CQ1JjNEpkODR1VUlrRHZpK0VyUzcwM1lzK01XVmV2VzNHdk00OTZZeDZo?=
 =?utf-8?B?dTJjbFVnZGdtZlRhSVB3aEE2TGR3a0xzbnl5QXZqcjh6eWVmWWdiSW5tdjFP?=
 =?utf-8?B?Y3dVMG9wSkFseVgydjI0K2RZWGxsTXlMN2dLaCtMTFdmZTJ5S2JYTXZTUkxQ?=
 =?utf-8?B?cWpWa01PKzB3aXNpb1Y0WldhS0krVStYVElWM0l6NVZSanlBYnlRdWRVVHlO?=
 =?utf-8?B?OVZ1ZUhLMURuVW5kWFdUZlpEcnhTekNNcUdZUS9YNFozUmFNSlJHWndqdW5k?=
 =?utf-8?B?d0oyWDlyYUE2Y01MbGxJMWtSRENtSkxxYkN5UjJVZ3cxcWJRQTJlaWViL0Rh?=
 =?utf-8?B?Nmh2NGw1eEp0R2dNSW5YU1ZrRnEzVlR2REdrN2dsWndIWFd6aWYwWGQ1OS90?=
 =?utf-8?B?dFNYbWJ6MUpUTXhCbDhEQnRTR2FPN3hhQ1NYRUUwZUduT1RDOVBJWkVVY2pN?=
 =?utf-8?B?Ynk0QmRGMVNKbTdIU25mYkc3Qmw2VGRqcnc2ZmdoZXpCdVNmN0hGZEE0UDd6?=
 =?utf-8?B?OGFCQk54Vy82SW9VdzR4SlY5dUgvb29tL3N0LytVZE1QbVZCY3NQTGlWQ1Qr?=
 =?utf-8?B?OVNlaWVvRmkyS0Y1bkRSdU4wWEJ6M2FCaysrUklET243OEQ2TnZ6RUNPenVj?=
 =?utf-8?B?aFhDVkNVTGVUZFIvY2VsWnRQQytyYWE0SmFLU0pQSnJhdU5HeEhMa3RXZUdu?=
 =?utf-8?B?UlMrbFVUSjQ3aXlzK3VVRWtmVzlkZVl0K1BrdjUzcnlSU2dnaXRJZm9pZzkw?=
 =?utf-8?B?U3FDeEFIYW1LNVpKL3RnaGxXWW9hWkZFK2o4WGUrRXBqcDI0SkZzRytNYyt4?=
 =?utf-8?B?a01vQnh2amFxZWFJL0xXUlljSlk1cDgzSWkyamQ0UGFnMDBZN1hhclZ0K050?=
 =?utf-8?B?NUVYaDNkVWwvanZFL1BYYkgrelB5cjJxcnBPYzVyanNxRU94L0pQa1YwTG5F?=
 =?utf-8?B?N2laNlExZHU3MnZKdko5cDdtd2dsVnBMZGo4dzB3dU1ab2tvb2dkUEw4ZWVu?=
 =?utf-8?B?UlBmWmNwOUQ1SnViQnJrY1RQUGV3MDBhbElPYTZzWEswT0k5aUhNdHVDdVRr?=
 =?utf-8?B?d3l2SW12V04xb29DVHE5UGJmbFUzOTVnYmtpS2J0M3dIMHhBb0dpM1BRcDFI?=
 =?utf-8?B?SitxSWNyTGVqYUVvN0xLZ0VNZHF5NHF1NlpGNDVjQmppRFJCTXkwbFpKcUZK?=
 =?utf-8?B?WERsYjJNMjZzU1ZZcEI1ZEtMMk93WUFacjlBcjg5dWtpUXZWVVN1eVB6RWFI?=
 =?utf-8?B?RS8xdFl3c2xqU0hUWExzcThjUHZvUEpTRmdEVG1HaElqVHVxeCsvRVE2Mlh1?=
 =?utf-8?B?NStxN0sra2ZoSFJZVURlVE1HUFF1L3pzWDFuVS9Tc3FmSlUxVDBhMmYyY0Z4?=
 =?utf-8?B?Ukxwak5ESktnZCthWUpDdkN2V0QrSXdEVExDZi9wTEdqa2xkTEltSUVvVDhQ?=
 =?utf-8?B?Ym5wdHBhaDd6VFQySnlNc2xpa1F1UDIxUUQ5UlI5cDE0bENzd2ZHOWR0ZnNh?=
 =?utf-8?Q?fkbgzsNU0hXeAeYHzA76dA4DJYUXnbYP5YOlKAxa38wI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c69883-fe36-4da5-c26e-08de16514993
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 18:39:11.5186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LSog2B0xSPoyFuP+DU3JVmJG1XVl9EODJXFYGyS69P9nt4dpd6rqTnWECMvGShLT/goUoNidegeHy+T5v9YeG40i8wDFEObqWEFPL1ZuP4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5083
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IENlcmFvbG8gU3B1cmlvLCBEYW5pZWxl
IDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPiANClNlbnQ6IFR1ZXNkYXksIE9jdG9i
ZXIgMjgsIDIwMjUgMTE6MjcgQU0NClRvOiBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZp
dHRAaW50ZWwuY29tPjsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogR3VwdGEs
IHNhdXJhYmhnIDxzYXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVv
QGludGVsLmNvbT47IFdhamRlY3prbywgTWljaGFsIDxNaWNoYWwuV2FqZGVjemtvQGludGVsLmNv
bT47IFJvcGVyLCBNYXR0aGV3IEQgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQpTdWJqZWN0
OiBSZTogW1BBVENIXSBkcm0veGUveGVfZ3VjOiBEeW5hbWljYWxseSBkZWNpZGUgZzJnIGJ1ZmZl
ciBvd25lcg0KPiANCj4gT24gMTAvMjgvMjAyNSA3OjM3IEFNLCBDYXZpdHQsIEpvbmF0aGFuIHdy
b3RlOg0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogQ2VyYW9sbyBT
cHVyaW8sIERhbmllbGUgPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+ID4gU2Vu
dDogTW9uZGF5LCBPY3RvYmVyIDI3LCAyMDI1IDI6NDAgUE0NCj4gPiBUbzogQ2F2aXR0LCBKb25h
dGhhbiA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiA+IENjOiBHdXB0YSwgc2F1cmFiaGcgPHNhdXJhYmhnLmd1cHRhQGludGVsLmNv
bT47IFp1bywgQWxleCA8YWxleC56dW9AaW50ZWwuY29tPjsgV2FqZGVjemtvLCBNaWNoYWwgPE1p
Y2hhbC5XYWpkZWN6a29AaW50ZWwuY29tPjsgUm9wZXIsIE1hdHRoZXcgRCA8bWF0dGhldy5kLnJv
cGVyQGludGVsLmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0veGUveGVfZ3VjOiBE
eW5hbWljYWxseSBkZWNpZGUgZzJnIGJ1ZmZlciBvd25lcg0KPiA+PiBPbiAxMC8xNS8yMDI1IDEx
OjEyIEFNLCBKb25hdGhhbiBDYXZpdHQgd3JvdGU6DQo+ID4+PiBPbiB0b2RheSdzIGRyaXZlciwg
eGVfZGV2aWNlX2dldF9ndCh4ZSwgMCk7IGNhbiBuZXZlciByZXR1cm4gTlVMTC4NCj4gPj4+IEhh
cmR3YXJlLXdpc2UgdGhlcmUncyBhbHdheXMgYXQgbGVhc3Qgb25lIHRpbGUsIGFuZCBldmVyeSB0
aWxpZSBoYXMgYQ0KPiA+Pj4gcHJpbWFyeSBHVC4gIElmIHNvbWV0aGluZyB3ZW50IHdyb25nIGR1
cmluZyBpbml0IG9mIHRpbGUgb3IgR1QgYW5kIHdlDQo+ID4+PiBjb3VsZG4ndCBjcmVhdGUvaW5p
dGlhbGl6ZSB0aGUgc3RydWN0dXJlcywgdGhlbiB3ZSBhbHJlYWR5IGFib3J0ZWQgdGhlDQo+ID4+
PiBkZXZpY2UgcHJvYmUgaW1tZWRpYXRlbHkgYW5kIHdlJ2xsIG5ldmVyIGdldCBmdXJ0aGVyIG9u
IHRvIHBsYWNlcyBpbiB0aGUNCj4gPj4+IGNvZGUgdGhhdCB3b3VsZCBiZSBjaGFzaW5nIGEgTlVM
TCBwb2ludGVyLg0KPiA+Pj4NCj4gPj4+IEhvd2V2ZXIsIHRoZXJlJ3MgY3VycmVudGx5IG9uZ29p
bmcgd29yayB0byBhbGxvdyB0aGUgcHJpbWFyeSBHVCB0byBiZQ0KPiA+Pj4gZGlzYWJsZWQgdmlh
IGNvbmZpZ2ZzIGZvciBkZWJ1Z2dpbmcgcHVycG9zZXMuICBPbmNlIHRoYXQgbGFuZHMsIGl0IHdp
bGwNCj4gPj4+IGJlIHBvc3NpYmxlIGZvciB0aGlzIHF1ZXJ5IHRvIHJldHVybiBhIE5VTEwgcG9p
bnRlci4gIFRoaXMgY2FuIGNhdXNlDQo+ID4+PiBwcm9ibGVtcyBpbiBndWNfZzJnX2FsbG9jLCBh
cyB0aGlzIHByb2Nlc3MgY3VycmVudGx5IHJlbGllcyBvbiB0aGUNCj4gPj4+IHByaW1hcnkgR1Qg
YWx3YXlzIGJlaW5nIHByZXNlbnQuDQo+ID4+Pg0KPiA+Pj4gSW5zdGVhZCBvZiBtYWtpbmcgdGhl
IHByaW1hcnkgR1QgdGhlIGcyZyBidWZmZXIgb3duZXIsIG1ha2UgdGhlIGZpcnN0DQo+ID4+PiBH
dUMgcGFzc2VkIHRvIGd1Y19nMmdfYWxsb2MgdGhlIGcyZyBidWZmZXIgb3duZXIuICBUaGlzIHJl
cXVpcmVzIGtlZXBpbmcNCj4gPj4+IHRyYWNrIG9mIHRoZSBnMmcgYnVmZmVyIG93bmVyIGluIHRo
ZSB4ZSBkZXZpY2Ugc28gZWFjaCBHdUMgY2FuIGtub3cgaWYNCj4gPj4+IGl0J3MgdGhlIG93bmVy
IG9yIG5vdCBkdXJpbmcgaW5pdGlhbGl6YXRpb24uDQo+ID4+Pg0KPiA+Pj4gTm90ZSB0aGF0IHRo
ZSBhc3NvY2lhdGVkIGt1bml0IHRlc3RpbmcgY29kZSBkb2VzIG5vdCBuZWVkIHRvIGJlIHVwZGF0
ZWQNCj4gPj4+IHRvIHJlZmxlY3QgdGhpcyBjaGFuZ2UgYmVjYXVzZQ0KPiA+Pj4gMS4gVGhlIGt1
bml0IHRlc3RpbmcgY29kZSBhbHdheXMgcnVucyB3aXRoIHRoZSBwcmltYXJ5IEdUIGVuYWJsZWQs
IGFuZA0KPiA+Pj4gMi4gVHJhY2tpbmcgdGhlIGcyZyBidWZmZXIgb3duZXIgaW4gdGhlIHhlIGRl
dmljZSBpcyB1bm5lY2Vzc2FyeSB0bw0KPiA+Pj4gICAgICBwZXJmb3JtIHRoZSBmdW5jdGlvbnMg
b2YgdGhlIHRlc3RzLg0KPiA+PiBJJ20gbm90IGNvbnZpbmNlZCB0aGlzIHdvcmtzIHdpdGhvdXQg
bW9kaWZpY2F0aW9uIHRvIHRoZSBzZWxmdGVzdC4gSW4NCj4gPj4gdGhlIGNhc2Ugd2hlcmUgdGhl
IEcyRyBpcyBhbHJlYWR5IGVuYWJsZWQsIHRoZSBzZWxmdGVzdCB3aWxsIGRlc3Ryb3kgdGhlDQo+
ID4+IGJ1ZmZlciAoc2VlIGcyZ19mcmVlKSB0byBjcmVhdGUgYSBuZXcgb25lIGZvciB0aGUgdGVz
dGluZy4gQm90aCBmb3IgdGhlDQo+ID4+IEcyR19DVEJfVFlQRV9ERUZBVUxUIHN1YnRlc3QgYW5k
IGFzIGNsZWFudXAgYXQgdGhlIGVuZCwgdGhlIHRlc3Qgd2lsbA0KPiA+PiBjYWxsIGd1Y19nMmdf
YWxsb2MoKSBhZ2FpbjsgaW4gdGhpcyBzY2VuYXJpbyB4ZS0+ZzJnX293bmVyIGhhcyBub3QgYmVl
bg0KPiA+PiBjbGVhcmVkIGJ1dCB0aGUgQk8gaXMgbm90IGFsbG9jYXRlZCwgc28gdGhlIGNvZGUg
aW4gZzJnX2FsbG9jIHdpbGwgdHJ5DQo+ID4+IHRvIGRvIGFuIHhlX2JvX2dldCBvbiBhIGJhZCBw
b2ludGVyLiBJIGNvdWxkbid0IGZpbmQgdGhlIGcyZyB0ZXN0IGluIHRoZQ0KPiA+PiBDSSByZXN1
bHRzIHNvIGNvdWxkbid0IGNvbmZpcm0gdGhhdCB0aGlzIGlzIGluZGVlZCBoYXBwZW5pbmcgYW5k
IEknbSBub3QNCj4gPj4gbWlzc2luZyBzb21ldGhpbmcuDQo+ID4gTm8sIHRoaXMgaXMgY29ycmVj
dC4gIFRoZSBzb2x1dGlvbiBoZXJlIHNob3VsZCBiZSBhcyBlYXN5IGFzDQo+ID4geGUtPmcyZ19v
d25lciA9IE5VTEwgYXQgdGhlIGVuZCBvZiBnMmdfZnJlZSAoYW5kIG1heWJlDQo+ID4geGUtPmcy
Z19vd25lciA9ICZyb290X2d0LT51Yy5ndWMgaW4gZzJnX2Rpc3RyaWJ1dGUgZm9yIGNvbXBsZXRl
bmVzcyBzYWtlKS4NCj4gPg0KPiA+IEkgaGF2ZSB0byB3b25kZXIgd2hhdCB0aGUgcG9pbnQgb2Yg
ZGlzYWJsaW5nIGFuZCByZWVuYWJsaW5nIHRoZSBnMmcgaW50ZXJmYWNlDQo+ID4gaW4gdGhlIGtl
cm5lbCBkdXJpbmcgdGhlIGcyZyBzZWxmdGVzdHMgaXMgZ2l2ZW4gd2UgYXJlbid0IGV2ZW4gdXNp
bmcgdGhhdCBpbnRlcmZhY2UNCj4gPiB0byBwZXJmb3JtIHRoZXNlIHNlbGZ0ZXN0cywgYnV0IHdo
YXRldmVyLg0KPiANCj4gVGhlcmUgaXMgbm8gbm9uLXRlc3Qga2VybmVsIGludGVyZmFjZSBmb3Ig
RzJHLCB0aGUgRzJHIGlzIHB1cmVseSBmb3IgdGhlIA0KPiBHdUNzIHRvIHVzZSB0byBjb21tdW5p
Y2F0ZSB3aXRoIGVhY2ggb3RoZXIsIHRoZSBkcml2ZXIganVzdCBhbGxvY2F0ZXMgDQo+IHRoZSBC
TyBmb3IgdGhlIEd1Q3MuIFRoZSB0ZXN0IGp1c3QgbmVlZHMgdG8gbWFrZSBzdXJlIHRoYXQgd2Un
dmUgDQo+IGFsbG9jYXRlZCB0aGUgQk8gYW5kIGluaXRpYWxpemVkIHRoZSBHdUMgc3RydWN0dXJl
cyBjb3JyZWN0bHk7IHdlIA0KPiBkZS1hbGxvY2F0ZSBhbmQgcmUtYWxsb2NhdGUgdGhlIEJPIGR1
cmluZyB0aGUgdGVzdCB0byBtYWtlIHN1cmUgdGhhdCBubyANCj4gbWF0dGVyIHdoZXJlIHdlIGFs
bG9jYXRlIGl0IGV2ZXJ5dGhpbmcgc3RpbGwgd29ya3MuDQoNCk9rYXkuLi4gYWRtaXR0ZWRseSwg
dGhlIHRlc3QgY29uZnVzZXMgbWUgcXVpdGUgYSBiaXQgYmVjYXVzZSBJIGtlZXAgdGhpbmtpbmcN
CnRoZSBnMmdfdGVzdF9hcnJheSBJUyB0aGUgRzJHIGJ1ZmZlciB3ZSdyZSB1c2luZywgYnV0IEkg
Y2FuIHNlZSBub3cgdGhhdCB3ZSdyZQ0KanVzdCB1c2luZyBpdCB0byBzdG9yZSB0aGUgaW5pdGlh
bCB2YWx1ZSBmb3IgdGVzdCBjb21wYXJpc29uLiAgSSdkIGFyZ3VlIHdlIHNob3VsZA0KanVzdCBi
ZSB1c2luZyBhIHN0YXRpYyB2YXJpYWJsZSBvdXRzaWRlIG9mIHRoZSB4ZSBzdHJ1Y3QgdG8gYXZv
aWQgY29uZnVzaW9uLCBidXQNCndlIGhhZCBhIGNvbnZlcnNhdGlvbiBpbiBwcml2YXRlIGFib3V0
IHdoeSB3ZSBjYW4ndCBkbyB0aGF0LCBzbyBJIHdvbid0IGJvdGhlcg0KcmVoYXNoaW5nIHRoYXQu
DQoNCkkgZ3Vlc3MgYWx0ZXJuYXRpdmVseSwgd2Ugc2hvdWxkIGNvbnNpZGVyIHJlbmFtaW5nIHRo
ZSB2YXJpYWJsZSB0bywgc2F5LA0KImcyZ190ZXN0X2luaXRpYWxfdmFsdWUiLCBidXQgdGhhdCdz
IG5vdCBwYXJ0aWN1bGFybHkgcmVsZXZhbnQgdG8gdGhpcyB0ZXN0IHNlcmllcy4NCi1Kb25hdGhh
biBDYXZpdHQNCg0KPiANCj4gRGFuaWVsZQ0KPiANCj4gPiAtSm9uYXRoYW4gQ2F2aXQNCj4gPg0K
PiA+PiBEYW5pZWxlDQo+ID4+DQo+ID4+PiBTdWdnZXN0ZWQtYnk6IE1hdHQgUm9wZXIgPG1hdHRo
ZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+ID4+PiBTdWdnZXN0ZWQtYnk6IERhbmllbGUgQ2VyYW9s
byBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+ID4+PiBTaWduZWQt
b2ZmLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+DQo+ID4+
PiBDYzogTWljaGFsIFdhamRlY3prbyA8bWljaGFsLndhamRlY3prb0BpbnRlbC5jb20+DQo+ID4+
PiAtLS0NCj4gPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaCB8IDQg
KysrKw0KPiA+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jICAgICAgICAgIHwgOSAr
KysrKystLS0NCj4gPj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmljZV90eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5o
DQo+ID4+PiBpbmRleCAwMmMwNGFkNzI5NmUuLmUxN2Y4Yjg0YjhkNCAxMDA2NDQNCj4gPj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiA+Pj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+ID4+PiBAQCAtMzgsNiArMzgsNyBA
QCBzdHJ1Y3QgZHJhbV9pbmZvOw0KPiA+Pj4gICAgc3RydWN0IGludGVsX2Rpc3BsYXk7DQo+ID4+
PiAgICBzdHJ1Y3QgaW50ZWxfZGdfbnZtX2RldjsNCj4gPj4+ICAgIHN0cnVjdCB4ZV9nZ3R0Ow0K
PiA+Pj4gK3N0cnVjdCB4ZV9ndWM7DQo+ID4+PiAgICBzdHJ1Y3QgeGVfaTJjOw0KPiA+Pj4gICAg
c3RydWN0IHhlX3BhdF9vcHM7DQo+ID4+PiAgICBzdHJ1Y3QgeGVfcHhwOw0KPiA+Pj4gQEAgLTYy
Niw2ICs2MjcsOSBAQCBzdHJ1Y3QgeGVfZGV2aWNlIHsNCj4gPj4+ICAgIAlhdG9taWNfdCBnMmdf
dGVzdF9jb3VudDsNCj4gPj4+ICAgICNlbmRpZg0KPiA+Pj4gICAgDQo+ID4+PiArCS8qKiBAZzJn
X293bmVyOiBQb2ludGVyIHRvIHRoZSBHdUMgdGhhdCBpcyB0aGUgb3duZXIgb2YgdGhlIGcyZyBi
dWZmZXIgKi8NCj4gPj4+ICsJc3RydWN0IHhlX2d1YyAqZzJnX293bmVyOw0KPiA+Pj4gKw0KPiA+
Pj4gICAgCS8qIHByaXZhdGU6ICovDQo+ID4+PiAgICANCj4gPj4+ICAgICNpZiBJU19FTkFCTEVE
KENPTkZJR19EUk1fWEVfRElTUExBWSkNCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3VjLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMNCj4gPj4+IGluZGV4
IGQ5NDQ5MDk3OWFkYy4uOTc5MGRkYWQ2MDZhIDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d1Yy5jDQo+ID4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
LmMNCj4gPj4+IEBAIC00NjUsOSArNDY1LDggQEAgc3RhdGljIGludCBndWNfZzJnX2FsbG9jKHN0
cnVjdCB4ZV9ndWMgKmd1YykNCj4gPj4+ICAgIAlpZiAoZ3VjLT5nMmcuYm8pDQo+ID4+PiAgICAJ
CXJldHVybiAwOw0KPiA+Pj4gICAgDQo+ID4+PiAtCWlmIChndC0+aW5mby5pZCAhPSAwKSB7DQo+
ID4+PiAtCQlzdHJ1Y3QgeGVfZ3QgKnJvb3RfZ3QgPSB4ZV9kZXZpY2VfZ2V0X2d0KHhlLCAwKTsN
Cj4gPj4+IC0JCXN0cnVjdCB4ZV9ndWMgKnJvb3RfZ3VjID0gJnJvb3RfZ3QtPnVjLmd1YzsNCj4g
Pj4+ICsJaWYgKHhlLT5nMmdfb3duZXIpIHsNCj4gPj4+ICsJCXN0cnVjdCB4ZV9ndWMgKnJvb3Rf
Z3VjID0geGUtPmcyZ19vd25lcjsNCj4gPj4+ICAgIAkJc3RydWN0IHhlX2JvICpibzsNCj4gPj4+
ICAgIA0KPiA+Pj4gICAgCQlibyA9IHhlX2JvX2dldChyb290X2d1Yy0+ZzJnLmJvKTsNCj4gPj4+
IEBAIC00OTIsNiArNDkxLDcgQEAgc3RhdGljIGludCBndWNfZzJnX2FsbG9jKHN0cnVjdCB4ZV9n
dWMgKmd1YykNCj4gPj4+ICAgIAl4ZV9tYXBfbWVtc2V0KHhlLCAmYm8tPnZtYXAsIDAsIDAsIGcy
Z19zaXplKTsNCj4gPj4+ICAgIAlndWMtPmcyZy5ibyA9IGJvOw0KPiA+Pj4gICAgCWd1Yy0+ZzJn
Lm93bmVkID0gdHJ1ZTsNCj4gPj4+ICsJeGUtPmcyZ19vd25lciA9IGd1YzsNCj4gPj4+ICAgIA0K
PiA+Pj4gICAgCXJldHVybiAwOw0KPiA+Pj4gICAgfQ0KPiA+Pj4gQEAgLTUwNCw2ICs1MDQsOSBA
QCBzdGF0aWMgdm9pZCBndWNfZzJnX2Zpbmkoc3RydWN0IHhlX2d1YyAqZ3VjKQ0KPiA+Pj4gICAg
CS8qIFVucGlubmluZyB0aGUgb3duZWQgb2JqZWN0IGlzIGhhbmRsZWQgYnkgZ2VuZXJpYyBzaHV0
ZG93biAqLw0KPiA+Pj4gICAgCWlmICghZ3VjLT5nMmcub3duZWQpDQo+ID4+PiAgICAJCXhlX2Jv
X3B1dChndWMtPmcyZy5ibyk7DQo+ID4+PiArCS8qIGcyZyBvd25lciBpcyBubyBsb25nZXIgdmFs
aWQuICBNYXJrIGFzIE5VTEwgaW4geGUgZGV2aWNlICovDQo+ID4+PiArCWVsc2UNCj4gPj4+ICsJ
CWd1Y190b194ZShndWMpLT5nMmdfb3duZXIgPSBOVUxMOw0KPiA+Pj4gICAgDQo+ID4+PiAgICAJ
Z3VjLT5nMmcuYm8gPSBOVUxMOw0KPiA+Pj4gICAgfQ0KPiA+Pg0KPiANCj4gDQo=
