Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D01C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 10:17:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB3910E22A;
	Tue, 14 May 2024 10:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OcFs985u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E39810E22A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 10:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715681849; x=1747217849;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=6ES82RWGlkqq+n6EGMGFHQaGvNjv5ENNYQtpRZb/2Y0=;
 b=OcFs985uCQOJ4cIFwiWDJrCjTjvrcMK2g/eRAEUbbqjNZ3HAl9ARa9F2
 bUg0HDOEW7IUecwzBwLKjN3me6OncfyX7cgSWuJNQNtcwgDijvVyGG0Qc
 kZDLU1xBsl7YhrmOOoM+9wdAGXS3rV2WMwGboerkw9fi2knAN4HxNXdYD
 zZwcD45ZQVXcv31GivCqJQzkvrpQMA2K3btUilIdZI+tsmwBxdstyvfzI
 7o5ozptFV/21SvUmML5SnvjwZ2I3d/0dP4spuwpXPNN2DkkgjnzY0czgQ
 lzR90Dx4zVPpa/uOCC9Y5x4NFj6teJkJfUU8OAsQDmp4/LbnBVx6WZbrm Q==;
X-CSE-ConnectionGUID: zL3+ci51SPW/PP/+ffpF8g==
X-CSE-MsgGUID: QkbDDOvySkKMobIK1peXOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="22326512"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208,217";a="22326512"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 03:17:28 -0700
X-CSE-ConnectionGUID: IhyzRUlaQrK+4Lik5jz48A==
X-CSE-MsgGUID: Mbd1WbpiSTqYNJ5NdWFj3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208,217";a="30649056"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 03:17:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 03:17:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 03:17:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 03:17:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRG/y3VfK1OQ3H8EznuyDOqlYIIlYe5OIAaCreTVaQjlwUzzUMTscmUS9omX6uv2avE1GG4+LrItpNq14ZosqNx47iqsKUEQDXrju4grJ7AGnR4ok6IzdteGdhHq5h8+HDJffcjbRBnq5kbFIIMrAdta8K+BB0Vku2wvhW46Sh0EGkO1L2KBUUoe6+YRXEfk8d2e1ODRriaX0aIWHMO0Ugpqow5Wsx+/R+VcxKwUEgqXxmGplPfCokdLwqJgtO1Za6I8zHX/aYekeUlFNtwB8FzhRXTM4kBNuV7d+So71gxrttbDzZIIc3rkCoPilvNGjvB+xZRW3BB30irVNCvDpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpTkCrJxDj7Rgv/Y2okCIhImfgG5aD/kGzXsyM8V6fo=;
 b=FnAowS+bZNyKF3CM90N+Me+HyHl/6yuqb7JFycGDG7vQsisFkmCB70+oIfD78WBtzYq6B6hyj5tw2R4rbgXDniUdWo0hoPYdQG++dVVoELGKLubtijNVe07xhahFCvnLNQ5PXBurv9pTIdIiGPJE02PvHnlG02RAd0Ft5sv50b8B7cYJZ8CvoONN5QLKcK/dKh6iVuF8QEdXCr9YNCa3QaxtqGiVPGoidy6iXFWbV9hPN6HqJ+VJ2o+xesTkPdLfpyDU4mQaZxel7ugVRgBn/UJ8jCKO06SQI6RzGnxiMX3ijbdPO3bhRb9df+m9m+gVNAkjpXZBcaOMs9M4DMDe7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by DM4PR11MB6503.namprd11.prod.outlook.com (2603:10b6:8:8c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.26; Tue, 14 May 2024 10:17:25 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 10:17:25 +0000
From: "Konda, SaiKishore" <saikishore.konda@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Siddiqui, Ayaz A"
 <ayaz.siddiqui@intel.com>
Subject: RE: [PATCH] drm/xe: Modify minimum of various scheduler timeout to 0
Thread-Topic: [PATCH] drm/xe: Modify minimum of various scheduler timeout to 0
Thread-Index: AQHan7gxBZth6vRpC0quH9Xo1BUEo7GNUb8AgAHC6ICAAR+PAIAACWnPgAZSgnA=
Date: Tue, 14 May 2024 10:17:25 +0000
Message-ID: <PH0PR11MB5674E8EF849E5B47A847B70594E32@PH0PR11MB5674.namprd11.prod.outlook.com>
References: <20240506133447.3143994-1-himal.prasad.ghimiray@intel.com>
 <27iutedmzaotadr7fhnqhvy6naydrsqstgarjmqa4ltmlsowix@bn7n2shccrgd>
 <ZjzzKwMHFjdQaG7m@DUT025-TGLU.fm.intel.com>
 <171533219643.7531.15603783689137370423@jlahtine-mobl.ger.corp.intel.com>
 <MW4PR11MB705636A5456E4D03F69005E0B3E72@MW4PR11MB7056.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB705636A5456E4D03F69005E0B3E72@MW4PR11MB7056.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: himal.prasad.ghimiray@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5674:EE_|DM4PR11MB6503:EE_
x-ms-office365-filtering-correlation-id: db7bd55d-7cb2-4c4d-925c-08dc73ff0d17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?/5sZNmoQI/HZOmkyAZkXQSsPqln9U31JDVu2V78rQbpIZheEMavcKQd6RNX4?=
 =?us-ascii?Q?SkJnyDhZMRFTBjeS0oF5B5lJiOErLJX+2caXXVPH+1iOtPstWnzLcg8eOYmo?=
 =?us-ascii?Q?Lw4+H3Qu5AA+pvi6Cdf2mBIA7GrD/0/36hTnY3zidl/rGip81KfTOjpjI7u5?=
 =?us-ascii?Q?nUtgfGxRkEqj89N5HTfFgmlTApFOFWhvIvNno3wpX/NyfEER1NkTacbyr45h?=
 =?us-ascii?Q?zjnJnQLA8w2BXVufxrDmhHKbjzLGkK0cFMeYZ/WOeaY4GjqCM2YM8WBcSGSU?=
 =?us-ascii?Q?wfSOTYr7gFctXM6i9IXwwM3tQOO8UnrwUnJrhFkQk7sZMBuu2IIXM4tDdbMF?=
 =?us-ascii?Q?V4lYgjbIjVxGWDHYRiynLYjKw0Kml/59RI/f4seqLNgVqemzmAQEZF0+v1NZ?=
 =?us-ascii?Q?vLMJ4BHqjCzq/MqfWzZHHtnBloHdD1zW0SvWaKCOJ4fKxpc6oHpGko1iGksv?=
 =?us-ascii?Q?JmXkWC8ohkhy/lTEHREuqmNZ+8IXyGrZRDsJaf8PL2F5ExKhjEF02cPzrkbS?=
 =?us-ascii?Q?ARpyVKvU7cXtuFRaubw9jLd4kFpSkKefaOgXCw90aHmWTeGEhnVXfgfVEV40?=
 =?us-ascii?Q?wGxXtmjDakbyogO7y2obU/eR1ML056KPYqq42lPvRRCkvac5UDbKhrxM96to?=
 =?us-ascii?Q?0gHbT3u1fcGmwV3DOT8xlnqOsP3+5Ziw9HlkDu9CLmxKrR8/25n4Xn2RxNrL?=
 =?us-ascii?Q?m62UlMjnnOc7GhlA9AErg53w2k0q29jNUi0PKtQR9W0tew/kY1udoiiJQx4t?=
 =?us-ascii?Q?u1thqxZUICUd5xhpaJj8kdY18wqBiZcyKN4S5jAH7xNISK52QDwGQFEnmqt4?=
 =?us-ascii?Q?hNCW3zipnrnhHq+zneG3oa7OPMTWiNjoMhTZByWxZTUh6/8CXWm7tAJLVlmx?=
 =?us-ascii?Q?KD2lwU06CeNZOvJhOH7DwKDurBm9L6nC37MsUx7LaqEASmuIiqqrXI1fvcV4?=
 =?us-ascii?Q?DN1qs6YnUC3LCeq+Za9UrlFGD5VwRB/If+25g2FaziTXj5Ih2Wi/JJyy/NMU?=
 =?us-ascii?Q?6G3bVrOyL0chOEL/5H/vaWKzRKCuKwTr6MFrrjvuWlGwp+MUyZPFJ0ALQUP5?=
 =?us-ascii?Q?CWcCo8Zaw63FZZUaZQnDrgRTyE87BH7LrX1stXLjzheLf2PrY9X47Y4bGrsa?=
 =?us-ascii?Q?xfHX+eycWcPlggnltCSA/zpoXD2DUJx4GFvRprAw3k4W3SRDCUmBE9uSeV+/?=
 =?us-ascii?Q?cZvXT6n+rMYVh0/zyrYmYVay9xz90zVfK+oMJc6RDEhN7+IxGbkx/8J7xGp0?=
 =?us-ascii?Q?VlLizM9AA0Dv9m+qORXvS3Hq8Fx7HmiJF5zZaMIJnmXJTiBB914QghcLMUBF?=
 =?us-ascii?Q?Zk04JGZC/5xbIDnShBFC2+nmsre28uhqPY2zugQNmld2yw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5674.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jsO1oVboGKNNebMvW04A1DsmqEKZUoJD5lDTfcIVTUT/jNAl2134F8p4qfC0?=
 =?us-ascii?Q?2Fo0W4Xt0JIthJw1gBTgBwXSSo0uLNiRQsmF6T7Pa3WEA0a/83blZySJe8GV?=
 =?us-ascii?Q?7a2Egj9matqzt3RocxW2m4xhVQW5lhAmfeiOMl5XM77NS21e/Vg/eGMPiF/O?=
 =?us-ascii?Q?EE8Vze3x9J6xjrfMtKI09MkVeyorxVeuhdULV93woNRnGX2nsYUl6+qCpAbu?=
 =?us-ascii?Q?1lF84u5EeAoC7mtaOdMWc0jb9euyf/sw8Xv05m7XmvWTi3+MyUquFcrdOaql?=
 =?us-ascii?Q?3JV6+DmAmUBM+OsuCpNFKcf5VcHir44Whsj9sMpvxEYtbZlAVYKa7VIdqXrF?=
 =?us-ascii?Q?z3//So9OcBQtPcTc60OsjZF6WLCVos/20yAfrNZUoD2uBDReJVWtOUmiirlF?=
 =?us-ascii?Q?BHR3Pu+wfPdDqUbpzwc8DUrOyoJl9hXFuIgsi0vTXfifhvEdJ+Yguw76vPAV?=
 =?us-ascii?Q?QxOuRg9UTQaFfmSQKvjfHZmpb4OMSYFp3zu7NNzloW7cqeGTnuF2igr6IZ0C?=
 =?us-ascii?Q?klPVBnyyUMJQYRA7nY8rkm+Y7/S3nwZFAKO/LH+MFh4EzPLFps6Gxi2ncp30?=
 =?us-ascii?Q?tCm7FjpRZTLHAwIQeUczGqiZO2LZVLwnvdbKGD2qs3Oi0Il/U3nhcWM6vwE7?=
 =?us-ascii?Q?3VodqWu+Q+Cczgb0KScwFEzkjb+P/cFPyI+XeBqiMH7Iw+f8WFuYXEqjXhr/?=
 =?us-ascii?Q?/RcBbcQjx0gQ39Wi9g+hrlIuMPrE0f4j0qoDCg+XXbZBtIyVpw2pC5xwCzw7?=
 =?us-ascii?Q?5cwc1Q1Ph2qHiq57ciAmyv+1SJrMysbPZGuuqWWaJ4jhTLloYuXx40/IzfiY?=
 =?us-ascii?Q?dKxPjeV8ieLU1QTGuRpo0/P46KIs4TcmYjdk4iUuXfPt9HV/SWaYydmm8kUq?=
 =?us-ascii?Q?f1HXCISB0xpAo4DtIQqK9cMX+hvF/l0ODcdvVE+LOxES/SAyBP8P7JSxwa/O?=
 =?us-ascii?Q?QNC5uITaZ4hdJDp1dMqt/MZKkpTYI+KnAnpASFqBJflvxCB4d6Ocq9THbCOL?=
 =?us-ascii?Q?kj90G95P3Qm9jCk0ZgY6oB+5nH7GkDWGW2E5bMyHKta1ls+hmWsL1MFaWuCt?=
 =?us-ascii?Q?JcC6qiao+s3S3UTAXqn77QkB/M3ieKoJeVzrOqsFDsKurB1GY+jD7ga58x/Z?=
 =?us-ascii?Q?dj4Zyvw+wfpELG/U9TONu1c8ze2wWlcICcFol/19omPxJ4tFwVYdbMNOKOWU?=
 =?us-ascii?Q?nQi00wCakzGK9gJ0a4prlLObWtZi/eV6nE0pPfPAlU6dgZZzbT9eH1BwSaZE?=
 =?us-ascii?Q?a/sJC0cv2OwEHdWQJIvzWr6sNWlxgcBnX4Nqnp18mKHnoWKfTTU/fhAJU8LQ?=
 =?us-ascii?Q?iUA2SxBBmzDciutrLSglmxGgWGa4UsLKwSvzBVtJFGNa7akGJ+iw47CgpV9r?=
 =?us-ascii?Q?eBTpmOT+UWQ6+oiZ19T3SrqV5D0m4jS7Ysf3QwZss5FuL50ljq8ceK0Mm1RA?=
 =?us-ascii?Q?5JObKwUfj7YCXoISYXFrGbllS0q1TlJbrSiJSMsYDB78UBUo7gxEqF6/PrmJ?=
 =?us-ascii?Q?MRcMs+2MqpLeJfiI3izz+Pq7Oj2HoElv63O8zCaAVJ51asv0AAxGHveWgu32?=
 =?us-ascii?Q?1xV3oj5tYvHGfMq2N6ucOoW/ulr7RpJ1bwgnK3IY?=
Content-Type: multipart/alternative;
 boundary="_000_PH0PR11MB5674E8EF849E5B47A847B70594E32PH0PR11MB5674namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db7bd55d-7cb2-4c4d-925c-08dc73ff0d17
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2024 10:17:25.2879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p6HuJyVnEdQS3Kc5jqgYr1TPN6jFqVpC5d1ArcLFzlKAo9En1DSBjrxInecXid1oRD6OrVtFAZW6tyDgGqDB1s5lGtqrBu5G4+9VMWW8Zvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6503
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

--_000_PH0PR11MB5674E8EF849E5B47A847B70594E32PH0PR11MB5674namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi @Ghimiray, Himal Prasad<mailto:himal.prasad.ghimiray@intel.com>
What was the conclusion ?  Will XE team support this ? Sysman consumers use=
 single KMD Config and they don't have different configs for different use =
cases.

Thanks
SaiKishore

From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
Sent: Friday, May 10, 2024 3:14 PM
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>; De Marchi, Lucas <lu=
cas.demarchi@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Konda, S=
aiKishore <saikishore.konda@intel.com>
Cc: intel-xe@lists.freedesktop.org; Upadhyay, Tejas <tejas.upadhyay@intel.c=
om>; Siddiqui, Ayaz A <ayaz.siddiqui@intel.com>
Subject: Re: [PATCH] drm/xe: Modify minimum of various scheduler timeout to=
 0


________________________________
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com<mailto:joonas.lahtin=
en@linux.intel.com>>
Sent: Friday, May 10, 2024 2:39:56 PM
To: De Marchi, Lucas <lucas.demarchi@intel.com<mailto:lucas.demarchi@intel.=
com>>; Brost, Matthew <matthew.brost@intel.com<mailto:matthew.brost@intel.c=
om>>
Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com<mailto:himal.pr=
asad.ghimiray@intel.com>>; intel-xe@lists.freedesktop.org<mailto:intel-xe@l=
ists.freedesktop.org> <intel-xe@lists.freedesktop.org<mailto:intel-xe@lists=
.freedesktop.org>>; Upadhyay, Tejas <tejas.upadhyay@intel.com<mailto:tejas.=
upadhyay@intel.com>>
Subject: Re: [PATCH] drm/xe: Modify minimum of various scheduler timeout to=
 0

Quoting Matthew Brost (2024-05-09 19:00:43)
> On Wed, May 08, 2024 at 08:06:52AM -0500, Lucas De Marchi wrote:
> > On Mon, May 06, 2024 at 07:04:47PM GMT, Himal Prasad Ghimiray wrote:
> > > Remove the min/max configs and change minimum values of preemption an=
d
> > > timeslice to 0. The sysman teams must deactivate preemption and
> > > timeslice to assess exclusivity mode. They depend on configuring
> > > timeslice_duration_us and preempt_timeout_us to 0, ensuring these
> > > values are set at their minimum.
> >
> > nack for now, based on this explanation. See below.
> >
> > >
> > > Cc: Matthew Brost <matthew.brost@intel.com<mailto:matthew.brost@intel=
.com>>
> > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com<mailto:tejas.upadhyay@in=
tel.com>>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com<mailto:joonas.la=
htinen@linux.intel.com>>
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com=
<mailto:himal.prasad.ghimiray@intel.com>>

<SNIP>

> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> > > @@ -10,41 +10,17 @@
> > >
> > > struct drm_printer;
> > >
> > > -#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > > -#define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > > -#else
> > > #define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1
> > > -#endif
> > > -#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MAX
> > > -#define XE_HW_ENGINE_JOB_TIMEOUT_MAX CONFIG_DRM_XE_JOB_TIMEOUT_MAX
> > > -#else
> > > #define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000)
> >
> > previously one could configure a kernel with a different max.
> > And now it's hardcoded. How is this better and related to the
> > motivation in the commit message?
> >
> > is this commit doing 2 different things?
> >
> > 1) Removing the _MAX from config since nobody is or should change that
> > 2) Modify the min value to 0... That seems weird as basically there is
> >    no minimum.
>
> This is true.

Maybe I've missed some discussion but what is wrong with the previously
agreed approach where KConfig would determine hard _MIN/_MAX bounds
(and maybe _DEFAULT) that the kernel can work with, then there would be
sysfs min/max (+ default) which the sysadmin sets as comfortable with
considering the expected use-cases on the system and application then
choose within those bounds (if it wants expedited hang detection for an
example)?

> > I'd like to hear Matt Brost's opinion on that.
>
> I chatted with Lucas and second his nack. The requirements for this
> change are coming from sysman and are unclear. If sysman needs to set
> this to 0 (akin to no maximum), why can't sysman build the kernel with a
> Kconfig to allow this? This use case appears to be an HPC/AI data center
> scenario in which the kernel is probably built with a non-standard
> Kconfig anyway. Why can't CONFIG_DRM_*_MIN be set to zero? This needs to
> be addressed clearly and publicly.

I also thought we agreed on doing different build for such scenario
where the interactive desktop is not expected to be used, so larger
delays are more allowable.

The default build simply can't allow unlimited blocking of the HW by
certain workloads in order to make sure the desktop/compositor stays
operational. That can only be enabled by default build when the long-runnin=
g
workloads can be isolated so they won't interfere with the workloads
using dma-fences. And I don't think that code exists yet.

Sysman should be able to report a feature missing from the kernel if it
detects that it can't set the limits wanted. This can be reported to
user via error code and/or error message asking to install a different
kernel build.

Same strategy has been applied in the past for various kernel features
like realtime/virtualization etc.

Regards, Joonas

>
> Matt
>
> >
> > Lucas De Marchi
> >
> > > -#endif
> > > -#ifdef CONFIG_DRM_XE_TIMESLICE_MIN
> > > -#define XE_HW_ENGINE_TIMESLICE_MIN CONFIG_DRM_XE_TIMESLICE_MIN
> > > -#else
> > > -#define XE_HW_ENGINE_TIMESLICE_MIN 1
> > > -#endif
> > > -#ifdef CONFIG_DRM_XE_TIMESLICE_MAX
> > > -#define XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX
> > > -#else
> > > +#define XE_HW_ENGINE_TIMESLICE_MIN 0
> > > #define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)
> > > -#endif
> > > #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT
> > > #define XE_HW_ENGINE_PREEMPT_TIMEOUT CONFIG_DRM_XE_PREEMPT_TIMEOUT
> > > #else
> > > #define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)
> > > #endif
> > > -#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> > > -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEO=
UT_MIN
> > > -#else
> > > -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1
> > > -#endif
> > > -#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> > > -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX CONFIG_DRM_XE_PREEMPT_TIMEO=
UT_MAX
> > > -#else
> > > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 0
> > > #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000)
> > > -#endif
> > >
> > > int xe_hw_engines_init_early(struct xe_gt *gt);
> > > int xe_hw_engines_init(struct xe_gt *gt);
> > > --
> > > 2.25.1
> > >

--_000_PH0PR11MB5674E8EF849E5B47A847B70594E32PH0PR11MB5674namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Hi <a id=
=3D"OWAAMB3B24BE1CEFA408B8563DFC28E3AA050" href=3D"mailto:himal.prasad.ghim=
iray@intel.com">
<span style=3D"font-family:&quot;Calibri&quot;,sans-serif;text-decoration:n=
one">@Ghimiray, Himal Prasad</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">What was =
the conclusion ?&nbsp; Will XE team support this ? Sysman consumers use sin=
gle KMD Config and they don&#8217;t have different configs for different us=
e cases.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Thanks<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">SaiKishor=
e<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> Ghimiray, Himal Prasad &lt;himal.prasad.ghimiray@intel.com&gt;
<br>
<b>Sent:</b> Friday, May 10, 2024 3:14 PM<br>
<b>To:</b> Joonas Lahtinen &lt;joonas.lahtinen@linux.intel.com&gt;; De Marc=
hi, Lucas &lt;lucas.demarchi@intel.com&gt;; Brost, Matthew &lt;matthew.bros=
t@intel.com&gt;; Konda, SaiKishore &lt;saikishore.konda@intel.com&gt;<br>
<b>Cc:</b> intel-xe@lists.freedesktop.org; Upadhyay, Tejas &lt;tejas.upadhy=
ay@intel.com&gt;; Siddiqui, Ayaz A &lt;ayaz.siddiqui@intel.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/xe: Modify minimum of various scheduler tim=
eout to 0<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> Joonas Lahtinen &lt;<a href=3D"mailto:joonas.lahtin=
en@linux.intel.com">joonas.lahtinen@linux.intel.com</a>&gt;<br>
<b>Sent:</b> Friday, May 10, 2024 2:39:56 PM<br>
<b>To:</b> De Marchi, Lucas &lt;<a href=3D"mailto:lucas.demarchi@intel.com"=
>lucas.demarchi@intel.com</a>&gt;; Brost, Matthew &lt;<a href=3D"mailto:mat=
thew.brost@intel.com">matthew.brost@intel.com</a>&gt;<br>
<b>Cc:</b> Ghimiray, Himal Prasad &lt;<a href=3D"mailto:himal.prasad.ghimir=
ay@intel.com">himal.prasad.ghimiray@intel.com</a>&gt;;
<a href=3D"mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedeskto=
p.org</a> &lt;<a href=3D"mailto:intel-xe@lists.freedesktop.org">intel-xe@li=
sts.freedesktop.org</a>&gt;; Upadhyay, Tejas &lt;<a href=3D"mailto:tejas.up=
adhyay@intel.com">tejas.upadhyay@intel.com</a>&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/xe: Modify minimum of various scheduler tim=
eout to 0</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">Quoting Matthew Brost (2024-05-09 19:00:43)<br>
&gt; On Wed, May 08, 2024 at 08:06:52AM -0500, Lucas De Marchi wrote:<br>
&gt; &gt; On Mon, May 06, 2024 at 07:04:47PM GMT, Himal Prasad Ghimiray wro=
te:<br>
&gt; &gt; &gt; Remove the min/max configs and change minimum values of pree=
mption and<br>
&gt; &gt; &gt; timeslice to 0. The sysman teams must deactivate preemption =
and<br>
&gt; &gt; &gt; timeslice to assess exclusivity mode. They depend on configu=
ring<br>
&gt; &gt; &gt; timeslice_duration_us and preempt_timeout_us to 0, ensuring =
these<br>
&gt; &gt; &gt; values are set at their minimum.<br>
&gt; &gt; <br>
&gt; &gt; nack for now, based on this explanation. See below.<br>
&gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Cc: Matthew Brost &lt;<a href=3D"mailto:matthew.brost@intel.=
com">matthew.brost@intel.com</a>&gt;<br>
&gt; &gt; &gt; Cc: Tejas Upadhyay &lt;<a href=3D"mailto:tejas.upadhyay@inte=
l.com">tejas.upadhyay@intel.com</a>&gt;<br>
&gt; &gt; &gt; Cc: Joonas Lahtinen &lt;<a href=3D"mailto:joonas.lahtinen@li=
nux.intel.com">joonas.lahtinen@linux.intel.com</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Himal Prasad Ghimiray &lt;<a href=3D"mailto:h=
imal.prasad.ghimiray@intel.com">himal.prasad.ghimiray@intel.com</a>&gt;<br>
<br>
&lt;SNIP&gt;<br>
<br>
&gt; &gt; &gt; +++ b/drivers/gpu/drm/xe/xe_hw_engine.h<br>
&gt; &gt; &gt; @@ -10,41 +10,17 @@<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; struct drm_printer;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; -#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN<br>
&gt; &gt; &gt; -#define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIME=
OUT_MIN<br>
&gt; &gt; &gt; -#else<br>
&gt; &gt; &gt; #define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1<br>
&gt; &gt; &gt; -#endif<br>
&gt; &gt; &gt; -#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MAX<br>
&gt; &gt; &gt; -#define XE_HW_ENGINE_JOB_TIMEOUT_MAX CONFIG_DRM_XE_JOB_TIME=
OUT_MAX<br>
&gt; &gt; &gt; -#else<br>
&gt; &gt; &gt; #define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000)<br>
&gt; &gt; <br>
&gt; &gt; previously one could configure a kernel with a different max.<br>
&gt; &gt; And now it's hardcoded. How is this better and related to the<br>
&gt; &gt; motivation in the commit message?<br>
&gt; &gt; <br>
&gt; &gt; is this commit doing 2 different things?<br>
&gt; &gt; <br>
&gt; &gt; 1) Removing the _MAX from config since nobody is or should change=
 that<br>
&gt; &gt; 2) Modify the min value to 0... That seems weird as basically the=
re is<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; no minimum.<br>
&gt; <br>
&gt; This is true.<br>
<br>
Maybe I've missed some discussion but what is wrong with the previously<br>
agreed approach where KConfig would determine hard _MIN/_MAX bounds<br>
(and maybe _DEFAULT) that the kernel can work with, then there would be<br>
sysfs min/max (+ default) which the sysadmin sets as comfortable with<br>
considering the expected use-cases on the system and application then<br>
choose within those bounds (if it wants expedited hang detection for an<br>
example)?<br>
<br>
&gt; &gt; I'd like to hear Matt Brost's opinion on that.<br>
&gt; <br>
&gt; I chatted with Lucas and second his nack. The requirements for this<br=
>
&gt; change are coming from sysman and are unclear. If sysman needs to set<=
br>
&gt; this to 0 (akin to no maximum), why can't sysman build the kernel with=
 a<br>
&gt; Kconfig to allow this? This use case appears to be an HPC/AI data cent=
er<br>
&gt; scenario in which the kernel is probably built with a non-standard<br>
&gt; Kconfig anyway. Why can't CONFIG_DRM_*_MIN be set to zero? This needs =
to<br>
&gt; be addressed clearly and publicly.<br>
<br>
I also thought we agreed on doing different build for such scenario<br>
where the interactive desktop is not expected to be used, so larger<br>
delays are more allowable.<br>
<br>
The default build simply can't allow unlimited blocking of the HW by<br>
certain workloads in order to make sure the desktop/compositor stays<br>
operational. That can only be enabled by default build when the long-runnin=
g<br>
workloads can be isolated so they won't interfere with the workloads<br>
using dma-fences. And I don't think that code exists yet.<br>
<br>
Sysman should be able to report a feature missing from the kernel if it<br>
detects that it can't set the limits wanted. This can be reported to<br>
user via error code and/or error message asking to install a different<br>
kernel build.<br>
<br>
Same strategy has been applied in the past for various kernel features<br>
like realtime/virtualization etc. <br>
<br>
Regards, Joonas<br>
<br>
&gt; <br>
&gt; Matt<br>
&gt;&nbsp; <br>
&gt; &gt; <br>
&gt; &gt; Lucas De Marchi<br>
&gt; &gt; <br>
&gt; &gt; &gt; -#endif<br>
&gt; &gt; &gt; -#ifdef CONFIG_DRM_XE_TIMESLICE_MIN<br>
&gt; &gt; &gt; -#define XE_HW_ENGINE_TIMESLICE_MIN CONFIG_DRM_XE_TIMESLICE_=
MIN<br>
&gt; &gt; &gt; -#else<br>
&gt; &gt; &gt; -#define XE_HW_ENGINE_TIMESLICE_MIN 1<br>
&gt; &gt; &gt; -#endif<br>
&gt; &gt; &gt; -#ifdef CONFIG_DRM_XE_TIMESLICE_MAX<br>
&gt; &gt; &gt; -#define XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_=
MAX<br>
&gt; &gt; &gt; -#else<br>
&gt; &gt; &gt; +#define XE_HW_ENGINE_TIMESLICE_MIN 0<br>
&gt; &gt; &gt; #define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)<br>
&gt; &gt; &gt; -#endif<br>
&gt; &gt; &gt; #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT<br>
&gt; &gt; &gt; #define XE_HW_ENGINE_PREEMPT_TIMEOUT CONFIG_DRM_XE_PREEMPT_T=
IMEOUT<br>
&gt; &gt; &gt; #else<br>
&gt; &gt; &gt; #define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)<br>
&gt; &gt; &gt; #endif<br>
&gt; &gt; &gt; -#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN<br>
&gt; &gt; &gt; -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREE=
MPT_TIMEOUT_MIN<br>
&gt; &gt; &gt; -#else<br>
&gt; &gt; &gt; -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1<br>
&gt; &gt; &gt; -#endif<br>
&gt; &gt; &gt; -#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX<br>
&gt; &gt; &gt; -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX CONFIG_DRM_XE_PREE=
MPT_TIMEOUT_MAX<br>
&gt; &gt; &gt; -#else<br>
&gt; &gt; &gt; +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 0<br>
&gt; &gt; &gt; #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000)<=
br>
&gt; &gt; &gt; -#endif<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; int xe_hw_engines_init_early(struct xe_gt *gt);<br>
&gt; &gt; &gt; int xe_hw_engines_init(struct xe_gt *gt);<br>
&gt; &gt; &gt; -- <br>
&gt; &gt; &gt; 2.25.1<br>
&gt; &gt; &gt; <o:p></o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_PH0PR11MB5674E8EF849E5B47A847B70594E32PH0PR11MB5674namp_--
