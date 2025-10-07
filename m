Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFE8CCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 17:59:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F95910E1AD;
	Tue,  7 Oct 2025 17:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SUIDv8cC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CE110E1AD
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 17:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759859980; x=1791395980;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iMdPLRSLb1RvfJ2zJ8aK1pcKH4guuR+hjy/+ZWYBscw=;
 b=SUIDv8cC4nvHpvQoA1rnD+JOVXmmXAabrAFGSmBWk0VYm8Z307F2IAF1
 rHJ9Nrbg3pLHm9djuYIE/5eFwUU/BM4zEFR8G9Jii08VcFBeLl5phmdRd
 VtCSa/9T1aW471jvo/AnpWtnQJFW7drrNwZDwQH1L/fw4HT8xwFn++gLZ
 r2Ri3S9I78l3mf8vT4IgigmoIvSmJtdMfa/5g4e9MJwDfohhd0ucyxz7G
 t93qlBoLFoT8eLjJ2KIjOIVMDDvFYEAjNCPExks8pr+x+1oL3JOSPiPBX
 84Oj5TrgiTcGZ3L6lQ3mr5gYqMG2PVfS5CoQDMN5/0jb9H1uLyDA8WLvy A==;
X-CSE-ConnectionGUID: YTgNYiQiQQyIY3xuzgCrjA==
X-CSE-MsgGUID: VqAEe7CWTu+d8sYDIcHI+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="62147648"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="62147648"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 10:59:39 -0700
X-CSE-ConnectionGUID: fhodeS6fT3mvCmSUFKPtxg==
X-CSE-MsgGUID: ws+A1FJLTr+2DUrp2SNZQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="210871103"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 10:59:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 10:59:37 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 10:59:37 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 10:59:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2oEjyDhWRLi7s3wmfRqxW2YwIDy0KGwUixT5emEQYaH+VPIkKtqMFfFFy8kxQjUOGmBMzOPvPIA+zVFV4A7h3eVB1tcT0tDhqOv/+QIIrZGLJocOa8GET3Dpd2QS/NQqooaVSHLs7BVvghpRvj5L9ChyQ509f7hlxcFAvap+SXLVivDVIQQxGGu7xZYRFJPvrh16XfFbXcPVW3xuusyJ78U5t1YfBRZSFsCtNM/HOFs5F+Ruy9WwAP8WOOLr/dvgZmaoWd4/jow7EjnypGZBRxBzZWlqlKp2AkGo9nkxoNUcPUs7AJkiWRs3FCIRhODnLzz6g2otN2q0FLbC1r7Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMdPLRSLb1RvfJ2zJ8aK1pcKH4guuR+hjy/+ZWYBscw=;
 b=RB+pCiUSOWHaFRJQ2WGjtUWNBCdGm7BbX4PIb3wXB5QEswiO3aMwDpfT9udCfabYw3kkRhTZ8YMupb72HSd5H+LE7eVRUtiOvr0bvUW4TtTfrPP4KID+Fvzy/AR94K0gtxYXcvHqLpbO1cqPzErYXyRrfOSnBfXOFeq49d+08qOeuUt36Nh7uL9UWvwhzrI5GJGEZjXbs0bmcJO+asyk+olwHYl9KAd42TmwcAZHadcEo8uMB76wmqbF4xBC8TMFzGhiv/WNscze9VcV760u/+Yg/NwH73T4vOcXMraRW65GhaRnNp1V5knTgaYCPIv1Mh8YxFMdSaHMNx1DEQOWcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 17:59:30 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 17:59:30 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Check CT enable state before deregistering
 exec queue
Thread-Topic: [PATCH] drm/xe/guc: Check CT enable state before deregistering
 exec queue
Thread-Index: AQHcNVUHNYl88hkU00KcGAEuISb0DrS2ynHwgAADwICAACjCkA==
Date: Tue, 7 Oct 2025 17:59:30 +0000
Message-ID: <DM4PR11MB5456FBB99875139BBC207BA9EAE0A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251004173033.2511250-2-shuicheng.lin@intel.com>
 <DM4PR11MB5456A079CF5E4276AE13580EEAE0A@DM4PR11MB5456.namprd11.prod.outlook.com>
 <aOUtP+15UGWK1YaB@lstrano-desk.jf.intel.com>
In-Reply-To: <aOUtP+15UGWK1YaB@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SJ0PR11MB5214:EE_
x-ms-office365-filtering-correlation-id: 1c7f9d48-ad52-4914-582c-08de05cb4384
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?clkvOFgzWEtOMTh2VlR6d2ZmaEIzaytWNi9WYUo0YjhZNzlqWTRTRlpYVWI1?=
 =?utf-8?B?dUQraFN0STgwRDByd2tZSUJ0REhMb1N3WHVVNm9LeHJETXBIMTM2K2xLSjlo?=
 =?utf-8?B?dnhOVlVEdGozbzlNc1F5V2UwODBaRE9UamJWdHdjVjQzZ0swLzcrNVJyTWo4?=
 =?utf-8?B?ejFtZ1pPWXgzdFZ5OUorU05rSWJUNUw1clJkT3VHdzBDTlBoREhyTmxmOWJI?=
 =?utf-8?B?bWd1VjdIZ1JxZ1JWQkpBeWtIKzd5Um1wNDlHeVVFYVhCWTBqNld6V0NQRnFa?=
 =?utf-8?B?aVNVNDJUS3BHWm1kOGJZMm9yS0NuTHlqWWg2Q0tNcmhnMkJwWXlSMFcvYWYw?=
 =?utf-8?B?Zm04TXA5aDJxUS9Xd0p2aEZRWW1oMWN3djZwVmxranFlN292eGFCbHZWYXFM?=
 =?utf-8?B?T2srR2R1VmlROSsvTGMyS20zVDhVSzdjYXgwMERBY3hvdlhYODdzelIzU2FW?=
 =?utf-8?B?S0REbTBOV1RzdFJoVEgzKzRrYTg1UkI4cWpIVFNJR0xCUHFEMFJ5SldXa1J5?=
 =?utf-8?B?UEhXUlU0aGU5NjViVFlMNzhHWDBxd0FhRzlUTEFWUldPQW9UaWRRQndVTWN1?=
 =?utf-8?B?KzdVTEs0S0pUa21ocFpYR21uRnBvd1M1NmVqZm1tVTR5dzFMckVSRlJnVHFn?=
 =?utf-8?B?c1pJMlI4emJYcmp4aGs4MGlWNkxYY09yVEtkc3Zya3NvQXRVb2FWQklpelJx?=
 =?utf-8?B?TkIrQUtNNzJ5QzF1ZG0vbk5CZFRFTXVrU0xZM0Vmb2pPVitYaGp6Sk0yd2Yy?=
 =?utf-8?B?OHBkb3VUeU96QjluQlMyV3VwQVRtdU1nV2tvZGNYRXE2aC9YdFdtM25neW9W?=
 =?utf-8?B?SHhpT2piK2wrVTNsek9kTEh0d3BTTGdoa0pJQXRTRFk5VEdiZmNJKzJvTGNS?=
 =?utf-8?B?N08rcitxWGM2dnJicnM2M0ZveExNMk5vbTFzdFE0VWQzbU4xd2ptU2E0a1hm?=
 =?utf-8?B?V01yVThjK3hsTGtWZHhIaTJTOWNZSVhnYWIyd09SaFprNkVYenFFWmg3VkZW?=
 =?utf-8?B?azVwamN5bmdtUzNQdjF5dWhhZXQ4N2EyNlgrZjlLMjl0dGgzU3FoWFYxb2Rh?=
 =?utf-8?B?YVJKNXRZU0hsS0lNZXhuN2VCejI4ZGJYR2J6R2V0d25ua0F4MGlCQlNkYzJC?=
 =?utf-8?B?MXRSVWtjb0ZMQ2svWTBtTGJqSUFQNUsvLzE0OWJmNHVxeU5kZmlPN29PTnZI?=
 =?utf-8?B?R1JIM1JJU3VPV0JKQ2t6QmxlMUF1UDI2TWN2aGMzWnFva0tXNFlhRmVuSjh2?=
 =?utf-8?B?bHc3TkxsWnV6RDJqWU96Um1ubEdjQyt2NEtnbmh3Z1hQTGp6c2cwVndVQW9Y?=
 =?utf-8?B?dk11eW14YnlLRkVkQnFZMTBkQkFyS3F4OGdTc2ROK0x5Rk1zTmdTRTlLNGI5?=
 =?utf-8?B?cm40V1ZwdTI3R0FTb3lMMURhZVRSeDd2ckFIM2V2NEtRaWw5M0RCUVgwWFhI?=
 =?utf-8?B?QjB5WmZUWktlRE5jMGYwdHZOaTliTlRlSGg0cUlRY2dmNUZkZlNjSjRlS1BK?=
 =?utf-8?B?VytHK0liYUJJNW5RREhuT3NYZjlkaHNqWHE1eDFTTXVQUGNlc3NIVnhSTE1W?=
 =?utf-8?B?Z2Joa3BaSmQxYlZuZ091dXBneWNuamkybFY2eGwwOWoyMkJmY1czWW4vQlZF?=
 =?utf-8?B?MkZjbkRvb1FJdTR6RXlkY2dXbTB1L3Q0N0E5VXpubXY1aWlKaG4vQzEvMk5i?=
 =?utf-8?B?b1dOUGFHY2FMaWVtUENMcVFWTHkzcXRSMWNITExLTUNNWGVLdmhKYjdMSHlq?=
 =?utf-8?B?VlNuUnhTSHZkbGFuZ2paYVZwZHpxdVpCQmVKNDZOam9kVzVuNy8yZzlWYXJX?=
 =?utf-8?B?SnN5ZGxOL3FRdFNjWDlLUnZhcHlNaEJCVTlZUHZQSHl1bG5mS01rTXFlWXNZ?=
 =?utf-8?B?WlZrYkczTUdwcEY2c0tDK29zQ0FkbWtmc2x4enlkOHlseTdjRmhGek9qOVp0?=
 =?utf-8?B?UWhjSk9pVHJrb2F0Nmw1dWVtWkxFbFFLaFZ4Ym02VXpnL3pXa0syM3EvU2RK?=
 =?utf-8?B?UHlYQjdwYW1OUEdpVVFmdmZUSWVCYTJ2ZzdIeVpUWDJZUEdjd0xwZVdzZXg1?=
 =?utf-8?Q?9B5F7s?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0VHb2lmSExaS0p4eHpWaHJrdUF5YkVRMHZwK05UdGlCL2M0YzNTQUFZb3JW?=
 =?utf-8?B?ekYzd1FSMUpqSHBTNGoxWDdhbXVxUEhBbmoyeVFkYmdzdG44elRsZVdhcWN1?=
 =?utf-8?B?bmJKcUhwcmNablFMWHdvS3VpelR2REp0VmNtSURLOHlaVTI5eDRKT3ZUUXdC?=
 =?utf-8?B?ekxYbHFDMjloZ3laVWMzVGt2WDZNZEZuSnVoWVlDRm42eDFOV1NSU01BbDl4?=
 =?utf-8?B?c1MvR3dTTE5KTXFUSHIvMzRQWVBmdGRHVXlNbmxQbnkzdXdqVStCa0pWNkp3?=
 =?utf-8?B?bGZLbFM0R2RseVNycENMSFhJUlJYQVFLaE9uRnFKMTlDcTltOGhzYnJySEZ4?=
 =?utf-8?B?eXFLaUpwSElxOVgybStDRS9tcnZJNWo2cElDdHpiUzFBL0VGeDU4VCtuaVdx?=
 =?utf-8?B?c1VDSy9JeVV2VUplZndoelJYM1A4Qk94R3J2OHZOM2g0MWxtL2U5d2dLWXN6?=
 =?utf-8?B?dHF2WkIrWnIvRVBwckRrN3pDaGE4NHBVTkNZZ2JRWjFBb3QvQU5tZVVibHll?=
 =?utf-8?B?SFRaZWgwWmZLdWZ0bkV5VHVzdnl1Y2VHWjR0WVJ4b3pFbm5uY2gzcE92cERD?=
 =?utf-8?B?OFQ3YlFyckd3TXZzNk8yaTlCK3VnOUxSQWkzNC9UTDZLbzY1WmtkUnoxd3hk?=
 =?utf-8?B?aGswTDZpNk50ckNqVTJDa2JxbFdJVU1NVG91Wkwxcm5hRmdyMVI3MlZVVG8v?=
 =?utf-8?B?cW9OSVBvajlWN2RaTWExZTMyRDZXckNlTk5kejVhY254UGdQVklHc2Y0T3BW?=
 =?utf-8?B?V3Q4Si9iOVFUMi92YWhzMC9pcWtLV3A5dWhPRjdneXE3dmFiNnhaZUJrMHUx?=
 =?utf-8?B?Tm5oOTVFaGQ0dTNhWDVwcDFvRVV1anVob2o0UTRVdW1xV0dBWVo1ZVRPeU1G?=
 =?utf-8?B?WVFKeXE0WndHRWQ0VnpLdnUxNjUxaWFEN1ZUcHJvTjJOYk9teE5MSmd6Nnl3?=
 =?utf-8?B?ZUxHL2NQM2M0ZjNLeVFKYk55cUxZekpYRnB2eU05RUpCbUJ5bUJMQ1RSaUtS?=
 =?utf-8?B?VUoydHBhRWUzMnhvNE90cG9wSjF5SmlTNzFoY2RYeEljR3YwMCtCcDhmaERF?=
 =?utf-8?B?M2JraVd0NW5SUVdhSThnODhIaFBTSzFJY1ZZSThhR1ExcjlYZ1RNVHZkZmhm?=
 =?utf-8?B?d2lkQ2pCSDM1Z3dkRlRWdkNTa0JjZUpucFNMb0ZXb1FJaS9kTWo4ZTZwZVV1?=
 =?utf-8?B?SDJRNGtIVG5XTkRrTWZhNFdwUjNxLzBMVTFxUi9YTEdMRmc0YlpPZU45ZkpJ?=
 =?utf-8?B?ZUJxbkFkdVFSQjBYOGF6Y3VDSjBHQ2JXeGMyYUVRTyt3a1ZTS1FRSnRCRVIv?=
 =?utf-8?B?K29xbXNzNXBjY013UGwvSlNrZ1ZieVRFZXV1dUxmQjVDMlRBdE90WUxaNEtM?=
 =?utf-8?B?UVRkMExCTWZjdUtGK1JlR1l5T09RNDcvTlFwZ3hhZHZ3bS9BazN5cUF3cjdt?=
 =?utf-8?B?WlJTb1dnWnhHa1RuRHpGZDRLS3I3RzI3SjJyR21QUVVObjAreG14ZDgzbCts?=
 =?utf-8?B?Q0p3THVOZ004L1kxajB0SHh5a243OUh2RXlqZUV0RzNJOVI4VVJ2Y3VxRjA4?=
 =?utf-8?B?UWNhaUpFU0FEM21mU2tROWxJY09FK29NSE9TelpWbHBRK0l2Y2JtWW56WjQ2?=
 =?utf-8?B?RDlJS2N3WmhYRmhOaGRkWHlXUWpMQlVVWURFT2VkeVg2TTU0VjRmNlpVNHA4?=
 =?utf-8?B?SWdhdzJyczFxTGxvcDJrZXRjLzJxbzhudnpQVFhXQ2xaWER0ZzljTkIyVlFE?=
 =?utf-8?B?SStxbWk4Z1ZxV2c3VUlnRExoaWQvZjVsbUdhRFdQNGJ3QjZsbkRLQytBeE5D?=
 =?utf-8?B?bHZhNlNFRncxUHRJcE4vQmVTekw5M2FMWG4wN0xaeVY4RkxUbzlieWdVeVhM?=
 =?utf-8?B?cm5VZVBwYjhaRUhDbnRWcU5QUDdHdE96T3hBNW85Z3Q0VFRXMGx3QVZhM0I0?=
 =?utf-8?B?VWRyWDMwYURjN0Q0K3VXL0dyQjEwU3pBRzJia0RVV285S05XRlE4bVVUTExn?=
 =?utf-8?B?RURSMmUrak5rTExTaTZWVC9PZzUvd3E5LzlCUFB6cGh0dzZjT0d0MVA5c20w?=
 =?utf-8?B?bVhXZG5QU0k5TndKOXpQTStkdFRWQk5Vd09EV0tJNDlFcHNkYzQvdWtnMkNq?=
 =?utf-8?Q?8HfM2P4/iwprjWjEAh+Or6Ia3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7f9d48-ad52-4914-582c-08de05cb4384
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2025 17:59:30.2298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zoTIxnITaf2Ufz2SKLYx+E7dHAidcBNJ2Uaj+cUvW7OpjBpLaxwsv5dECtHCL9CsRvL4a8ug7EbyX8iZTED0Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5214
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

T24gVHVlLCBPY3QgNywgMjAyNSA4OjEwIEFNIE1hdHRoZXcgQnJvc3Qgd3JvdGU6DQo+IE9uIFR1
ZSwgT2N0IDA3LCAyMDI1IGF0IDA4OjU5OjI1QU0gLTA2MDAsIExpbiwgU2h1aWNoZW5nIHdyb3Rl
Og0KPiA+IEhpIGFsbCwNCj4gPiBDb3VsZCB5b3UgcGxlYXNlIGhlbHAgbWUgcmV2aWV3IGl0PyBU
aGFua3MgaW4gYWR2YW5jZS4NCj4gPg0KPiA+IEJlc3QgUmVnYXJkcw0KPiA+IFNodWljaGVuZw0K
PiA+DQo+ID4gT24gU2F0LCBPY3QgNCwgMjAyNSAxMDozMSBBTSBTaHVpY2hlbmcgTGluIHdyb3Rl
Og0KPiA+ID4gSW4gbm9ybWFsIG9wZXJhdGlvbiwgYSByZWdpc3RlcmVkIGV4ZWMgcXVldWUgaXMg
ZGlzYWJsZWQgYW5kDQo+ID4gPiBkZXJlZ2lzdGVyZWQgdGhyb3VnaCB0aGUgR3VDLCBhbmQgZnJl
ZWQgb25seSBhZnRlciB0aGUgR3VDIGNvbmZpcm1zDQo+ID4gPiBjb21wbGV0aW9uLiBIb3dldmVy
LCBpZiB0aGUgZHJpdmVyIGlzIGZvcmNlZCB0byB1bmJpbmQgd2hpbGUgdGhlDQo+ID4gPiBleGVj
IHF1ZXVlIGlzIHN0aWxsIHJ1bm5pbmcsIHRoZSB1c2VyIG1heSBjYWxsIGV4ZWNfZGVzdHJveSgp
IGFmdGVyDQo+ID4gPiB0aGUgR3VDIGhhcyBhbHJlYWR5IGJlZW4gc3RvcHBlZCBhbmQgQ1QgY29t
bXVuaWNhdGlvbiBkaXNhYmxlZC4NCj4gPiA+DQo+ID4gPiBJbiB0aGlzIGNhc2UsIHRoZSBkcml2
ZXIgY2Fubm90IHJlY2VpdmUgYSByZXNwb25zZSBmcm9tIHRoZSBHdUMsDQo+ID4gPiBwcmV2ZW50
aW5nIHByb3BlciBjbGVhbnVwIG9mIGV4ZWMgcXVldWUgcmVzb3VyY2VzLiBGaXggdGhpcyBieQ0K
PiA+ID4gZGlyZWN0bHkgcmVsZWFzaW5nIHRoZSByZXNvdXJjZXMgd2hlbiBDVCBpcyBkaXNhYmxl
ZC4NCj4gPiA+DQo+ID4gPiBIZXJlIGlzIHRoZSBmYWlsdXJlIGRtZXNnIGxvZzoNCj4gPiA+ICIN
Cj4gPiA+IFsgIDQ2OC4wODk1ODFdIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0t
LSBbICA0NjguMDg5NjA4XQ0KPiA+ID4gcGNpDQo+ID4gPiAwMDAwOjAzOjAwLjA6IFtkcm1dICpF
UlJPUiogR1QwOiBHVUMgSUQgbWFuYWdlciB1bmNsZWFuICgxLzY1NTM1KQ0KPiA+ID4gWyAgNDY4
LjA5MDU1OF0gcGNpIDAwMDA6MDM6MDAuMDogW2RybV0gR1QwOiAgICAgdG90YWwgNjU1MzUNCj4g
PiA+IFsgIDQ2OC4wOTA1NjJdIHBjaSAwMDAwOjAzOjAwLjA6IFtkcm1dIEdUMDogICAgIHVzZWQg
MQ0KPiA+ID4gWyAgNDY4LjA5MDU2NF0gcGNpIDAwMDA6MDM6MDAuMDogW2RybV0gR1QwOiAgICAg
cmFuZ2UgMS4uMSAoMSkNCj4gPiA+IFsgIDQ2OC4wOTI3MTZdIC0tLS0tLS0tLS0tLVsgY3V0IGhl
cmUgXS0tLS0tLS0tLS0tLSBbICA0NjguMDkyNzE5XSBXQVJOSU5HOg0KPiA+ID4gQ1BVOiAxNCBQ
SUQ6IDQ3NzUgYXQgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV92cmFtX21nci5jOjI5OA0KPiA+
ID4gdHRtX3ZyYW1fbWdyX2ZpbmkrMHhmOC8weDEzMCBbeGVdICINCj4gPiA+DQo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBTaHVpY2hlbmcgTGluIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4NCj4gPiA+
IC0tLQ0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMgfCAyICstDQo+
ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4g
Pg0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMN
Cj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+ID4gaW5kZXgg
NTMwMjRlYjU2NzBiLi45ZDMzZjYzZDk3MmIgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjX3N1Ym1pdC5jDQo+ID4gPiBAQCAtMTQ4OSw3ICsxNDg5LDcgQEAgc3RhdGljIHZvaWQN
Cj4gPiA+IF9fZ3VjX2V4ZWNfcXVldWVfcHJvY2Vzc19tc2dfY2xlYW51cChzdHJ1Y3QgeGVfc2No
ZWRfbXNnICptc2cpDQo+ID4gPiAgCXhlX2d0X2Fzc2VydChndWNfdG9fZ3QoZ3VjKSwgIShxLT5m
bGFncyAmDQo+ID4gPiBFWEVDX1FVRVVFX0ZMQUdfUEVSTUFORU5UKSk7DQo+ID4gPiAgCXRyYWNl
X3hlX2V4ZWNfcXVldWVfY2xlYW51cF9lbnRpdHkocSk7DQo+ID4gPg0KPiA+ID4gLQlpZiAoZXhl
Y19xdWV1ZV9yZWdpc3RlcmVkKHEpKQ0KPiA+ID4gKwlpZiAoZXhlY19xdWV1ZV9yZWdpc3RlcmVk
KHEpICYmIHhlX2d1Y19jdF9lbmFibGVkKCZndWMtPmN0KSkNCj4gDQo+IENoZWNraW5nIHRoZSBD
VCBoZXJlIGlzIG5vdCB0aGUgY29ycmVjdCBhcHByb2FjaCDigJQgdGhpcyBpcyBhIHN0YXRlIHRo
YXQgY2FuDQo+IGNoYW5nZSBhdCBhbnkgdGltZS4gRm9yIGV4YW1wbGUsIHRoZSBDVCBtYXkgZ28g
ZG93biBhbmQgY29tZSBiYWNrIGR1cmluZw0KPiBWRiBtaWdyYXRpb24uIElmIHlvdSByYWNlIHdp
dGggdGhhdCBzdGF0ZSBjaGFuZ2UsIHRoZSBHdUMgd2lsbCBob2xkIHJlZmVyZW5jZXMNCj4gdG8g
dGhlIHF1ZXVlLCBhbmQgdGhpbmdzIHdpbGwgcXVpY2tseSBnbyBzaWRld2F5cy4NCj4gDQo+IEkg
dGhpbmsgd2hhdCB5b3UgbmVlZCBoZXJlIGlzIGEgZHJpdmVyIHVuYmluZGluZyBjaGVjay4gRG8g
d2Ugd2VkZ2UgdGhlDQo+IGRldmljZSBkdXJpbmcgdW5iaW5kPyBJZiBzbywgeW91IGNvdWxkIGRv
IHNvbWV0aGluZyBsaWtlOg0KPiANCj4gaWYgKGV4ZWNfcXVldWVfcmVnaXN0ZXJlZChxKSAmJiAh
eGVfZGV2aWNlX3dlZGdlZCh4ZSkpDQo+IA0KPiBTaG93IG1vcmUgbGluZXMgSWYgd2UgZG9u4oCZ
dCB3ZWRnZSB0aGUgZGV2aWNlLCB3ZeKAmWxsIG5lZWQgc29tZSB4ZV9kZXZpY2UtDQo+IGxldmVs
IGZ1bmN0aW9uIHRvIGluZGljYXRlIHRoYXQgdGhlIGRyaXZlciBpcyBiZWluZyB1bmJvdW5kLg0K
DQp3ZWRnZWQgZmxhZyB3b24ndCBiZSBzZXQgZHVyaW5nIHVuYmluZCBwcm9jZXNzLiAgSG93IGFi
b3V0ICJndC0+dWMuZ3VjLnN1Ym1pc3Npb25fc3RhdGUuZW5hYmxlZCIgc2V0IGluIHhlX2d0X3Nh
bml0aXplKCk/IEkgZ3Vlc3Mgbm8gc2luY2UgaXQgaXMgbGlrZSB4ZV9ndWNfY3RfZW5hYmxlZCgp
Lg0KSG93IGFib3V0IHhlX3VjX2Z3X2lzX3J1bm5pbmcoKSwgb3Igd2Ugc2hvdWxkIG5vdCByZWx5
IG9uIHRoZSBndWMgc3RhdGUsIGFzIGl0IG1heSBiZSBjaGFuZ2VkIGxhdGVyPw0KWW91IHByZWZl
ciB0byBhZGQgYSBuZXcgdmFyaWFibGUgbGlrZSAieGUtPnVuYm91bmQiLCBhbmQgY2hlY2sgdGhl
IGJpbmQgc3RhdGUgaGVyZSwgcmlnaHQ/DQpUaGFua3MuIA0KDQpTaHVpY2hlbmcNCg0KPiANCj4g
TWF0dA0KPiANCj4gPiA+ICAJCWRpc2FibGVfc2NoZWR1bGluZ19kZXJlZ2lzdGVyKGd1YywgcSk7
DQo+ID4gPiAgCWVsc2UNCj4gPiA+ICAJCV9fZ3VjX2V4ZWNfcXVldWVfZGVzdHJveShndWMsIHEp
Ow0KPiA+ID4gLS0NCj4gPiA+IDIuNDkuMA0KPiA+DQo=
