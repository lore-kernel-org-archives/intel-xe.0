Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB340C02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 15:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6438210E888;
	Thu,  6 Feb 2025 15:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PVUfPTHf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370F010E888
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 15:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738854881; x=1770390881;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yk+edVF0mc5x8vafd/OktahYTuAAi5eKIQSZyYv1Fj4=;
 b=PVUfPTHfRj8nAmdRg2MMHzmgH/dIoqpQAdBYRHy1JvezRn6BzWW2sSyf
 5Pz3ohqA3u22rF1VJtlLRb34IAEjeXMPoR0razh/sU3jsS8WcKr1oR2Br
 NDRF6BYMzRTmnNU/z/YrIiF2zRpweL3Cly4r4mvAyQo0lw49iF1jWshlA
 2OY+hFMvwB7JdyhegCHWLm+oG1hzgbhGnAkA4vGnLn/mgVKrMGA2YSwXk
 0hWR16/MKZw8QUN46MDx9kyRBNRNxGZmUZ9AkyR1Qo7IcYFxxuMKyC8WV
 DyoRVtabv9nJmWXn55lgIrBGiS1JujaZdXELYd52suSHv76ORxdhavYml Q==;
X-CSE-ConnectionGUID: oMxL199KToWk8zyqmmRKOg==
X-CSE-MsgGUID: 5RlRdCl4TwmwKDKqrOoYVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42296151"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="42296151"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 07:14:41 -0800
X-CSE-ConnectionGUID: M4DAurjYT+ufTG6vrxQ+jQ==
X-CSE-MsgGUID: A605G6YwQRijiX/O2FJcrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111084340"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 07:14:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 07:14:40 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 07:14:40 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 07:14:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIVp364191TAeOLWkAa7p5itf8Xr4m/jgdRNRHU0vnSmxJUodaq9aOBB6L44I/PR8LMYIYzsZ6/ewubuNqY4UWUYTtgWQE+S99qe37qEtuUxvRPN+8+QMlQy1cUKDB5jQC7uOwU4vk41MUL4rWJ6Qknax4PSqQKOr3oBnzg0eWNJb3bKL4MJB0vZYdKbfuM0p7aH0RrvtZpMjFLNqYD2hmTXv6prpNXcQ1Yn04vqbtFxf88PHWo2rladXRoJ0E43jrkhhRL75N57RCOOWJpsTZI5QJR5sNVwkuVXurLkF1AECtMRBMhOC2tiLbz82oVCbcTvTDlsZvq4a7ehx0Y4IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yk+edVF0mc5x8vafd/OktahYTuAAi5eKIQSZyYv1Fj4=;
 b=oDg6xYZg2BFVxjgAExVlZq0057/EhG/wT8Xuxklmx73CxEW5d56P+VC4KuDjNHXlA99d0lSfgQHzJYe6w+hPA+jed3Gn2x0hoh4wY1k5bADsS6sQGDKxofu6raN7qT4j6+z6woF3JyZ+Ss5yoHjCLz8HS3+yG1lFngIRg8y9YnYrZOiDi8NSr3RRs69ctMR0qj/RRyktr+xECJAdNNIl6gxCP9WHswXFVpXfXQ1QNH3I52xtKWtNVjRWnL1c3EhUueXhj5n7akRcbKpp0OLtib7QwCMUG8PeaJSqcgWxPnCoBBAyyhZKB5l+5IboOZYkYiSfhuj1I1VOumswOShXvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4728.namprd11.prod.outlook.com (2603:10b6:208:261::17)
 by MN0PR11MB6254.namprd11.prod.outlook.com (2603:10b6:208:3c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 15:14:36 +0000
Received: from MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf]) by MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf%7]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 15:14:36 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 3/3] drm/xe: Allow scratch page under fault mode for
 certain platform
Thread-Topic: [PATCH 3/3] drm/xe: Allow scratch page under fault mode for
 certain platform
Thread-Index: AQHbdzMAz2icu23EZUWDO+GW412BELM4sU+AgADT2HCAAH/GgIAAYDEg
Date: Thu, 6 Feb 2025 15:14:36 +0000
Message-ID: <MN2PR11MB4728185783524A473CDE738F92F62@MN2PR11MB4728.namprd11.prod.outlook.com>
References: <20250204184558.4181478-1-oak.zeng@intel.com>
 <20250204184558.4181478-3-oak.zeng@intel.com>
 <68c890a3baff21199f6aca82dccdd024f56de199.camel@linux.intel.com>
 <MN2PR11MB4728736D182B9C0671A8501692F62@MN2PR11MB4728.namprd11.prod.outlook.com>
 <98073717d6ba2fe5de729315e165f7d77f850c45.camel@linux.intel.com>
In-Reply-To: <98073717d6ba2fe5de729315e165f7d77f850c45.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4728:EE_|MN0PR11MB6254:EE_
x-ms-office365-filtering-correlation-id: 02ca48f2-c523-49d4-f67a-08dd46c0f841
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bDQrZzJmSlh3c3MwSXZhWVhVTFlmRDd4OHZJM2gwTDJqSTdKUndSTkZPbVNQ?=
 =?utf-8?B?YVVFVnEzUjBlVkFkWjRZa2VIRnBnRVpnYzZTTnowMEl5RWVtM09LM3F6VDNJ?=
 =?utf-8?B?ejFHQi9IaERNdFNxR1gvUENZUWFLLzZmcnR5Z05xaEFjZmxxTmVza0VtN0J2?=
 =?utf-8?B?emxMMlVDVUtqTmM2NEdXZkI2L3JUdEI0NmEySGhUUkFLUFphZGlaS2N3bmZR?=
 =?utf-8?B?QU4va3pYcllVUHQ5WnhLKyt0Y0lUcFd4RlhEZFFSbkgrR2JRaGEzVWhRd3Nh?=
 =?utf-8?B?M0Rxb3dhNjRFQlk0UmpiSmNYVHJrNjkwdlE5QnFySWd5dFpVZUNsUGQyZHcw?=
 =?utf-8?B?aUJCMEZxdlRiMGFLZ1ljbjNBSDFRRWlyYjRxY3ZLTURBc3c1aU4welF3K1JY?=
 =?utf-8?B?ZEpCaVBmdnV3S1RhRmRjZnNZbGxqZXRVWS9hQjlHVUovUWxzc0xnS3dKL1JJ?=
 =?utf-8?B?M0ZBanh5Mklab3JjQXJXalY3MnBHL2hlWFVFM3JUNCtyZDY5ZnJ6ZnRZdlln?=
 =?utf-8?B?dDBUbWVZR1pYQnZKa21iYjQ1b1lUYlVVNHJ0QXZvblhVMERHYmM4RzVJK250?=
 =?utf-8?B?WU1SYnNSWlBaVUpXWDlueWJocXE3YS9vblhTaytPL05JTzdzNkxUemx1VUFV?=
 =?utf-8?B?ZldPOERyV0ZQVHBwVDByZ1FRbjVVYnFxWTlWSXpYRzlPcU9oODRRVDM0SjZO?=
 =?utf-8?B?bmhxYVg3aVNBMm1JU2g0ZTF3SXhBbHF6V25hOENFMzdxdTRJNVJ0WVB2T21j?=
 =?utf-8?B?dzhLeWdFUzM4bTl1dHR3Znl6bHRPY1B4VDdTRUJQL0pRZnQ3dmJHdEt2N1hk?=
 =?utf-8?B?em94VHBYOHFJVVFaWVJqY0VzaVlSS1FIQXVqY1VoSzZndXBZcUJ1L0wrN0RO?=
 =?utf-8?B?VjdnTWdDeHV5VmlyeS9PTUtoQ1JVUzZDOFNUUzNuQXNOV0R3NUZSZ2F2ZUM4?=
 =?utf-8?B?NkxvTDhlQXR4c1JhUFNNRDNJYmk3aXZyZ0JwZW1MWmlVMXZhNTBWSDNmN1Nw?=
 =?utf-8?B?K0lJTEtuaTdVcE5yM2VFL05FOG90b0lLTjZVNXd5UHFKMlV6TWZPZ0hiS3hR?=
 =?utf-8?B?dVJlL05XQnQrU0l1cWl4S0t4bFBpYnROUnFucXB1YWJtMlZpYWNqK2dWSXFy?=
 =?utf-8?B?cU01S05UYlJCTE5sZFhRd28vN1ovQVlQSVJDU3htb2FRZFUzNzRQd3BibTM5?=
 =?utf-8?B?NFNtdDNpUU4rTEtiYmFLQlNKdkhGSVRCdlhOV2VEN1FQSWNRUnBQc3VzZEox?=
 =?utf-8?B?eFh3VDRZZExuMWJJN3pJakpFSy9KdVU4cUdqVUlVekZEZno3UHlMZnRPclVU?=
 =?utf-8?B?cnVoYVZ0aE41MmU0c3FDT0szaUNtWGloVHZNRG9TOS9FKzl2TXkzc1RXMDI3?=
 =?utf-8?B?dTVEZnhMQm9QQ0F3dFVvRGpqVE9wVW9wbnp5V0w5c2pNeG12MG9ZemtZeFFs?=
 =?utf-8?B?OUZFcU0rQVpRdWVJTTE5NHlsVWpGaXBla2JDS0lXWkw2VWtIek9wQVlROHVx?=
 =?utf-8?B?SkhrWWJnditHbjFxNmVVQnVTQXo0ZHo5MjBBYVJpZHVWRVorMForakdUMytC?=
 =?utf-8?B?cmJKN0NsdnFqOEo1MUh1TThuWTl2ZkZ2T3NKNFB2ZExPRkJ5VkNZOGlsSHdM?=
 =?utf-8?B?S1ZrTXMzVjhRS2RtZ0h5NzlZcnB3cjdwSkNHUHpyMFZFdHZicDVtK2toQ0Er?=
 =?utf-8?B?eGZPS284UEI5dGc3QTZoZDE2aElydTY2eG1RY1JGOGJZdnRUblhQZkcxT0kz?=
 =?utf-8?B?WHpNTWh6R1hZcmdMNS9sT2I2QzdxanFLOHg2MThUd0F3SkEyYjFyVU8ya0dJ?=
 =?utf-8?B?b1pSamdFa1lXMlVSaGl6cThwa3k0R3ZYSWxob09uSFU2dHI4S0wrRG9UVXdt?=
 =?utf-8?Q?tIU+Zk9om6v/F?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4728.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzRmQ05sNWg4Qy9BZjRpck1CUGhHVURzdUxqN1A2Tk9vellaOGJBU1dEb3pU?=
 =?utf-8?B?bDVMVVBuMTdGMWNXM25QVDgvODV2Q0RVZEVncVRYdStZc1laRUlDZHZqdHBh?=
 =?utf-8?B?QTFtODRuNzN3ZWZ1M0NpRkh4L0xlai9yRUV4MXV2UWxLcyswLzdMOTA5c083?=
 =?utf-8?B?bHYzL1VMQ1FUMisyUU56SDJ2ZE96RjRIZ0xRL1pmdW1paG14azlCNXpzU3BN?=
 =?utf-8?B?Nzl4OEFidHo0eGFlb2R2ZFlvMUNBc1JSQzE2Vm01TjFqMFZXcXo3Mmo0OTNo?=
 =?utf-8?B?cnJXOWhrbXNrT1daUGlTTG5VRDNvaWlsejVqN1lnV3krb2Z4Q2ZITXArMWlN?=
 =?utf-8?B?aks3UnI4clF2NCsxYTlaSzVZdkw4WThIdFE2ek10V1FzcldnSlA5bVZGckZF?=
 =?utf-8?B?Q3VocDd0RmlCZHh6RDNCVzQ1MWttb1ZkMk10WDN3Tnl0NjI5WmpPV3M5aUk2?=
 =?utf-8?B?WWU5ZTY3Q2thTld1M290Zk4vTnZ0OVZMREVYSTZON2lkN0tPa09LNDRCU0V2?=
 =?utf-8?B?cVAyMW1KVUtzNzhRNkpVVG5Qbkd3VjRaV1VTSWYyQzBnck5GbG1sNE5yeVhk?=
 =?utf-8?B?R011ZFpjbmF3VHlNNWpGMTY2Z2FabktEZ3FoMEFMM2hqSERhaiswRXUvMkNX?=
 =?utf-8?B?TXVGU0NaRzZMNHhrVDR2c09QYUlEK2t1QkJOdHd2MHlvMEh6dmFLbDRjWkkz?=
 =?utf-8?B?eFJKL1U5RFFmRDdYZUgyUG1kOHdMYXJZbjBRMWV0ZnVxUllOa0ZoRjVpb0h0?=
 =?utf-8?B?c2h3blc1RDA4Zm4zNGMrY29xc25McTVVb0pERjdoZjhDL1o3OGx4b094MkhU?=
 =?utf-8?B?NkZqWUw0WCtHRzZWN2hDZzA0YjZ1L1pWdHQ1Ync1ZnBnV0gvUjdKVmtZZzFt?=
 =?utf-8?B?UnM2NDdhb25lb0s4cGFKSWwzamVQMVVmUERiNGQ5dFdnVGtSMy9xc0NjR3VP?=
 =?utf-8?B?Y3VxK1FnQmwyWWs4K3JiUlRjVDFreEhQK1ZsS3p3dWdrbUNMQW5ZNFB3RDNn?=
 =?utf-8?B?MDBMUGtnRFVzYnpta25VeDhTYld0STFmdHJJQzZmOGhXYkt1alVJQlRqSU9X?=
 =?utf-8?B?Y05OTmN4UU85aFRqb3ZSVHJRVTZ4MGo0NVk5WllxUEIrZ29sZis1UUhNS0Vz?=
 =?utf-8?B?azhUUStMNUxMRWhCakhNc2FuQ05pMER1RENuQ0IwMUJwa2lqcFpUeVlFSDlI?=
 =?utf-8?B?RDlaMytENVR1bWhjL1p4WFpyTmxseEdBYnNUcjBUR1N0WGhUSUZhL0txRHVZ?=
 =?utf-8?B?OUgwaE1EVXdtTjBHTTNGREVpc2lsSHhFeGlUQzg3ZjZ3NWdKS09pK3VZUTNj?=
 =?utf-8?B?YUhvUG9uMnFYQitZSUppOUNCSll4anRrZ294TDhrcjF3MjFlNktndUNua2tr?=
 =?utf-8?B?ZTlHVWlqcnU5TnFRdzh1elM5VWNOUWUzSnBFOU9vTHdrRkJOQ3dVVUQ3QkNa?=
 =?utf-8?B?UkdURERFSkpuekc3VmpVVjl6bW1XMG9TcVhOWm1BZUx5U3dvNUdjM0ZmeDN4?=
 =?utf-8?B?ZCtjN3p2VC9NMlNNaTZ6RVVIR0t2a0M5cXFUNHhNRG9JcWJhb0dvQkg5VmQv?=
 =?utf-8?B?MFVpVGZrNDBiODBoeVhSM1RFQkp5cXgxS0FvdVpzbTZIQ1oyY3hXMGtTZnBy?=
 =?utf-8?B?N0g5UERRdmMwV3diQ0dCbzdSdVFISUc4eTFQOG9va3Y3SjdwamdLNDhwR1No?=
 =?utf-8?B?aWp2YTFkSjc2Z25ocUQyRDNCRUxLVTIzSFgwWTcxRlprMlpKdXVsZzl6bXNO?=
 =?utf-8?B?YVoyRWhlb2JpMzJQUzkzZzF0QzdKRFhhdnhjOTZYWnkwbzYvblBPaE5ZN1Zt?=
 =?utf-8?B?dnlNV1ZLdzQ1L3VwL1puTVVyUDFNeWVBNkVCU3Z4czZMWjdFQXlFN1NIbi9Z?=
 =?utf-8?B?TlJoK09sSFZ5QndlaFJMS3B4NzMzWDQycWpOMTBYZUtBZzdtRC8rTHExZEo0?=
 =?utf-8?B?K0d3NmZvOEpVTk14Zk1PdFVPeU9YeGdKbENuQ2JkQVZmV1hWWWlMdGJ1N2I2?=
 =?utf-8?B?dkRPRWY2VzBsUlE4OEdQam5uKzBWZURKRTRwZXBVaFpMeFNrYkJEdWRGbDVH?=
 =?utf-8?B?eXJUOForNWoydUlOZWR1d2o0SjV3UjZ5aXUrZCtha0s0eEdwbkNlMERLRWhk?=
 =?utf-8?Q?R62g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4728.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ca48f2-c523-49d4-f67a-08dd46c0f841
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 15:14:36.8941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MGoGmqO1gkn2L1bByq4/FsNs1LbIjwmEezVf8z3qsjyqzrWoYv5YiWBgPwWQlT9keggy1cfbxrQYpQqiBh5VjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6254
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhvbWFzIEhlbGxzdHLD
tm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBGZWJydWFyeSA2
LCAyMDI1IDQ6MzAgQU0NCj4gVG86IFplbmcsIE9hayA8b2FrLnplbmdAaW50ZWwuY29tPjsgaW50
ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBCcm9zdCwgTWF0dGhldyA8bWF0dGhl
dy5icm9zdEBpbnRlbC5jb20+OyBDYXZpdHQsIEpvbmF0aGFuDQo+IDxqb25hdGhhbi5jYXZpdHRA
aW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvM10gZHJtL3hlOiBBbGxvdyBzY3Jh
dGNoIHBhZ2UgdW5kZXIgZmF1bHQNCj4gbW9kZSBmb3IgY2VydGFpbiBwbGF0Zm9ybQ0KPiANCj4g
T24gVGh1LCAyMDI1LTAyLTA2IGF0IDAxOjU0ICswMDAwLCBaZW5nLCBPYWsgd3JvdGU6DQo+ID4N
Cj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IFRob21h
cyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gPiA+IFNl
bnQ6IEZlYnJ1YXJ5IDUsIDIwMjUgODoxNCBBTQ0KPiA+ID4gVG86IFplbmcsIE9hayA8b2FrLnpl
bmdAaW50ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+ID4g
Q2M6IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47IENhdml0dCwgSm9u
YXRoYW4NCj4gPiA+IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiA+ID4gU3ViamVjdDog
UmU6IFtQQVRDSCAzLzNdIGRybS94ZTogQWxsb3cgc2NyYXRjaCBwYWdlIHVuZGVyIGZhdWx0DQo+
ID4gPiBtb2RlIGZvciBjZXJ0YWluIHBsYXRmb3JtDQo+ID4gPg0KPiA+ID4gT24gVHVlLCAyMDI1
LTAyLTA0IGF0IDEzOjQ1IC0wNTAwLCBPYWsgWmVuZyB3cm90ZToNCj4gPiA+ID4gTm9ybWFsbHkg
c2NyYXRjaCBwYWdlIGlzIG5vdCBhbGxvd2VkIHdoZW4gYSB2bSBpcyBvcGVyYXRlDQo+IHVuZGVy
DQo+ID4gPiBwYWdlDQo+ID4gPiA+IGZhdWx0IG1vZGUsIGkuZS4sIGluIHRoZSBleGlzdGluZyBj
b2RlcywNCj4gPiA+ID4gRFJNX1hFX1ZNX0NSRUFURV9GTEFHX1NDUkFUQ0hfUEFHRQ0KPiA+ID4g
PiBhbmQgRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0ZBVUxUX01PREUgYXJlIG11dHVhbA0KPiA+ID4g
ZXhjbHVzaXZlLiBUaGUgcmVhc29uDQo+ID4gPiA+IGlzIGZhdWx0IG1vZGUgcmVsaWVzIG9uIHJl
Y292ZXJhYmxlIHBhZ2UgdG8gd29yaywgd2hpbGUgc2NyYXRjaA0KPiA+ID4gPiBwYWdlDQo+ID4g
PiA+IGNhbiBtdXRlIHJlY292ZXJhYmxlIHBhZ2UgZmF1bHQuDQo+ID4gPiA+DQo+ID4gPiA+IE9u
IHhlMiBhbmQgeGUzLCBvdXQgb2YgYm91bmQgcHJlZmV0Y2ggY2FuIGNhdXNlIHBhZ2UgZmF1bHQg
YW5kDQo+ID4gPiA+IGZ1cnRoZXINCj4gPiA+ID4gc3lzdGVtIGhhbmcgYmVjYXVzZSB4ZWttZCBj
YW4ndCByZXNvbHZlIHN1Y2ggcGFnZSBmYXVsdC4gU1lDTA0KPiBhbmQNCj4gPiA+IE9DTA0KPiA+
ID4gPiBsYW5ndWFnZSBydW50aW1lIHJlcXVpcmVzIG91dCBvZiBib3VuZCBwcmVmZXRjaCB0byBi
ZSBzaWxlbnRseQ0KPiA+ID4gPiBkcm9wcGVkDQo+ID4gPiA+IHdpdGhvdXQgY2F1c2luZyBhbnkg
ZnVuY3Rpb25hbCBwcm9ibGVtLCB0aHVzIHRoZSBleGlzdGluZw0KPiA+ID4gPiBiZWhhdmlvcg0K
PiA+ID4gPiBkb2Vzbid0IG1lZXQgbGFuZ3VhZ2UgcnVudGltZSByZXF1aXJlbWVudC4NCj4gPiA+
ID4NCj4gPiA+ID4gQXQgdGhlIHNhbWUgdGltZSwgSFcgcHJlZmV0Y2hpbmcgY2FuIGNhdXNlIHBh
Z2UgZmF1bHQgaW50ZXJydXB0Lg0KPiA+ID4gRHVlDQo+ID4gPiA+IHRvDQo+ID4gPiA+IHBhZ2Ug
ZmF1bHQgaW50ZXJydXB0IG92ZXJoZWFkIChpLmUuLCBuZWVkIEd1YyBhbmQgS01EIGludm9sdmVk
DQo+IHRvDQo+ID4gPiBmaXgNCj4gPiA+ID4gdGhlIHBhZ2UgZmF1bHQpLCBIVyBwcmVmZXRjaGlu
ZyBjYW4gYmUgc2xvd2VkIGJ5IG1hbnkgb3JkZXJzDQo+IG9mDQo+ID4gPiA+IG1hZ25pdHVkZS4N
Cj4gPiA+ID4NCj4gPiA+ID4gRml4IHRob3NlIHByb2JsZW1zIGJ5IGFsbG93aW5nIHNjcmF0Y2gg
cGFnZSB1bmRlciBmYXVsdCBtb2RlDQo+IGZvcg0KPiA+ID4geGUyDQo+ID4gPiA+IGFuZA0KPiA+
ID4gPiB4ZTMuIFdpdGggc2NyYXRjaCBwYWdlIGluIHBsYWNlLCBIVyBwcmVmZXRjaGluZyBjb3Vs
ZCBhbHdheXMgaGl0DQo+ID4gPiA+IHNjcmF0Y2gNCj4gPiA+ID4gcGFnZSBpbnN0ZWFkIG9mIGNh
dXNpbmcgaW50ZXJydXB0Lg0KPiA+ID4gPg0KPiA+ID4gPiBBIHNpZGUgZWZmZWN0IGlzLCBzY3Jh
dGNoIHBhZ2UgY291bGQgaGlkZSBhcHBsaWNhdGlvbiBwcm9ncmFtDQo+ID4gPiA+IGVycm9yLg0K
PiA+ID4gPiBBcHBsaWNhdGlvbiBvdXQgb2YgYm91bmQgYWNjZXNzZXMgYXJlIGhpZGVkDQo+ID4g
PiBzL2hpZGVkL2hpZGRlbi8NCj4gPiA+DQo+ID4gPiA+IMKgYnkgc2NyYXRjaCBwYWdlIG1hcHBp
bmcsDQo+ID4gPiA+IGluc3RlYWQgb2YgZ2V0IHJlcG9ydGVkIHRvIHVzZXIuDQo+ID4gPiA+DQo+
ID4gPiA+IGlndCB0ZXN0OiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVz
LzE0NDMzNC8uDQo+IFRlc3QNCj4gPiA+ID4gcmVzdWx0IG9uDQo+ID4gPiA+IEJNRzoNCj4gPiA+
ID4NCj4gPiA+ID4gcm9vdEBEVVQxMTMwQk1HRlJEOi9ob21lL3N6ZW5nL2RpaS10b29scy9pZ3Qt
DQo+ID4gPiBwdWJsaWMvYnVpbGQvdGVzdHMjDQo+ID4gPiA+IC4veGVfZXhlY19mYXVsdF9tb2Rl
IC0tcnVuLXN1YnRlc3Qgc2NyYXRjaC1mYXVsdA0KPiA+ID4gPiBJR1QtVmVyc2lvbjogMS4zMC1n
ZGUxYTNjYjQyICh4ODZfNjQpIChMaW51eDogNi4xMy4wLXhlIHg4Nl82NCkNCj4gPiA+ID4gVXNp
bmcgSUdUX1NSQU5ET009MTczODY4NDgwNSBmb3IgcmFuZG9taXNhdGlvbg0KPiA+ID4gPiBPcGVu
ZWQgZGV2aWNlOiAvZGV2L2RyaS9jYXJkMA0KPiA+ID4gPiBTdGFydGluZyBzdWJ0ZXN0OiBzY3Jh
dGNoLWZhdWx0DQo+ID4gPiA+IFN1YnRlc3Qgc2NyYXRjaC1mYXVsdDogU1VDQ0VTUyAoMC4wODBz
KQ0KPiA+ID4gPg0KPiA+ID4gPiBXaXRob3V0IHRoaXMgc2VyaWVzLCB0aGUgdGVzdCByZXN1bHQg
aXM6DQo+ID4gPiA+DQo+ID4gPiA+IHJvb3RARFVUMTEzMEJNR0ZSRDovaG9tZS9zemVuZy9kaWkt
dG9vbHMvaWd0LQ0KPiA+ID4gcHVibGljL2J1aWxkL3Rlc3RzIw0KPiA+ID4gPiAuL3hlX2V4ZWNf
ZmF1bHRfbW9kZSAtLXJ1bi1zdWJ0ZXN0IHNjcmF0Y2gtZmF1bHQNCj4gPiA+ID4gSUdULVZlcnNp
b246IDEuMzAtZ2RlMWEzY2I0MiAoeDg2XzY0KSAoTGludXg6IDYuMTMuMC14ZSB4ODZfNjQpDQo+
ID4gPiA+IFVzaW5nIElHVF9TUkFORE9NPTE3Mzg2ODYwNDYgZm9yIHJhbmRvbWlzYXRpb24NCj4g
PiA+ID4gT3BlbmVkIGRldmljZTogL2Rldi9kcmkvY2FyZDANCj4gPiA+ID4gU3RhcnRpbmcgc3Vi
dGVzdDogc2NyYXRjaC1mYXVsdA0KPiA+ID4gPiAoeGVfZXhlY19mYXVsdF9tb2RlOjUwNDcpIENS
SVRJQ0FMOiBUZXN0IGFzc2VydGlvbiBmYWlsdXJlDQo+ID4gPiBmdW5jdGlvbg0KPiA+ID4gPiB0
ZXN0X2V4ZWMsIGZpbGUgLi4vdGVzdHMvaW50ZWwveGVfZXhlY19mYXVsdF9tb2RlLmM6MzQ5Og0K
PiA+ID4gPiAoeGVfZXhlY19mYXVsdF9tb2RlOjUwNDcpIENSSVRJQ0FMOiBGYWlsZWQgYXNzZXJ0
aW9uOg0KPiA+ID4gPiBfX3hlX3dhaXRfdWZlbmNlKGZkLCAmZXhlY19zeW5jW2ldLCAweGRlYWRi
ZWVmZGVhZGJlZWZ1bGwsDQo+ID4gPiA+IGV4ZWNfcXVldWVzW2kgJSBuX2V4ZWNfcXVldWVzXSwg
JnRpbWVvdXQpID09IDANCj4gPiA+ID4gKHhlX2V4ZWNfZmF1bHRfbW9kZTo1MDQ3KSBDUklUSUNB
TDogTGFzdCBlcnJubzogNjIsIFRpbWVyDQo+IGV4cGlyZWQNCj4gPiA+ID4gKHhlX2V4ZWNfZmF1
bHRfbW9kZTo1MDQ3KSBDUklUSUNBTDogZXJyb3I6IC02MiAhPSAwDQo+ID4gPiA+IFN0YWNrIHRy
YWNlOg0KPiA+ID4gPiDCoCAjMCAuLi9saWIvaWd0X2NvcmUuYzoyMjY2IF9faWd0X2ZhaWxfYXNz
ZXJ0KCkNCj4gPiA+ID4gwqAgIzEgLi4vdGVzdHMvaW50ZWwveGVfZXhlY19mYXVsdF9tb2RlLmM6
MzQ2IHRlc3RfZXhlYygpDQo+ID4gPiA+IMKgICMyIC4uL3Rlc3RzL2ludGVsL3hlX2V4ZWNfZmF1
bHRfbW9kZS5jOjUzNw0KPiA+ID4gPiBfX2lndF91bmlxdWVfX19fcmVhbF9tYWluNDA3KCkNCj4g
PiA+ID4gwqAgIzMgLi4vdGVzdHMvaW50ZWwveGVfZXhlY19mYXVsdF9tb2RlLmM6NDA3IG1haW4o
KQ0KPiA+ID4gPiDCoCAjNCAuLi9zeXNkZXBzL25wdGwvbGliY19zdGFydF9jYWxsX21haW4uaDo3
NA0KPiA+ID4gPiBfX2xpYmNfc3RhcnRfY2FsbF9tYWluKCkNCj4gPiA+ID4gwqAgIzUgLi4vY3N1
L2xpYmMtc3RhcnQuYzoxMjggX19saWJjX3N0YXJ0X21haW5AQEdMSUJDXzIuMzQoKQ0KPiA+ID4g
PiDCoCAjNiBbX3N0YXJ0KzB4MmVdDQo+ID4gPiA+IFN1YnRlc3Qgc2NyYXRjaC1mYXVsdCBmYWls
ZWQuDQo+ID4gPiA+DQo+ID4gPiA+IHYyOiBSZWZpbmUgY29tbWl0IG1lc3NhZ2UgKFRob21hcykN
Cj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPG9hay56ZW5nQGludGVs
LmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMg
fCA5ICsrKysrLS0tLQ0KPiA+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfdm0uYw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiA+
ID4gPiBpbmRleCA4MTNkODkzZDliNjMuLmMwMzcyZjA4M2Q0MiAxMDA2NDQNCj4gPiA+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3ZtLmMNCj4gPiA+ID4gQEAgLTE3NTIsNiArMTc1MiwxMSBAQCBpbnQgeGVfdm1f
Y3JlYXRlX2lvY3RsKHN0cnVjdA0KPiA+ID4gZHJtX2RldmljZSAqZGV2LA0KPiA+ID4gPiB2b2lk
ICpkYXRhLA0KPiA+ID4gPiDCoAlpZiAoWEVfSU9DVExfREJHKHhlLCBhcmdzLT5leHRlbnNpb25z
KSkNCj4gPiA+ID4gwqAJCXJldHVybiAtRUlOVkFMOw0KPiA+ID4gPg0KPiA+ID4gPiArCWlmIChY
RV9JT0NUTF9EQkcoeGUsIGFyZ3MtPmZsYWdzICYNCj4gPiA+ID4gRFJNX1hFX1ZNX0NSRUFURV9G
TEFHX1NDUkFUQ0hfUEFHRSAmJg0KPiA+ID4gPiArCQkJIGFyZ3MtPmZsYWdzICYNCj4gPiA+ID4g
RFJNX1hFX1ZNX0NSRUFURV9GTEFHX0ZBVUxUX01PREUgJiYNCj4gPiA+ID4gKwkJCSAhKE5FRURT
X1NDUkFUQ0goeGUpKSkpDQo+ID4gPiA+ICsJCXJldHVybiAtRUlOVkFMOw0KPiA+ID4gPiArDQo+
ID4gPg0KPiA+ID4gV2Ugc2hvdWxkIHByb2JhYmx5IG1vdmUgdGhpcyB0ZXN0IHRvIHdoZXJlIHRo
ZSBvbGQgdGVzdCB3ZXJlDQo+IGJlbG93LA0KPiA+ID4gc2luY2UgdGhlIFdBIGJlbG93IGVuYWJs
ZXMgc2NyYXRjaCBwYWdlcy4NCj4gPg0KPiA+DQo+ID4gQmVsb3cgd2EgY29kZSBpcyBmb3IgZGcy
Lg0KPiA+IElmIHdlIG1vdmUgdGhpcyB0ZXN0IGJlbG93IHRoZSB3YSBjb2RlLCB0aGVuIG9uIGRn
MiwgaWYgcGVvcGxlDQo+IGNyZWF0ZQ0KPiA+IHZtDQo+ID4gV2l0aCBGQVVMVF9NT0RFIHwgTFJf
TU9ERSwgYWJvdmUgY2hlY2sgd291bGQgZmFpbCB1c2VyLg0KPiANCj4gVGhvdWdoIG9uIERHMiB3
ZSBkb24ndCBzdXBwb3J0IGZhdWx0IG1vZGUuDQo+IA0KPiA+DQo+ID4gU28gSSBkbyB0aGluayB3
ZSBzaG91bGQga2VlcCB0aGlzIGNoZWNrIGFib3ZlIHdhIGNvZGVzLg0KPiANCj4gSSB0aGluayB3
aGF0IG1hdHRlcnMgaGVyZSBpcyByZWFkYWJpbGl0eSBvZiB0aGUgY29kZS4gQSBuYWl2ZSByZWFk
ZXINCj4gKGxpa2UgbWUgaW4gdGhpcyBjYXNlKSB3b3VsZCBzdGFydCB0byB3b25kZXIgd2h5IGVu
YWJsaW5nIHNjcmF0Y2gNCj4gcGFnZXMNCj4gKmFmdGVyKiB0aGUgc2FuaXR5IGNoZWNrIGZvciB0
aGVtIGlzIGRvbmUsIGFuZCB3aGV0aGVyIHRoYXQgaXMgYSBidWcNCj4gb3INCj4gYW4gb3ZlcnNp
Z2h0LCBhbmQgdGhhdCB3b3VsZCByZXF1aXJlIGxvb2tpbmcgdXAgd2hhdCB0aGUgV0EgYWN0dWFs
bHkNCj4gbWVhbnMuDQo+IA0KPiBTbyBJTU8gaW4gZ2VuZXJhbCBzYW5pdHkgY2hlY2tzIHNob3Vs
ZCBiZSBkb25lIGFmdGVyIGFsbCBpbXBsaWNpdA0KPiBlbmFibGluZyBvZiBmbGFncyBpZiBhdCBh
bGwgcG9zc2libGUuIEFuZCBpZiBub3QsIHRoZXkgc2hvdWxkIGJlDQo+IGFjY29tcGFuaWVkIGJ5
IGEgY29tbWVudCB0aGF0IGV4cGxhaW5zIHdoeSB0aGUgZW5hYmxpbmcgb2YgdGhlIGZsYWcNCj4g
aXMNCj4gbm90IGluY2x1ZGVkIGluIHRoZSBzYW5pdHkgY2hlY2suDQoNCk9rLCBtYWtlIHNlbnNl
IHRvIG1lLiBXaWxsIG1vdmUgdGhlIGNoZWNrIGJlbG93IHRoZSB3YSB0aGVuLg0KDQpPYWsNCg0K
PiANCj4gL1Rob21hcw0KPiANCj4gDQo+ID4NCj4gPiBPYWsNCj4gPg0KPiA+DQo+ID4gPg0KPiA+
ID4gL1Rob21hcw0KPiA+ID4NCj4gPiA+DQo+ID4gPiA+IMKgCWlmIChYRV9XQSh4ZV9yb290X21t
aW9fZ3QoeGUpLCAxNDAxNjc2MzkyOSkpDQo+ID4gPiA+IMKgCQlhcmdzLT5mbGFncyB8PQ0KPiA+
ID4gRFJNX1hFX1ZNX0NSRUFURV9GTEFHX1NDUkFUQ0hfUEFHRTsNCj4gPiA+ID4NCj4gPiA+ID4g
QEAgLTE3NjUsMTAgKzE3NzAsNiBAQCBpbnQgeGVfdm1fY3JlYXRlX2lvY3RsKHN0cnVjdA0KPiA+
ID4gZHJtX2RldmljZSAqZGV2LA0KPiA+ID4gPiB2b2lkICpkYXRhLA0KPiA+ID4gPiDCoAlpZiAo
WEVfSU9DVExfREJHKHhlLCBhcmdzLT5mbGFncyAmDQo+ID4gPiA+IH5BTExfRFJNX1hFX1ZNX0NS
RUFURV9GTEFHUykpDQo+ID4gPiA+IMKgCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiA+ID4NCj4gPiA+
ID4gLQlpZiAoWEVfSU9DVExfREJHKHhlLCBhcmdzLT5mbGFncyAmDQo+ID4gPiA+IERSTV9YRV9W
TV9DUkVBVEVfRkxBR19TQ1JBVENIX1BBR0UgJiYNCj4gPiA+ID4gLQkJCSBhcmdzLT5mbGFncyAm
DQo+ID4gPiA+IERSTV9YRV9WTV9DUkVBVEVfRkxBR19GQVVMVF9NT0RFKSkNCj4gPiA+ID4gLQkJ
cmV0dXJuIC1FSU5WQUw7DQo+ID4gPiA+IC0NCj4gPiA+ID4gwqAJaWYgKFhFX0lPQ1RMX0RCRyh4
ZSwgIShhcmdzLT5mbGFncyAmDQo+ID4gPiA+IERSTV9YRV9WTV9DUkVBVEVfRkxBR19MUl9NT0RF
KSAmJg0KPiA+ID4gPiDCoAkJCSBhcmdzLT5mbGFncyAmDQo+ID4gPiA+IERSTV9YRV9WTV9DUkVB
VEVfRkxBR19GQVVMVF9NT0RFKSkNCj4gPiA+ID4gwqAJCXJldHVybiAtRUlOVkFMOw0KPiA+DQoN
Cg==
