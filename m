Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AA0606A330
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 09:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HUUMzg3D;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=GuQTOPxX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46EE810E22D;
	Mon, 16 Nov 2026 09:47:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A1210E28A
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 09:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794822414; x=1826358414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+KOQWPCVzNmTMnCYfodC1wSOqhiJRiVY1cuLWr4GnrI=;
 b=HUUMzg3DKGVQTHNZEMWCgn0WAR2nM5SoBGaYgV+k5uPisPp3xpBRDhaB
 lsNXlYCB8MxDF9i9VW9XWSuKJt7tQg0sIiHCYmOmv9RzPZJm2o9Rh8R8o
 +pCi5BFX94UyEzcl3IQDE0rLBnEfbel3Inlryf8KSf9JLxAlViVJjyzyP
 wTtCiO0vs4KNIDBLCUGB7mr51z0jb+dRxRDV7a/Q7j5ShSJvRWYzltZfW
 OTt2fBRTVYxN9yjVtgtRmacFJ25BKm4sg46ooY+QDssreTpcX7zoz4BTq
 dr/JX9q+dZ488itpwW6Wu8YVLp8LiJSJrx7WFKlq5kTTuVEX+BCKT6JGQ Q==;
X-CSE-ConnectionGUID: j90RqA0BSc2fjOnd4JHemg==
X-CSE-MsgGUID: tySw58CZSXijaj6gqdF7xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3461546"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3461546"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:46:53 -0800
X-CSE-ConnectionGUID: ip8PvE+xR0i+UHXULzgNAg==
X-CSE-MsgGUID: PFQL7wMPTfyFfudzdcDZ9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9497159"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:46:52 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:46:51 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 01:46:51 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.23) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:46:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kg0QmO3zkZq1FlQ4JhNyetTsdsUQpqqhiK/9uwRvJBCNdjeCPcTSs5ny5Abx+5A/RzNRfyOXcEoMxgsWElCzqFI4jEL1yfrybMfQ49PPClOnpRVu/kwNiAQA19G61IZIurwTrYEea4mURnakzwtzUj0jq5j+rblYNz8JteEHAZu72twEnWeDEeTeCu+7ETl/CoGtqL/SXtYmARx1SJWowyOxdBOeOT4X+0ciuL19eESUhqrJ1pvKUVaqDzkWRfJJSymGPBCr4lnB0jIkJcoe1j2JixMyAfIdYC02PK7TVY4CcrwGX114xgMQ/tgyxoGxKy/39L2eVHSXh5sVWVLT3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFI00JbG7gTJ2ULQGyJ92SkJzYB9T1S9Dv4LPVclB08=;
 b=mQ4dbtBt2IZfKp3Qox8A1bIjwoUXj1fiMzrygKZboBcWi3HkEA1np32Jw18LIOWfYXIElMFWOIzkmgFb8hEAvDgSc/+AAC8yhMMKlk8zBxbwRgHWLvOfObKATFGkS8h1rL/OhVbijFSZdiA8uucOpYhTiCbpUO8kxW7QfxgqPtjuuaMR859ziYehoWixgqoplUV1F7++fYFgpCi6JDUE+P5jt5aFjuuPRiIhoXHtKuJ1nn/fwn/Ef8p/LyWmKOuUn7KHQD2glKBzQq2bkYSWJDx8tm4R8s0MwYs5AIsN5DUkl3BvvhOb0HbCnbNVw6lP5m3/GOJ8MnDQLEB9lJrCXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFI00JbG7gTJ2ULQGyJ92SkJzYB9T1S9Dv4LPVclB08=;
 b=GuQTOPxXHBPn/3B5/V2TiDBaPZ42hLkVIqW5w1Y2Lhk8MJBh1hKBe52Wz1b8Z9P6gg/20FNSbDdJHM790G1ZKNOKJ55ufLRlr49aLLEPtlicrcp+PKAk22L0L3sMh2VdwhH21XrEzxIj8dfZoZJpAr//bNYudSQkiWz54MX/L8I=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by IA3PPFED21B01E3.namprd11.prod.outlook.com
 (2603:10b6:20f:fc04::cd) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:46:00 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 09:46:00 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v4 7/7] drm/xe/kunit: Test VRAM pool allocation
Date: Mon, 16 Nov 2026 10:45:23 +0100
Message-Id: <20261116094523.2484301-8-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116094523.2484301-1-piotr.piorkowski@intel.com>
References: <20261116094523.2484301-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0107.eurprd04.prod.outlook.com
 (2603:10a6:803:64::42) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|IA3PPFED21B01E3:EE_
X-MS-Office365-Filtering-Correlation-Id: 5036bf8c-a62e-4986-336c-08df43c66bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|10067099003|261022075727099003|261022113327099003|261022115727099003|261026121527099003|261021121427099003|261009223027099003|261102123227099003|261102130727099003;
X-Microsoft-Antispam-Message-Info: iKhXMa86cqFBDyde89fkhM7a9VEUswVGLVG7gB3RU8IyqRtG70+a9Rog+5gS83lyopsjjpNr0CjzknhyR7EpDHmoK36jg1xVPeZbLNyGV8hfE+qxwogLP5t63z0uGQS5WvXoGiI0g8T6mECf8fFHnM1wtZ+OS0kEYadXqHbEDcNZOC5k42yKcm+rba3O/3qYqetmE/BTqkSCD+Uj7k0gsZVitDxiMVKubllhBrUmFyz+gilRsluYQVW9ryloBklBdIfB0X35iPKPRUcaWJl2dJ5qBGLzOL+zA21Ty6YPoQpaXVTe1/C/J5/0098yKKdejjkaoHMAhwJFnfBI7xovxA1uo/vi0ladi4kR0nuXOFzqMDtbKu9f+L+oZzkU70DWBhALcGSUqFOrMgCf+Gc+N9m7jqFnTOhWhqCV/GassnBBYQszQ+/7Dhn4BB9xBcyxlw9k08p8DNGyub0inP/z3JlkPkA+AIcXrt14QWFSVxxIvHh5dj5MuqmzK0glH8JlFUSMSsJmvuuSQNaZe/Ho+dO7MOWgCTDGii0PVxO/fBz9mwmealCRFXxD/bAkuyTjxWLi8F5RBC8MuL+djJ8Bz7cH2zjJ6Rx6sFMaz0Or5n7+/qHg3Tvr4BWh/5r0CwEiTQJwzSfNoz3guJQMDYFRC69GIEoexqC4ma6MRDKQMlg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(261022075727099003)(261022113327099003)(261022115727099003)(261026121527099003)(261021121427099003)(261009223027099003)(261102123227099003)(261102130727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjNPNlUvZVB6cWYxWk5BOS9PYkhEQjNucHNYK3lWajNUOE5UcUpuVHVJQTBY?=
 =?utf-8?B?S0ZKZ3RQUXdFYTExajV3MThYTnZaaCs1blVDclVIMGorMUIzVFAxbXByZk92?=
 =?utf-8?B?YTFQYVYwVzhtcDJyNlB4cEhCOWdGRkJRVUdaeSs4Q0EzVlNGUklrTkFDN2N5?=
 =?utf-8?B?bGhXNHZLb0pyckhqTzd0WG5WTHNLdmxOZkc3QXF3WkJrNU5xTkgxNTFPL0d3?=
 =?utf-8?B?OFpNbmc2cDdabXVSaHpaRFQxa2IyUGlHd2xrL2NCb3hFVElwYzE1alNyZGdx?=
 =?utf-8?B?U0tTemQ4QVpmRlltL0Q4MHF0K21tZmFmalpmVUV0aVNPZDJpYW00bEhLUGhM?=
 =?utf-8?B?Y1E2MDFJVGV3alc4MzhycWFsT1hqSU5rYkdiYWk0VStXYkRsSUNaNU1tTVZY?=
 =?utf-8?B?OUY0ekF2azd3MFhkcUkzR25TQ3dxY3RGZXYwc3pxOHJaaTZEa0tndjR4cnYv?=
 =?utf-8?B?cWFuZDNKaGQycUVjcm5TYWxyVzhkUXJ5TWlucnR1dmxlZmZJMzFiWUNiWmdY?=
 =?utf-8?B?dE91MDI0dHVxZEpwQW52SDRyUTVNR2ZnNWxKOU1UemIyVjNSOEphYTgvKy82?=
 =?utf-8?B?MEFJSzRBa3p4cjhzMThLVnVCc09NQUtsUVI2TmE2MjN0NDY2N3IvWlRoa0p0?=
 =?utf-8?B?UWwrOUZhclVsZWtuYjdPRGxZcW01OTcvVmNjMVU0WXZtWmhTU2Y5RWZ0SzNq?=
 =?utf-8?B?eVYya29MMFY0blBHUTB0bzF0dUhxaFpDUk9XK2lUbk50STZHdlpXZjBCM3hs?=
 =?utf-8?B?UXhkeEFYN0ZYU2dVVXBVMlVwcnpQc1FqWlJHYlBra0VNWXlUMURWaHVUWjRL?=
 =?utf-8?B?ODFES1ZxQ25mbm9Pb3pYQm9vU28wcTAvVEVWWkJSUlJ2NlB4a3U5TXNuRHV5?=
 =?utf-8?B?TjVBaTNXeWNSU1JZQllCY3hqdDQ2aUJTWU5XNFpNUWR6OTNCOEJ0b1BxclRp?=
 =?utf-8?B?NnJqcnJaQktyZVFXdE1US09jYzlydjEzVE1GcGRwb0kxc1k1NFovOGxXVFR4?=
 =?utf-8?B?Z1RnbVdFVnFHV1dLZzFQMExJeWp4UVM5bEV1RHZjLzRhUk42OHFJZ015VVRT?=
 =?utf-8?B?NmdTUDNLRDgxeEEyWUYyellFemRTNG5pRi9EQXNGUXk1WHd2ekFNbWE0Rm9P?=
 =?utf-8?B?Tm9kRHNuSUN3U2tWdXc0elJZanJsNWFFSXpQcExpUHNwMVZoaDVJd21MVWlT?=
 =?utf-8?B?VXpRdG9Geml0cnNEU1Y4UzFoYWZicTBmWVQvNHhwM1BEa1RhMkluQWVnRE9E?=
 =?utf-8?B?WDRNWkZHbTZ3cVBvZjdjTEZFSTAraG8wWlcvMFRrVHBSYUs0YWZIdFd2endN?=
 =?utf-8?B?Z0lpZXVrMmlVRmhNajYzdDBPcTFtTHEydVhzL0R2Z2lFSGV4Nzh3VWxnR1I5?=
 =?utf-8?B?ZExaOFJlL25jOFRsZ3pKUlNhakhURjNMNUhLcXIyYm5rdFY3WE43Y0hmT25V?=
 =?utf-8?B?cUNYREJ3YmhheVN3eVBqWDlZYk8yMnNpVE40QUF4OW1heVRqT2pScS9sSi8r?=
 =?utf-8?B?NlJ5OWUyOWJBeWlRU0R1QkVJV0pKbUkweC9kekFJbmNla2QyVDVaUnhUTi96?=
 =?utf-8?B?Qm1PY09ZYXBYbGY5QXZ0aEJ0eVp0Z3U0a3NvL1hGNStNRGhhL3pBOHBQK3p0?=
 =?utf-8?B?bDF1STVPQjJvTkprV2hrNExXbHI0cUZ3YkdRbDNQTHArcUVxUGJOakRRZEkz?=
 =?utf-8?B?eUxQU25PbE1PVjlBa2RiR3VFRmoremZvRDJvNENOQTlqZFF4aHZZS3podjQ2?=
 =?utf-8?B?V0ZiWW4vNDQ3M21mTDNMcjNrUjdHNlcxVFFZcHB4cXh5OVhiczdXUnJwNkVj?=
 =?utf-8?B?a3ViUzRZMlh1TGEwNUgvNUxvVEhzU1l5bGx4aWlXZm92UjFhK1BLZnZKb1cw?=
 =?utf-8?B?emlrbnFhRjBMUVRncGhOOTdxSE9nRzR2dWhDeWplQTQ1K0Q0N0NLR3BFZGg5?=
 =?utf-8?B?c05KMjhiNWE3aDVIYkpHZE95MFZjZzR0aHh3NVU2VmVCQjVvUmNQU0orOWdz?=
 =?utf-8?B?NXZJMmNwdzAvWXNiRXZYSWQzNUNGVXA1L3VnZ2NoZktHbHgvS1lOME1QbXlI?=
 =?utf-8?B?SlVHdTNZY3R2U1l0ZUorMDFPd1JNcDNlWUtKdWh2T2ZTelhLZzRpZm9lUFRm?=
 =?utf-8?B?dGpjNVVldmgrZndlelFvWnFMeFhIZXM1dWU3UGkrZjlERjRrUWIxZ3EwS3Mw?=
 =?utf-8?B?dlNUYndSV3hhQVY5dTB0WXVOY3piOUpFZkdsU0xBV2J4b1U4T2I0Qkd0WEp2?=
 =?utf-8?B?QUFCZjM1QWNTZ1RkQWZTS1ZqeStkcG15eGNqWXhkaG90b0NlNXFVUTgwM0xt?=
 =?utf-8?B?UU9rSlZrbCtwKzlBejJ4cEpKOGw1LzFVejhsNUxOdHZKTTBTKzNqWkxtVXll?=
 =?utf-8?Q?oGCmXJ07lEBJ4RTo=3D?=
X-Exchange-RoutingPolicyChecked: kI6QiXm+K+gxCHljbJRcT/qNo6EqqqzPT8nSp5gpAPJHlgXLM15ZMIeiBe93fWChPjTdVoNBhW8fkC8VoIF6KNFa4CV51zv95GzRNfWJwYcIlsayxj8jYa3G3zBlCDVvfUac0/q9rTFgv0HuYiYi/Hd1mvCPu+kH/EbFpkEJE80ZMpFr1Sx8Lr7yjbrBWIRc+rqqgZHdoXj17ibTls24mMUV7i6abIO8KEHEyfIoScYQ1gyaBV8v5XQxvmbgLG8GJqOoxW4oaCqnthywzTeGsSAIZ7RAENvfr442WVrp389493c3l/jp2K3XYjoqCtbhSwZMD8YdRrLM1l9NK0bDJw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5036bf8c-a62e-4986-336c-08df43c66bf3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:46:00.5784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAtlxq7GFvdukOBgueU3HLiHNajKSZGHTIWCLA+9BHV6DOqagPHQZ4J/r7HCncxcNvj33CtEmf/dnTMsDFYaBuhhfRpMdQPyEb3QiI/1Fmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPFED21B01E3
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

Exercise default pool setup, pool splitting and partition limits, and
TTM placement range narrowing.

v2:
 - Guard the test include with IS_BUILTIN() instead of IS_ENABLED(), so
   that the suite is not built into xe.ko when the KUnit tests are
   modular, as reported by Sashiko for the partitioned VRAM manager test.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_vram.c | 177 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vram.c       |   4 +
 2 files changed, 181 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_vram.c

diff --git a/drivers/gpu/drm/xe/tests/xe_vram.c b/drivers/gpu/drm/xe/tests/xe_vram.c
new file mode 100644
index 0000000000000..de4cc3bff0f03
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_vram.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "xe_kunit_helpers.h"
+#include "xe_pci_test.h"
+
+static int xe_vram_test_init(struct kunit *test)
+{
+	struct xe_pci_fake_data fake = {
+		.platform = XE_BATTLEMAGE,
+		.graphics_verx100 = 2001,
+	};
+
+	test->priv = &fake;
+	xe_kunit_helper_xe_device_test_init(test);
+
+	return 0;
+}
+
+static struct xe_vram_pool *tile_pool(struct kunit *test, struct xe_device *xe)
+{
+	struct xe_vram_region *vram = xe_vram_region_alloc_tile(xe, 0);
+	struct xe_vram_pool *pool;
+
+	KUNIT_ASSERT_NOT_NULL(test, vram);
+	vram->usable_size = SZ_64M;
+	vram->io_size = SZ_64M;
+	pool = xe_vram_region_default_pool(vram);
+	pool->size = SZ_64M;
+	pool->purpose = XE_VRAM_POOL_GENERAL;
+	vram->num_partitions = 1;
+
+	return pool;
+}
+
+static void kernel_pool_defaults_to_general(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_vram_pool *general = tile_pool(test, xe);
+	struct xe_tile *tile = &xe->tiles[0];
+
+	tile->mem.vram = general;
+	tile->mem.kernel_vram = NULL;
+
+	KUNIT_ASSERT_EQ(test, xe_vram_tile_alloc_kernel(tile), 0);
+	KUNIT_EXPECT_PTR_EQ(test, tile->mem.kernel_vram, tile->mem.vram);
+}
+
+static void partition_carve(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_vram_pool *general = tile_pool(test, xe);
+	struct xe_vram_region *vram = general->region;
+	struct xe_vram_pool *kernel0 = &vram->partitions[1];
+
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_pool_create(vram, XE_VRAM_POOL_KERNEL, 0), NULL);
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_pool_create(vram, XE_VRAM_POOL_KERNEL, SZ_1M), NULL);
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_pool_create(vram, XE_VRAM_POOL_KERNEL, SZ_64M), NULL);
+	KUNIT_EXPECT_EQ(test, vram->num_partitions, 1u);
+
+	KUNIT_ASSERT_NOT_NULL(test, xe_vram_pool_create(vram, XE_VRAM_POOL_KERNEL, SZ_8M));
+	KUNIT_ASSERT_EQ(test, vram->num_partitions, 2u);
+	KUNIT_EXPECT_EQ(test, kernel0->purpose, XE_VRAM_POOL_KERNEL);
+	KUNIT_EXPECT_EQ(test, kernel0->offset, 0ull);
+	KUNIT_EXPECT_EQ(test, kernel0->size, (u64)SZ_8M);
+	KUNIT_EXPECT_EQ(test, general->purpose, XE_VRAM_POOL_GENERAL);
+	KUNIT_EXPECT_EQ(test, general->offset, (u64)SZ_8M);
+	KUNIT_EXPECT_EQ(test, general->size, (u64)(SZ_64M - SZ_8M));
+
+	/* Both partitions keep sharing the region, its manager and its placement */
+	KUNIT_EXPECT_PTR_EQ(test, kernel0->region, vram);
+	KUNIT_EXPECT_PTR_EQ(test, general->region, vram);
+	KUNIT_EXPECT_EQ(test, vram->placement, (u32)XE_PL_VRAM0);
+
+	KUNIT_EXPECT_EQ(test, xe_vram_pool_usable_size(kernel0), (resource_size_t)SZ_8M);
+	KUNIT_EXPECT_EQ(test, xe_vram_pool_usable_size(general),
+			(resource_size_t)(SZ_64M - SZ_8M));
+}
+
+static void partition_limit(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_vram_pool *general = tile_pool(test, xe);
+	struct xe_vram_region *vram = general->region;
+	struct xe_vram_pool *pool;
+	unsigned int i;
+
+	for (i = 1; i < XE_VRAM_MAX_PARTITIONS; i++) {
+		pool = xe_vram_pool_create(vram, XE_VRAM_POOL_KERNEL, SZ_2M);
+		KUNIT_ASSERT_NOT_NULL(test, pool);
+	}
+
+	KUNIT_EXPECT_EQ(test, vram->num_partitions, XE_VRAM_MAX_PARTITIONS);
+	KUNIT_EXPECT_PTR_EQ(test,
+			    xe_vram_pool_create(vram, XE_VRAM_POOL_KERNEL, SZ_2M),
+			    NULL);
+}
+
+static void pool_place(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_vram_pool *general = tile_pool(test, xe);
+	struct xe_vram_region *vram = general->region;
+	struct xe_vram_pool *kernel = &vram->partitions[1];
+	struct ttm_place place = {};
+
+	/* A pool spanning the region only resolves to its placement */
+	xe_vram_pool_place(general, &place);
+	KUNIT_EXPECT_EQ(test, place.mem_type, (u32)XE_PL_VRAM0);
+	KUNIT_EXPECT_EQ(test, place.fpfn, 0u);
+	KUNIT_EXPECT_EQ(test, place.lpfn, 0u);
+
+	KUNIT_ASSERT_NOT_NULL(test, xe_vram_pool_create(vram, XE_VRAM_POOL_KERNEL, SZ_8M));
+
+	place = (struct ttm_place) {};
+	xe_vram_pool_place(kernel, &place);
+	KUNIT_EXPECT_EQ(test, place.fpfn, 0u);
+	KUNIT_EXPECT_EQ(test, place.lpfn, SZ_8M >> PAGE_SHIFT);
+
+	place = (struct ttm_place) {};
+	xe_vram_pool_place(general, &place);
+	KUNIT_EXPECT_EQ(test, place.fpfn, SZ_8M >> PAGE_SHIFT);
+	KUNIT_EXPECT_EQ(test, place.lpfn, SZ_64M >> PAGE_SHIFT);
+
+	/* A caller supplied range, e.g. the CPU visible one, is only narrowed */
+	place = (struct ttm_place) { .lpfn = SZ_4M >> PAGE_SHIFT };
+	xe_vram_pool_place(kernel, &place);
+	KUNIT_EXPECT_EQ(test, place.fpfn, 0u);
+	KUNIT_EXPECT_EQ(test, place.lpfn, SZ_4M >> PAGE_SHIFT);
+
+	place = (struct ttm_place) { .lpfn = SZ_32M >> PAGE_SHIFT };
+	xe_vram_pool_place(general, &place);
+	KUNIT_EXPECT_EQ(test, place.fpfn, SZ_8M >> PAGE_SHIFT);
+	KUNIT_EXPECT_EQ(test, place.lpfn, SZ_32M >> PAGE_SHIFT);
+}
+
+static void pool_by_addr(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_vram_pool *general = tile_pool(test, xe);
+	struct xe_vram_region *vram = general->region;
+	struct xe_vram_pool *kernel = &vram->partitions[1];
+
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_region_addr_to_pool(vram, 0), general);
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_region_addr_to_pool(vram, SZ_64M - SZ_4K), general);
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_region_addr_to_pool(vram, SZ_64M), NULL);
+
+	KUNIT_ASSERT_NOT_NULL(test, xe_vram_pool_create(vram, XE_VRAM_POOL_KERNEL, SZ_8M));
+
+	/* An address resolves to the pool covering it, whatever its purpose */
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_region_addr_to_pool(vram, 0), kernel);
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_region_addr_to_pool(vram, SZ_8M - SZ_4K), kernel);
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_region_addr_to_pool(vram, SZ_8M), general);
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_region_addr_to_pool(vram, SZ_64M - SZ_4K), general);
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_region_addr_to_pool(vram, SZ_64M), NULL);
+}
+
+static struct kunit_case xe_vram_tests[] = {
+	KUNIT_CASE(kernel_pool_defaults_to_general),
+	KUNIT_CASE(partition_carve),
+	KUNIT_CASE(partition_limit),
+	KUNIT_CASE(pool_place),
+	KUNIT_CASE(pool_by_addr),
+	{}
+};
+
+static struct kunit_suite xe_vram_test_suite = {
+	.name = "xe_vram",
+	.test_cases = xe_vram_tests,
+	.init = xe_vram_test_init,
+};
+
+kunit_test_suite(xe_vram_test_suite);
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 6e0f5c4660e4e..c9d8c26e88fea 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -672,6 +672,10 @@ resource_size_t xe_vram_region_actual_physical_size(const struct xe_vram_region
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_vram_region_actual_physical_size);
 
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_vram.c"
+#endif
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
 static void memtest_bo_cleanup(void *arg)
 {
-- 
2.34.1

