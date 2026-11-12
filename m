Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA1B606A321
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 11:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ye4LouxU;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=fK9vGyMn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D792112055;
	Thu, 12 Nov 2026 11:54:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CF4112055
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 11:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794484480; x=1826020480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hYFsScgVaXEjPmaRQUWykbXIKZ5y7gitySWQ7suqn8Y=;
 b=Ye4LouxUbt8ag13mvSVIC4G/HJ/EGWtW/QDep1WVxAzgiKm2YPxgoznt
 0c1Vw898GPqPRAzc220XhiHiVHurE8Sn8ofoPWC1gLxmt6IvwP4oQr6FO
 mjKhTvKSqmwznn4MIM8HTaB2kyUx+tMEH4RM+i9KypAPVcyIfoxGtZvY0
 yB9r2Thz7PpYPxUDs49peswTV+LfCz0TziXSc+B2WtFPWcN9hqyTcbPEz
 bZ9XSfjD+6MAf9qrUK2ZqxES/w+2W6Qqrt40ztkrBdr9xvPS2IxBc1gLE
 6JeOMBhkA6K1EuhGxEyv8+tquJkJkQuSa3K+Z/k1SoqS0GgpvXXsJmxvD Q==;
X-CSE-ConnectionGUID: R1QyX+9gSY66NmP1XzgVXw==
X-CSE-MsgGUID: Uh235oi5SvO2Mf/TrwuDQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3299096"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3299096"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 03:54:26 -0800
X-CSE-ConnectionGUID: 6x7QmXrzSRmyciPmrRwViw==
X-CSE-MsgGUID: MlhapamUSeCiTYg+G0KtnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8569712"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 03:52:29 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 03:52:29 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 03:52:29 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 03:52:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igtljMlWHcuau5Mn/JfvIMF0KPYyrXWfbpLSuH6/IsarnxO7bEkyyoASJwZIb/QUJJsFIY4qSbQtLWwH+1Ln2Z5L0QqNWZVxuzMbVzjrsC1r9reujO9KTlbYPL31g4oReSUi+ZyKEr2VjgkEW3p90g4FApZsEC+CMDzg93ssVzXVHZ34aclcXmutLL7iHI6m99fUrZSu0XTTu9GRWyG3sX2T5dscbaYooJvX1yj0xo2ozudkX0RhV7sqmVqaKvScJpya/jatIhMeSaeHb22sRmOUsCjamKAqqsKDxBK5JJeR4ulmh4mUB2zv9j/1pjbvnZ6sDb6Vy7XBXlOWPqDRAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cs7hw7fWViCYYwGiS4mpfy9ND1lT8pYcCJ6sLoSs1RI=;
 b=IptWhAkuUHNMTu/cocNw89dE8/xBPkiXImvJTuk/oNblXL/3ZlWJSDsQG3h7aK7qIm96zB6uTK2TVmQoW8bVfVCpg4Izr2fya221TGlYhDDm06hhkb0Newqg2DQI0ogUJpcLGhqljfG7Nb6wXT3rX3Q3ziJE9JcQcjI+SurwX5+HQkV9jOvsTvkMuM0Zkz1iQc6+7d0N0ZK1JfX3A9W/M6WMuMs05PVHrDl1OWBurtJiNPulp8/QvM4cfugF506+f4qIsGXzej6q8gOmpjKJ+0WFZ4wE0Tfw1uheT0ZcmERX/DXQ1hh1EZ4VzkfXpYsiVPXv/NziACFolIoT9h4Frw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cs7hw7fWViCYYwGiS4mpfy9ND1lT8pYcCJ6sLoSs1RI=;
 b=fK9vGyMns9ppKq3l96QZXIZf4wBTA/D9P2Jkt8g7OrLkElfBqj9F3zF5S7PaGcT/QUw0if6nx+A6supAdwawn/ANh//v4Ro3vKV6xGhP6qlNnLdR4oMlvnB4X04AkduNh82nFeBDCSNyMKLpiQ65IkHeDr0WMBSLsdJ6C5qjiKM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH0PR11MB4838.namprd11.prod.outlook.com (2603:10b6:510:40::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 11:52:26 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 11:52:26 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH v8 5/5] drm/xe/ggtt: Add KUnit tests for usable and shareable
 pools
Date: Thu, 12 Nov 2026 12:51:47 +0100
Message-Id: <20261112115147.2329912-6-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112115147.2329912-1-piotr.piorkowski@intel.com>
References: <20261112115147.2329912-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA3PEPF00000517.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::66f) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH0PR11MB4838:EE_
X-MS-Office365-Filtering-Correlation-Id: 69be2bfd-e511-4656-1125-08df40b36c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|22082099003|261009223027099003|18002099003|261022075727099003|261022113327099003|261022105027099003|261021121427099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: Y+mbXwlv1+QGbj6MN/1xCw3RWM5l4QPXoIQCBzjzOfUK7Irpz++7mU5YoXggFePQwAzHon3xzZhqyi/jGrpDIAsMquC89d7AVDAftmRwTpsFp9nseC56ChOd8FN2jzm+mebO04jDm3ZCem6jH9xsl+0LLPphXasZo+8pBs5Gd1KeNk89xPgrkGM9pFh0AlTWktg72OPWSXQMHSGvgm3whToFDjx2aHylPJVUecQqtTX23REgYKDCDOGoXCznGfmZCucn008wt83hRuok2wu6g2Ks0DIXoQOxqBwJTVdV6LmBDeXZF6XhXhhCFJxxYeQ+5shT852LvWUF+KRsVadUcHr1hAyk1jxFu4hSh6QEjs5sndG864rAPlAm1kUuwjRnj/0oAtw2A3mT3wodV38+QaS1NolDpuzzsiAX7VLP4/sIbLCg4nB3HXNrJ+ClcXz2ZkmfqrrIRieV463XiiFRKfcXikg92w8+mb8G4reqUYS+/DiEKsY5p/0c+MeF91m/kmzU3cLz+TnPc4CeEyTWhr4pWZCjlFmAZEPkjB3Nujb2CYtI3BBOOAYKf5NIL0ONOwlSyqVTBxKX5/PmX/lsntqvCdECdiPCJ4hMwSCjhSaKyJsTu/hHMOsl1dgI8AwWHVD/HsXe6R0UKReRZtogwXPz4+ZlJtcQxpT9PjCoRNo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(22082099003)(261009223027099003)(18002099003)(261022075727099003)(261022113327099003)(261022105027099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWorZ1hCUkI2cVIrRzZRVWRsOU1xeVREeGt2aFBEZHhqT3BiMVlhd2ZKallw?=
 =?utf-8?B?YWVSZHByQ3hkRVNUQStwMUNJTlV4RFVwTlRoWkN5MnlUbzVBL25ENzZPZ0dm?=
 =?utf-8?B?b3lyeVFCQnprVDFzZmw4VDJ1R2gvb1daT2VpeEhOYTZ4anlIYkFtbWhpK1px?=
 =?utf-8?B?SVduNHpLMjhtV0JUNllsOTNqSHM0UUtQRnFwY0wrTVlLS3NuVVZMU1doVDEz?=
 =?utf-8?B?bHM3RWIySktkbHNiTFFOQ092aEZDeGFVRmRWSnBWMDljZkhjSFJXWmJ4RTFI?=
 =?utf-8?B?MHllMlUxTzRyQzhaMXRlOTNha2lWUytJVmpDdTZ4UkkvM0tyajkzUEdRdGpY?=
 =?utf-8?B?VmtPK1hYWHRiRG9iTFBQMVhpdlhkYmZkMlZrMTR4bHBTWEpvWUFDNVd3ODJx?=
 =?utf-8?B?ZVFhVi9SK3dHQXdxTG9NeE5hTG0yczN2MXN5dTNPYzkyRXBiVDZFNW44RFpQ?=
 =?utf-8?B?V1hYVFhUbFp5eWpsM1VydDd3ZlNhTkF2S2owTllTaG04ZUFmZDJjSHE3aUlz?=
 =?utf-8?B?NEtRYWJ5b2gzVWlnK2hIb25waGdmNDd1Y3crc2J0bndRV0ZKS3dsSGRrek4z?=
 =?utf-8?B?a2h6QW8wdEpwck5IWi9YTUdQSzIwK2M2QWFGcWpLOG54Qm1waFZIR01qU05h?=
 =?utf-8?B?Ykl4bzFFTy9yWlBrVm5MOGtxN3V4S3pFZFNTVWorWTlpU0NwTytWWTBmRE1E?=
 =?utf-8?B?YjZFOFdJMlUzd3c3VXo3czZlZlA0ek9yMWRkNnBJNWVibGdsYXc5ODFNRXNX?=
 =?utf-8?B?ODJ6YjZIMEJKR0plUEFGYnNaK1lFY1BYWXN4NEZmWFV6Y3BPbi9kVXFxL1Vx?=
 =?utf-8?B?NFdiVnRMY0VrT21EQllHVWs3Vk9mblNLeHRWRFVzTFNTd1B5TDEyY2dPbE5C?=
 =?utf-8?B?VlJLaHFvam1hWWZDR2JaZFlPUk4yNHo0SU1OUVdzcXJKbCs3RUd3ZVlQQjlC?=
 =?utf-8?B?Y0VueGJDNHBXdWpRZDgrQ2tEQ21lcHRRZTkyak9PajVkWUE1RCt1aVk3UC9n?=
 =?utf-8?B?R3p1M01obzdiVG9TSktWbmRnSzVmOWJnaGlNdGl5a2FBb2RUbWdTck9kaktH?=
 =?utf-8?B?ZlFQVkJaRFYyVmxyTU9mQjhiVFRVVzgvVHBNZ1pPcGNxT2dDTU1zN3NSdm55?=
 =?utf-8?B?UHdhTzd2cWFjL1F2RStLeExDT1RGMXE3d0RZbHZpbTZQMHRYblNuVUxCK2FD?=
 =?utf-8?B?VzJlVlV5V05Yb0p1SVAvMUxXRDV6WmU2Z1F6UitFYm9lV3pBWEZUNUYrTGJV?=
 =?utf-8?B?UDlCTmJvakRURktTVzB6Mi9BQjVJUnUwWlhqeW5PYTM0RGVjQVF0S3RxMnQz?=
 =?utf-8?B?STBzbHlvWTh5YWZsZW4waEZ4c21aVjRHc2dVQXVpVktSdEJod1lRc1Vld09r?=
 =?utf-8?B?ZCthRXNnUGk3UjAvQW9VM2tnU1Zrb0t4MXFNYlUzYndqSGdhRmNZQmZWQ2JY?=
 =?utf-8?B?QWtzVnc2NzQza0czSGlvQjl5bTZKZmg2WTFSZmIrT3JLdDBjZFEzSThrR0dh?=
 =?utf-8?B?WEdnbm0yR3JPMm9aYVY0eVduSXZqdUFqZXdYODlrSEM2aDc3cUNhRXZjTUJu?=
 =?utf-8?B?ODZJNlpjbE9TdzVISTBtVWluS250TGZvRStrelJuaEFQdUZ1OWxpNEx0RXZ0?=
 =?utf-8?B?VDJRK2hhWGx4UStuQkt0OEsySFRNN1FSekl0b1k0VDBIQ3FWQ0QzNWxiVjEv?=
 =?utf-8?B?b3hXRGh4d1J4aXlHR0hJNVlPZC9POFhQQW8wTzJMNzFHQ0VtdmZpclh3UUht?=
 =?utf-8?B?S3A2L0FxNkpJTDZNQlB0cEg3MnNUSmpwOWt3R1NqWkVQV2piTThvUDBoN3B0?=
 =?utf-8?B?RG9yRDhneWJMYmN5aUZiRzFPeEtPcmhMbFVTdU5NNEtQYUpId3lqcC93U2ZY?=
 =?utf-8?B?MEhwTHd2Rk5LWHUyTlp3LzJnNFhPemN1aDFGS0RSa2RDZTJUQ3FRYkpudExL?=
 =?utf-8?B?TUkyTE9YaG0zbEU3OXJBaUpZOGw3K3JUMWRiOTZ6Z1g4b1RWY2tDNzd2UGpi?=
 =?utf-8?B?Q0NSdFlNRmpiek1PUUdvMFoxcEtnd01Oa3ZHZ3hRTTNrYktGSEtBMUhuNWxh?=
 =?utf-8?B?anRVczZ0WGJhOWVFRXlJaXZxdXlNVnoxbXpGTkZra3YrbGxNQjQzeUI5MFNL?=
 =?utf-8?B?WTBFWjdqZm9HNkpCRXdXNnd0emx1aTBjYUJncUt2NUp3ZjdNMlp6Tzh5Tkpo?=
 =?utf-8?B?dXBuNWp4TzdaSWlxNG5jVVpOdFk4RXBrQ0dlMHZnRDlSZkVzSW9HVGFvVjBI?=
 =?utf-8?B?K3pwaUJrQWFxSEtDbk5GeFlmUCs1T3pRdXdmM1o5OVpJWnIvRzk0RFh0SDZ2?=
 =?utf-8?B?MVBOblJoQUNOcE9XbTMzYld5Zkh1TS9YSHEycGhYUlJzYys3MytkMnUvYXpO?=
 =?utf-8?Q?XDlCJLdvWkuii/7o=3D?=
X-Exchange-RoutingPolicyChecked: iNabek0bEkydMp8INeCTbKKA0XDdViVHoYWmcdBTgm2y1ZqBBU9YF9/tWz/mKJa33wva70uXZMjpqGLEphhKERnxc4PSkdi2FGFxSViPMvpexAcriHB076DuDlduc7ESyWSPrFIRKoiPIa54GtM05V4qTtZrfm6/OIdVkcoISuRskB7tJ07mR8B5wlvV6o8Ok/oV2JdUsBZIPuvMxka1W4sOf3MgqH9WXEftu60S24p4P5HibePp1NA+u8PknJUVSLZyCOr1rhCszpjIiLau+KqvjlwjSrr8S9aIKXhNY161h9NthgJap3nA40ssEUjNqpTcwwXo+FO5hluPvIsFgw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 69be2bfd-e511-4656-1125-08df40b36c13
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 11:52:26.7133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8QBC554TRJUgO+y6+DAd2g7SDuiAF88/dsQPasf1ufOZlQEbKfj8i+vIEgOovERNUj0NZUe8hA7qRhETSdswLYzRz62PsBGDWVXwKzt33xM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4838
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Add GGTT KUnit tests focused on the newly introduced usable and
shareable pools.

Cover range initialization for native and PF modes, including partially
overlapping pools. Exercise allocation direction and conflicts between
the pools, as well as the unavailable shareable pool and requests
exceeding pool capacity.

v2:
 - Init ggtt.lock with mutex_init() in each test.
v3:
 - Rename the test file to use the _kunit.c suffix.
 - Use shared GGTT setup and cleanup helpers.
 - Split PCI IOV coverage into a separate KUnit suite.
v4:
 - Release allocated nodes through KUnit deferred actions, so that an
   aborted test does not leak them into drm_mm_takedown() (Sashiko).
v5:
 - Move ggtt_test_insert_node_shareable() under CONFIG_PCI_IOV to fix
   the !CONFIG_PCI_IOV build (Sashiko).
v6:
 - Use the root tile's GGTT allocated by the fake device instead of
   a locally allocated one (Lukasz).
 - Reuse ggtt_node_remove(), ggtt_init_native() and ggtt_init_shared()
   instead of open-coding them in the tests.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c | 335 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c             |   4 +
 2 files changed, 339 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c

diff --git a/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c b/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
new file mode 100644
index 0000000000000..a1ddf70743352
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "xe_device.h"
+#include "xe_kunit_helpers.h"
+
+#define GGTT_TEST_START		SZ_1M
+
+static u64 ggtt_test_accessible_size(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+
+	return GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+}
+
+static void ggtt_test_fini(void *data)
+{
+	struct xe_ggtt *ggtt = data;
+
+	drm_mm_takedown(&ggtt->mm);
+}
+
+static struct xe_ggtt *ggtt_test_ggtt(struct kunit *test)
+{
+	return xe_device_get_root_tile(test->priv)->mem.ggtt;
+}
+
+/* Must be called after the GGTT ranges are initialized. */
+static int ggtt_test_track_ggtt(struct kunit *test, struct xe_ggtt *ggtt)
+{
+	return kunit_add_action_or_reset(test, ggtt_test_fini, ggtt);
+}
+
+static struct xe_ggtt *ggtt_test_create(struct kunit *test, u64 full_size,
+					u64 usable_size, u64 shareable_size)
+{
+	struct xe_ggtt *ggtt = ggtt_test_ggtt(test);
+
+	ggtt_init_ranges(ggtt, GGTT_TEST_START, full_size, usable_size, shareable_size);
+
+	if (ggtt_test_track_ggtt(test, ggtt))
+		return NULL;
+
+	return ggtt;
+}
+
+static void ggtt_test_remove_node(void *data)
+{
+	ggtt_node_remove(data);
+}
+
+/*
+ * Release the node on test exit, before the GGTT is torn down, so that an
+ * aborted test does not leave it in the drm_mm.
+ */
+static struct xe_ggtt_node *ggtt_test_track_node(struct kunit *test,
+						 struct xe_ggtt_node *node)
+{
+	if (!IS_ERR_OR_NULL(node) &&
+	    kunit_add_action_or_reset(test, ggtt_test_remove_node, node))
+		return ERR_PTR(-ENOMEM);
+
+	return node;
+}
+
+static struct xe_ggtt_node *ggtt_test_insert_node(struct kunit *test,
+						  struct xe_ggtt *ggtt, u32 size)
+{
+	return ggtt_test_track_node(test, xe_ggtt_insert_node(ggtt, size, XE_PAGE_SIZE));
+}
+
+static void init_native(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = min_t(u64, SZ_1G, accessible);
+	struct xe_ggtt *ggtt = ggtt_test_ggtt(test);
+
+	ggtt_init_native(ggtt, GGTT_TEST_START, usable);
+	KUNIT_ASSERT_EQ(test, ggtt_test_track_ggtt(test, ggtt), 0);
+
+	KUNIT_EXPECT_EQ(test, ggtt->start, GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, ggtt->size, usable);
+	KUNIT_EXPECT_EQ(test, ggtt->full_size, usable);
+}
+
+static void alloc_usable_pool_high(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, usable, usable, 0);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	usable_node = ggtt_test_insert_node(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node),
+			GGTT_TEST_START + usable - XE_PAGE_SIZE);
+}
+
+static void alloc_usable_pool_oversized(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	struct xe_ggtt_node *node;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_LE(test, usable + XE_PAGE_SIZE, (u64)U32_MAX);
+
+	ggtt = ggtt_test_create(test, usable, usable, 0);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	node = ggtt_test_insert_node(test, ggtt, usable + XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+}
+
+static struct kunit_case ggtt_test_cases[] = {
+	KUNIT_CASE(init_native),
+	KUNIT_CASE(alloc_usable_pool_high),
+	KUNIT_CASE(alloc_usable_pool_oversized),
+	{}
+};
+
+static struct kunit_suite ggtt_suite = {
+	.name = "xe_ggtt",
+	.test_cases = ggtt_test_cases,
+	.init = xe_kunit_helper_xe_device_test_init,
+};
+
+#if IS_ENABLED(CONFIG_PCI_IOV)
+static struct xe_ggtt_node *ggtt_test_insert_node_shareable(struct kunit *test,
+							    struct xe_ggtt *ggtt, u32 size)
+{
+	return ggtt_test_track_node(test,
+				    xe_ggtt_insert_node_shareable(ggtt, size, XE_PAGE_SIZE));
+}
+
+static void init_shared_pf(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	struct xe_ggtt *ggtt = ggtt_test_ggtt(test);
+
+	ggtt_init_shared(ggtt, GGTT_TEST_START, accessible);
+	KUNIT_ASSERT_EQ(test, ggtt_test_track_ggtt(test, ggtt), 0);
+
+	KUNIT_EXPECT_EQ(test, ggtt->size, accessible);
+	KUNIT_EXPECT_EQ(test, ggtt_shareable_offset(ggtt), 0);
+	KUNIT_EXPECT_EQ(test, ggtt->shareable_size, accessible);
+	KUNIT_EXPECT_EQ(test, ggtt->full_size, accessible);
+}
+
+static void init_partial_overlap(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_GT(test, accessible, 0ULL);
+	KUNIT_ASSERT_GT(test, usable, shareable);
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	KUNIT_EXPECT_EQ(test, ggtt->size, usable);
+	KUNIT_EXPECT_EQ(test, ggtt_shareable_offset(ggtt), accessible - shareable);
+	KUNIT_EXPECT_EQ(test, ggtt->shareable_size, shareable);
+	KUNIT_EXPECT_LT(test, ggtt_shareable_offset(ggtt), usable);
+	KUNIT_EXPECT_EQ(test, ggtt->full_size, accessible);
+}
+
+static void alloc_usable_pool_low(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	usable_node = ggtt_test_insert_node(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(usable_node), (u64)XE_PAGE_SIZE);
+}
+
+static void alloc_shareable_pool_high(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *shareable_node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
+			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(shareable_node), (u64)XE_PAGE_SIZE);
+}
+
+static void alloc_partial_overlap(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *shareable_node;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	usable_node = ggtt_test_insert_node(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
+			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
+}
+
+static void alloc_partial_overlap_usable_full(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *shareable_node;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
+	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	usable_node = ggtt_test_insert_node(test, ggtt, usable);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, shareable);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(shareable_node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(shareable_node), -ENOSPC);
+}
+
+static void alloc_partial_overlap_shareable_full(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *shareable_node;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
+	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, shareable);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+	usable_node = ggtt_test_insert_node(test, ggtt, usable);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(usable_node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(usable_node), -ENOSPC);
+}
+
+static void alloc_shareable_pool_unavailable(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	struct xe_ggtt_node *node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, usable, usable, 0);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	node = ggtt_test_insert_node_shareable(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+}
+
+static void alloc_shareable_pool_oversized(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *node;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_LE(test, shareable + XE_PAGE_SIZE, (u64)U32_MAX);
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	node = ggtt_test_insert_node_shareable(test, ggtt, shareable + XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+}
+
+static struct kunit_case ggtt_iov_test_cases[] = {
+	KUNIT_CASE(init_shared_pf),
+	KUNIT_CASE(init_partial_overlap),
+	KUNIT_CASE(alloc_usable_pool_low),
+	KUNIT_CASE(alloc_shareable_pool_high),
+	KUNIT_CASE(alloc_partial_overlap),
+	KUNIT_CASE(alloc_partial_overlap_usable_full),
+	KUNIT_CASE(alloc_partial_overlap_shareable_full),
+	KUNIT_CASE(alloc_shareable_pool_unavailable),
+	KUNIT_CASE(alloc_shareable_pool_oversized),
+	{}
+};
+
+static struct kunit_suite ggtt_iov_suite = {
+	.name = "xe_ggtt_iov",
+	.test_cases = ggtt_iov_test_cases,
+	.init = xe_kunit_helper_xe_device_test_init,
+};
+#endif
+
+kunit_test_suites(&ggtt_suite);
+#if IS_ENABLED(CONFIG_PCI_IOV)
+kunit_test_suites(&ggtt_iov_suite);
+#endif
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index c987687663596..327f92fe9a04b 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -1395,3 +1395,7 @@ u64 xe_ggtt_node_size(const struct xe_ggtt_node *node)
 {
 	return node->base.size;
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_ggtt_kunit.c"
+#endif
-- 
2.34.1

