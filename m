Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B67C87FCA
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 14:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E614D10E7AA;
	Thu, 31 Jul 2025 14:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+rtyPS+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D9010E7AA
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 14:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753972130; x=1785508130;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=R5m9ahmZLpRtlzzQs05mVK2Xz6XfEq2T8IV5xuND+sY=;
 b=T+rtyPS+zgno/ddf6FmP8sB+abJRK8OW1/GxCW3zY3amqDQyImpAxqEt
 QJP1/PJ+IC/bpP1PyJ9UQrnKuGrwo82wdgz4DC3cavMutlMzvZIMvBXyf
 mV/tXlJFTMK9wl35lP2C6FneaaglDAeIagh7TO1UiaRIMnPBBbQ9B92w4
 Xms8Cd8UOneNB+E4/FsfdjKjqxx4IT41I93xLD3SMl11oGDmevkwijvnT
 1+IsDK5JpGneiH4cShQdLxVwLYCZcZyso/Q661C7TTqvb4ldWdz/GiMZa
 k2cvAqV9XA+86agOQtPETsEjIHMfXr0JRAAThYqrdcAaBoLG4crW/OE3T g==;
X-CSE-ConnectionGUID: 46gOeOkwTuilZyh4U7FWlQ==
X-CSE-MsgGUID: dbwCiwlmRguMtY1alARQAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55499871"
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; d="scan'208";a="55499871"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 07:28:40 -0700
X-CSE-ConnectionGUID: vQEDG528Rx2dUGkDF6Vd8A==
X-CSE-MsgGUID: aR4QhVVARuKKssvDHnM0rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; d="scan'208";a="162551759"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 07:28:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 07:28:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 07:28:36 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 07:28:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrW1Mb5ZlchSSRKrcdFm/EDaQIIu0tX/3LH4ZFHtMdMtHGXICVxoZSnKKpQaxyhBcH/wLh2P8/kO3XYc6fF9609HcBxF2ToZfNpHDFChi7aCmTlyWcfxzIF6fXaVhhgISW1eGE2Xce3fDOe+b01Eeq5Z/ecDGBCj/F4SaoZx3qHsu1cJI/AFoAGQ8WqpfpQrxhzzfCA81S6Ra6peNxVmDxd3WbR4x9X5y34hq3sa+9o55WZTdCu4ZgF0uPXB21wv6TVulVSvRsVywOxYv1r2rE9HwviqidkAJLiCbCMsJ6OnHb16m2HORI5GeHrboCKz4aV5AaAzvrzLDrjpxXzYAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5m9ahmZLpRtlzzQs05mVK2Xz6XfEq2T8IV5xuND+sY=;
 b=Jd6sBZSYMON025JdVHX3coxwVsggMijF8iD8B8IQCOwp9cjHpgMENLDpTRyWV7Xf3w2WymhOCuc+WQ2SOWaRpuDxD4I0Mlv72MjL6bwxuJUaBqWdltL/FnBZOMevKhUIBrN9MUDOkuL5XrgrbJt8I7mAtURsSe0z/fZLnJ0qYagc3+E/Bm+Sg+s0rEjXmpdjva0iB9j/6KkTy5jAGWiXJeJQOIf5sEJaDTX+qHvhTXvHPGKiPZpZTmb8z3hNas3zf0fCqZnS2i/zqf8QvtnBcx2uB88vZsJd/xdmv5X5+6QCAn2oyNq836R+0f77GTz75fNqsETYMaKGSUtaZPOn3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH7PR11MB5863.namprd11.prod.outlook.com (2603:10b6:510:135::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Thu, 31 Jul
 2025 14:28:19 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8989.013; Thu, 31 Jul 2025
 14:28:19 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
CC: "Patelczyk, Maciej" <maciej.patelczyk@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe/migrate: prevent infinite recursion
Thread-Topic: [PATCH v2 1/3] drm/xe/migrate: prevent infinite recursion
Thread-Index: AQHcAf7fjtBQ3ZcqwEyFaITOhM2+NbRMSrkA
Date: Thu, 31 Jul 2025 14:28:19 +0000
Message-ID: <2d22bc3b1d8e98943d47914044f3f02d558faf9e.camel@intel.com>
References: <20250731093807.207572-5-matthew.auld@intel.com>
 <20250731093807.207572-6-matthew.auld@intel.com>
In-Reply-To: <20250731093807.207572-6-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH7PR11MB5863:EE_
x-ms-office365-filtering-correlation-id: e240b479-0999-4e6a-97e4-08ddd03e7ef4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ankza0I1bWc1Q1o4b2pYcTgzQVpwSVliWTJaV05CWTJaTG9XZzd5cTNpYzJP?=
 =?utf-8?B?TTlEQ2FYTlIxN3IyMlo3UzBqYmdjMWhaZWVueEF6UXVVL2tkNEpXWFRNZE5T?=
 =?utf-8?B?WTVUYlU5MmJBOWhxVk10d01OUHJDVmtmbVRNNzhuelFBbmJUZDJGQ0dQKzVY?=
 =?utf-8?B?blRnaVFtMzN4QW1wUFdDdXhLOXFjS2dLMGZpZE16TXd3REFmY2FBWXFQLzhI?=
 =?utf-8?B?NFJZMHNCRCsvR3daaFluNDdtNlo2WjNST05TTk1YaW9acVpjSXF3RXJuSjZa?=
 =?utf-8?B?MExvaFo1NzdTcGsyWFNaMWpQSStwSjdPUGJLVHZKL01FRkhQZFVEb3VrNGZ3?=
 =?utf-8?B?b3ZROStVNFZFeDBPNEVaNXFQVGNDTzhIYzdCU0p6ZFkvdmQ2T0pVM1NramJ0?=
 =?utf-8?B?b3k4Tkk4dHkwTEowbTRTYThzcDFtbGZIcUh5dzNmc0JBY2E0aDlVT0xQRFQ5?=
 =?utf-8?B?eEJLcGg0NGl0d3NMTzVFbWIxdUVSbTlLYW9QaTBKZ3FtQnczZ0lHVDU1RzQv?=
 =?utf-8?B?VEZUS0FuUS9lSkhlSnBLTEVybXl6c3hVRHBVZ0JTZjlkcFB5V1lFbmFpUkZ6?=
 =?utf-8?B?NWlkMkYvWkdkZTVFY0VvV0pyNmp5NjJOMURTeHBBeEFaTWJKUlk0b0d2ZkV1?=
 =?utf-8?B?dDB4Kyt5NVdKQ250MExvVEFIaTVMa1p0dzhldTJ2N0xVaFJYeGo5bmY4QUNK?=
 =?utf-8?B?cFk5dTd6bXhyeUx2aVFjZXUvREgxWTlTMlJaZFcwM0lCMFFjUFJQZGl5VzRo?=
 =?utf-8?B?ZWFWbjl3Ym1oUi9PUkhLU0F0MG91Z1lYM0Z5K0hRUFplMDI4eGFTY0dNKzdP?=
 =?utf-8?B?UDJvb250ZWVReDdyLzY5K3VUV3kwb3lpelNudngzVGVTSjd3YnNGTUMxcFEz?=
 =?utf-8?B?WGdLMW53WGdPRHlWUitSN05qZ3lidS9nNEZISngxS0R2UE5LRjFicVV4dVJX?=
 =?utf-8?B?dDBSM3FmUHRqRThUOEVIeTBSUUlkaUR0Y2JZS25GZmVJNjN6V0c3cFdhaGtL?=
 =?utf-8?B?Y3psdWFDbkdsWFdYR3czR3dCblpicXhsVTJMUUd6OUJFOWdMZFhxSGFENnNw?=
 =?utf-8?B?T2NGc0NEVEQxMmNCemVnZzUxSGJwcFhyMWtSOWY1bDR4N1JyU25FN25FaVU4?=
 =?utf-8?B?bUxaU212cjA3djNhVUVyYjY5YnlXVkt3M1MvV3hVT254bG9KSHdpWDE4L1RX?=
 =?utf-8?B?ei9BQ3hOSHRUMTBHdkJSZVgxcitGdXJ1UmJFSUs2VXlGdmt4TTZpclp2N2tB?=
 =?utf-8?B?VkVMeDFpejU3emVNS1dzUmljcHNTS3lMeEw0Zk82UTBxNm0vNWhLWWkydmNX?=
 =?utf-8?B?SDM2R3Jha2s0aXVMTzczZVpici9MSjhURzQ5dCtOOWplMGNRd242ZWxkbGE2?=
 =?utf-8?B?SEpWYVN0S1RlM2VKVjgxbFg2TzA4dXdlOGQvUzNTcGUzMm9NOW83UEVpcDJ3?=
 =?utf-8?B?VUpYYmNKbzE0elV6Q2FKR0dBMXEvSUFMRkRBb09VTWt2VTFjNThJOUNRc0lM?=
 =?utf-8?B?aDJjWWFxazFPWWJjdml2T3oyZ3V5WE5ndzNJTk5MWGIrKzZsMnB4MTFmeFJB?=
 =?utf-8?B?ZVU0OGt1YSs5NEFTQTJzV2p5RGVjVUFhOHBKUFBMdXdwOC9rQXgzSnRqWVVm?=
 =?utf-8?B?UEFyNEE4MDR1V2tBbnp6OWZ3Yng3U0xCbnJ2U1NwMTYrZFlvR0lyaFhVejE5?=
 =?utf-8?B?QXBZWVBZUjh3SU81QlBqVkN6SzRPQ0tld0d5ak96US9ISnYwNzg0aW1aekZC?=
 =?utf-8?B?NHRaQWlDb2RnWm1ZVHJYZDRhTlF6QldFUkZJZDNPS3ZYZGEvQ0tIdnd6NXQ3?=
 =?utf-8?B?WERTa0o0T3ZBbytIbElabDd0RDJsTFI1a2dzby9IV2FPRWg4RnBMUzNiclR1?=
 =?utf-8?B?SlVURE1ndFJxVHZiUll3VjhteFI5c05DaWV0cUtUYlVTQVBnN3BZTXQ1MzNF?=
 =?utf-8?B?ZE55alhKNmlZdllFYmM3YW5NOXM0QnBUMGt6WDhNQ2lQR0ZZdVB2SjlZSVEy?=
 =?utf-8?B?VVo3bVU2MWxRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2QwRVlGRXFZVkhRTWlYQ0pQbFRjdlI1aWpIV0JTd05oR0lpVllLNW9sQ3Zh?=
 =?utf-8?B?Z0ZNSlJ2MHNKYk10SkVNZVhWT0pSRFhlb204c2VSdWVZQzFNVGdMSklIRVpN?=
 =?utf-8?B?TkNJcHZTOVFvdTYrUEJHc3VHN2NoRUtKWFZLNFFVRjdVek1BVFNSdC9iZ1JL?=
 =?utf-8?B?STZ2Sm8yT1hWTkFOSkwybWlIVUZsak9GL3Jhd2VQS3JZNVpTV042SjZkZ0lw?=
 =?utf-8?B?bnU2U0R2c2dNKzdIYnBJdEQ2MVEvR0hDa0s2Y3IyRHl4V3ZaRXRJRC9FaXFY?=
 =?utf-8?B?b1orbk1aL0wvZm5DWWN0QXFxM3BCK0ZISXQvVVh0d3d2QWRnVSttbU5WYVdv?=
 =?utf-8?B?a3pKSFg4bXVDWjRVSHNZQnQ3WXlzdnN0QzU4NUJIZHlUUFJGN3paVHZ6Tm9a?=
 =?utf-8?B?b2RsODBjWkFxa0JwZlAvU1VOTmJOcllaR0ZEZWRpNWVwd1FPU0d6NmVPRnFw?=
 =?utf-8?B?eXJPb0NzSjROQjVYNTkxVFhkd1hCNnJvL0J4MUlPNzBPMVgwd3ZyNjJtL2pL?=
 =?utf-8?B?c3JHUGxXS1hJVEZ2WldPa1QwU0tMZDQwaGQrUG81cjVUZlhMb09JdktOTStT?=
 =?utf-8?B?WU05Nml0YWpaMHVBaDRweHB2NThwRUJBSmVXUHozYStNY1Z6b2dTUk9vbFN3?=
 =?utf-8?B?TmIwR2dJZnRyRGwxYlA2RHVWSVloT0N2aGtNVjBzNHVpMmdGc2hTL01TZlRn?=
 =?utf-8?B?K0JBRytPdjdvTGNTZHoyK2lzNW10dVZFNDhUcDdSNHpYZTFuVVFzWkhvZXVm?=
 =?utf-8?B?ZkhEVWNYdldKTndvajIxcjJsNE5pZjBieWxBR2tmWm5kcDhnTnljdmhRV3V2?=
 =?utf-8?B?MXVXNnZNVTlJd2xWZ2ZFVXk5TXM5NnNNUEtwdDNiYWk4UkNFcUJrRVllejFC?=
 =?utf-8?B?WUwycVY3N2V4c1A0V0dSOHU1NFpLTm1jOUc2dnNoM2dORDNaUmJQbHZJcWdh?=
 =?utf-8?B?WDJHTmhocTZKbTBDVmlLbWV2aVRrK1MvM3RsMXhtdm12QSs5YVhUM1Jta1RR?=
 =?utf-8?B?alNCcTU4U3hKZ2R1b0hFaXZmcXRReURtbkh6QXJmbU9JTk5WcnBsSUhkZ3Rp?=
 =?utf-8?B?OFM4UHZxdGVoSGU0a1djL0tlVysyM2F0T1Zha2lERzQrN3VoczBhV2pMNkpD?=
 =?utf-8?B?bWdJVGV2cFVqQ1hkeng2anlwWnBPM29lVTV5VU5FakcvQktTZ0EvQUkwSDhI?=
 =?utf-8?B?RG5qSlRnWG14Tm8zbjFmazFsZlNwVXh6TnZZMi9WbzV2UW0wVUxWdVdSbzhM?=
 =?utf-8?B?alpSVnFBWmpXdnVKaXBGZmt1Q0FzblArT3Ava2FVdzFxTWg4dVhqQWYrUjNW?=
 =?utf-8?B?ZGVxMHJXYlpLNXdYQmkveVZnQWsyUEM4T2h1VDhJNjFZQTlFMlN2cHFncHVI?=
 =?utf-8?B?d2xsQW9TUjVuMEJyTWdXNkVZN0JxekF3SVRWWXJwQ0w3MmFaZmFWOEVSKzBy?=
 =?utf-8?B?cGdKSk1Lcmx3dFBzZ05CN0FBdmdvNUVEUDFnV000cG9QbGhZVUlNaFRza24y?=
 =?utf-8?B?ZEkvNW8vemlUN0Q4M1RCWng5cjlWUFpCdVlnOWNqTkhIV2NZdlpTZFd5bGNo?=
 =?utf-8?B?Y1dvZWs4eExqZ1lwdDl2enczeTNEdTVNVVVvUXRmNVVvK2U3UEdvcTVCanF5?=
 =?utf-8?B?MHhEZ1MvdE1DNE45eDNobEtCaGZXeEVDT3d0NHE1WTlnMm1Va3JxcU8wN0FF?=
 =?utf-8?B?K01oQ0lLV25uNCtGMjQ1YVlVUHBxTTBGS1BtbkhRL3pUN01EbFAvRTRKU3kw?=
 =?utf-8?B?VGhza1Nwd2RDMzdjYXkvMzVRUzlTNjZtakl0S0pzQnozRy9tUXh0RXZzczE3?=
 =?utf-8?B?RUdPSWtrbmtPOStjc3psVXdyUHRYQ0RCOGlZUTF1aCswRE9lNzNkeG5ka2cr?=
 =?utf-8?B?VXBld0JPd1NvZjRuZTl3bExGalNXM0NENFBpNDlpR3E3bDNaMFRmczVpNkRO?=
 =?utf-8?B?a2srTzZmdXZOV0RYMXR1TWdoaVlWTmhNeldFRjFPeTBmQUpqSkpmeEtGby9u?=
 =?utf-8?B?U01jOEl6QWt0RTg0cEM2aks5Z1A1REd2MFZJcERYeG5IUVpoVFY1di80RUhQ?=
 =?utf-8?B?dzJscXFGZXFtSU1rRVdQYnNobkZtNVRHeWZudktIQ1hTbDJ4dWgwdkgzOHc0?=
 =?utf-8?B?K2pIQkYzL0xBRWIrWjQ5Zyt2eU0xVmZscG0wTFFWcmJ0cVpxT2pkaFZqM241?=
 =?utf-8?B?cWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <03FC89B5E03E584AA410E7606711C169@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e240b479-0999-4e6a-97e4-08ddd03e7ef4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 14:28:19.2961 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tIgTvzqAiwD84/5tJp7wmHRIa+BUENZJ+dhEvmq7mvTifea+nmNtObj+Py0aHubzZT6767lFIEn9tw2gpLiUerY1DJf7Kkt0m1hkVUQRnEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5863
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

T24gVGh1LCAyMDI1LTA3LTMxIGF0IDEwOjM4ICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6Cj4g
SWYgdGhlIGJ1ZiArIG9mZnNldCBpcyBub3QgYWxpZ25lZCB0byBYRV9DQUhFTElORV9CWVRFUyB3
ZSBmYWxsYmFjawo+IHRvCj4gdXNpbmcgYSBib3VuY2UgYnVmZmVyLiBIb3dldmVyIHRoZSBib3Vu
Y2UgYnVmZmVyIGhlcmUgaXMgYWxsb2NhdGVkIG9uCj4gdGhlIHN0YWNrLCBhbmQgdGhlIG9ubHkg
YWxpZ25tZW50IHJlcXVpcmVtZW50IGhlcmUgaXMgdGhhdCBpdCdzCj4gbmF0dXJhbGx5IGFsaWdu
ZWQgdG8gdTgsIGFuZCBub3QgWEVfQ0FDSEVMSU5FX0JZVEVTLiBJZiB0aGUgYm91bmNlCj4gYnVm
ZmVyIGlzIGFsc28gbWlzYWxpZ25lZCB3ZSB0aGVuIHJlY3Vyc2UgYmFjayBpbnRvIHRoZSBmdW5j
dGlvbgo+IGFnYWluLAo+IGhvd2V2ZXIgdGhlIG5ldyBib3VuY2UgYnVmZmVyIG1pZ2h0IGFsc28g
bm90IGJlIGFsaWduZWQsIGFuZCBtaWdodAo+IG5ldmVyCj4gYmUgdW50aWwgd2UgZXZlbnR1YWxs
eSBibG93IHRocm91Z2ggdGhlIHN0YWNrLCBhcyB3ZSBrZWVwIHJlY3Vyc2luZy4KPiAKPiBJbnN0
ZWFkIG9mIHVzaW5nIHRoZSBzdGFjayB1c2Uga21hbGxvYywgd2hpY2ggc2hvdWxkIHJlc3BlY3Qg
dGhlCj4gcG93ZXItb2YtdHdvIGFsaWdubWVudCByZXF1ZXN0IGhlcmUuIEZpeGVzIGEga2VybmVs
IHBhbmljIHdoZW4KPiB0cmlnZ2VyaW5nIHRoaXMgcGF0aCB0aHJvdWdoIGV1ZGVidWcuCj4gCj4g
djIgKFN0dWFydCk6Cj4gwqAtIEFkZCBidWlsZCBidWcgY2hlY2sgZm9yIHBvd2VyLW9mLXR3byBy
ZXN0cmljdGlvbgo+IMKgLSBzL0VJTlZBTC9FTk9NRU0vCj4gCj4gRml4ZXM6IDI3MDE3MmY2NGIx
MSAoImRybS94ZTogVXBkYXRlIHhlX3R0bV9hY2Nlc3NfbWVtb3J5IHRvIHVzZSBHUFUKPiBmb3Ig
bm9uLXZpc2libGUgYWNjZXNzIikKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEF1bGQgPG1hdHRo
ZXcuYXVsZEBpbnRlbC5jb20+Cj4gQ2M6IE1hY2llaiBQYXRlbGN6eWsgPG1hY2llai5wYXRlbGN6
eWtAaW50ZWwuY29tPgo+IENjOiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwu
Y29tPgo+IENjOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4KPiAtLS0K
PiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMgfCAzMiArKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tCj4gLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyks
IDEyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
bWlncmF0ZS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jCj4gaW5kZXggM2Ey
NzZlMjM0OGEyLi5iOGQxZWM0YzE4NjEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX21pZ3JhdGUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMKPiBA
QCAtMTk4NywxNSArMTk4NywyMiBAQCBpbnQgeGVfbWlncmF0ZV9hY2Nlc3NfbWVtb3J5KHN0cnVj
dAo+IHhlX21pZ3JhdGUgKm0sIHN0cnVjdCB4ZV9ibyAqYm8sCj4gwqDCoMKgwqDCoMKgwqDCoGlm
ICghSVNfQUxJR05FRChsZW4sIFhFX0NBQ0hFTElORV9CWVRFUykgfHwKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICFJU19BTElHTkVEKCh1bnNpZ25lZCBsb25nKWJ1ZiArIG9mZnNldCwKPiBYRV9D
QUNIRUxJTkVfQllURVMpKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnQg
YnVmX29mZnNldCA9IDA7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHZvaWQgKmJv
dW5jZTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50IGVycjsKPiArCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEJVSUxEX0JVR19PTighaXNfcG93ZXJfb2ZfMihY
RV9DQUNIRUxJTkVfQllURVMpKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYm91
bmNlID0ga21hbGxvYyhYRV9DQUNIRUxJTkVfQllURVMsIEdGUF9LRVJORUwpOwo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIWJvdW5jZSkKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRU5PTUVNOwo+ICsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfYXNzZXJ0KHhlLCBJU19BTElHTkVEKCh1bnNpZ25l
ZCBsb25nKWJvdW5jZSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFhFX0NBQ0hFTElORV9CWVRF
UykpOwoKUGVyc29uYWxseSBJIHRoaW5rIHRoaXMgaXMgYSBsaXR0bGUgb3ZlcmtpbGwuIEkgZ3Vl
c3MgaXQgZG9lcyBzYXZlIHVzCmluIGNhc2UgdGhhdCBwb3ctb2YtMiByZXF1aXJlbWVudCBpbiBr
bWFsbG9jIGNoYW5nZXMsIGJ1dCBhcyBkaXNjdXNzZWQKaW4gZm9yIGluc3RhbmNlIGh0dHBzOi8v
bHduLm5ldC9BcnRpY2xlcy84MDI0NjkvLCBhIGxvdCBvZiBvdGhlciBrZXJuZWwKdXNhZ2VzIHdv
dWxkIGZhaWwgaWYgdGhpcyB3YXMgdGhlIGNhc2UuCgpCdXQgYWxzby4uIG5vdCBhIHByb2JsZW0g
aGF2aW5nIGl0IGVpdGhlciwganVzdCB0aGUgZXh0cmEgY29kZS4KClJldmlld2VkLWJ5OiBTdHVh
cnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgoKVGhhbmtzIGZvciB0aGUgZml4
IQoKLVN0dWFydAoKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIExlc3MgdGhhbiBpZGVhbCBmb3IgbGFy
Z2UgdW5hbGlnbmVkIGFjY2VzcyBidXQKPiB0aGlzIHNob3VsZCBiZQo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICogZmFpcmx5IHJhcmUsIGNhbiBmaXh1cCBpZiB0aGlzIGJlY29t
ZXMgY29tbW9uLgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkbyB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1OCBib3VuY2VbWEVfQ0FDSEVMSU5FX0JZVEVTXTsKPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHZvaWQgKnB0ciA9
ICh2b2lkICopYm91bmNlOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgaW50IGVycjsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpbnQgY29weV9ieXRlcyA9IG1pbl90KGludCwgYnl0ZXNfbGVmdCwKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBYRV9DQUNIRUxJTkVfQllURVMgLQo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChvZmZzZXQgJgo+IFhFX0NBQ0hFTElO
RV9NQVNLKSk7Cj4gQEAgLTIwMDQsMjIgKzIwMTEsMjIgQEAgaW50IHhlX21pZ3JhdGVfYWNjZXNz
X21lbW9yeShzdHJ1Y3QKPiB4ZV9taWdyYXRlICptLCBzdHJ1Y3QgeGVfYm8gKmJvLAo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVyciA9IHhlX21pZ3Jh
dGVfYWNjZXNzX21lbW9yeShtLCBibywKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgb2Zmc2V0ICYKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiB+WEVfQ0FDSEVMSU5FX01BU0ssCj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHZvaWQgKilwdHIs
Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiBz
aXplb2YoYm91bmNlKSwgMCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgYm91bmNlLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgCj4gWEVfQ0FDSEVMSU5FX0JZVEVTLCAwKTsKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoZXJyKQo+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dHVybiBlcnI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAod3JpdGUpIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtZW1jcHkocHRyICsg
cHRyX29mZnNldCwgYnVmICsKPiBidWZfb2Zmc2V0LCBjb3B5X2J5dGVzKTsKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtZW1j
cHkoYm91bmNlICsgcHRyX29mZnNldCwgYnVmICsKPiBidWZfb2Zmc2V0LCBjb3B5X2J5dGVzKTsK
PiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBlcnIgPSB4ZV9taWdyYXRlX2FjY2Vzc19tZW1vcnkobSwgYm8sCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBvZmZzZXQKPiAmIH5YRV9DQUNIRUxJTkVfTUFTSywKPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHZvaWQK
PiAqKXB0ciwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAKPiBzaXplb2YoYm91bmNlKSwgd3JpdGUpOwo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oAo+IGJvdW5jZSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiBYRV9DQUNIRUxJTkVfQllURVMsIHdyaXRlKTsKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaWYgKGVycikKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGVycjsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgfSBlbHNlIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtZW1jcHkoYnVmICsgYnVmX29mZnNl
dCwgcHRyICsKPiBwdHJfb2Zmc2V0LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG1lbWNweShidWYgKyBidWZfb2Zmc2V0LCBi
b3VuY2UgKwo+IHB0cl9vZmZzZXQsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb3B5X2J5dGVzKTsK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqAK
PiBAQCAtMjAyOCw3ICsyMDM1LDggQEAgaW50IHhlX21pZ3JhdGVfYWNjZXNzX21lbW9yeShzdHJ1
Y3QgeGVfbWlncmF0ZQo+ICptLCBzdHJ1Y3QgeGVfYm8gKmJvLAo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG9mZnNldCArPSBjb3B5X2J5dGVzOwo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfSB3aGlsZSAoYnl0ZXNfbGVmdCk7Cj4gwqAK
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGtmcmVlKGJvdW5jZSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHJldHVybiBlcnI7Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+IMKgwqDCoMKg
wqDCoMKgwqBkbWFfYWRkciA9IHhlX21pZ3JhdGVfZG1hX21hcCh4ZSwgYnVmLCBsZW4gKyBwYWdl
X29mZnNldCwKPiB3cml0ZSk7Cgo=
