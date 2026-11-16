Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFB5606A335
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k104Jh7C;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=je2Bzozj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316F510ED63;
	Mon, 16 Nov 2026 09:02:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4563010ED5C
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 09:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794819738; x=1826355738;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cbIEvD42ypNI+EVDIt0NvmGeb1d3ENJyw162rs1lU/Y=;
 b=k104Jh7C1dN8rtySPEryuJ49xfzgLouIH45CdgAhoPh75vdM4L86njxz
 lZGiP7ec57kY+fQ/cNXnAGFGkfimzF3th0kag3x8DO3wy3lcxBP0Xcy0I
 DVJMiEs74Wrjfw9zzGe7i64hGZ7v36Xsda8y9y1c+MuJy5p6cwRskglAh
 jECYEjqUHu8k9MzfZNXgpQVFvcJ8mQYqV7ZJZZ+ok+6n9WByAK/diTtXm
 IsWwCg1No8dVL5uERKWzLoj5WC3Ik5rLxw4uaKF2gTZbfRfIrlPbFW/45
 GqfgnAKe4BHl3l3bbrFkChmlZrg4xgm1G9gC6TLNRzll3WbiZcj4F2ci4 Q==;
X-CSE-ConnectionGUID: cWjkLyTFQN+DiYxbEpAJgw==
X-CSE-MsgGUID: HNVSRuABQZKfQYf5fN89Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3456646"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3456646"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:02:17 -0800
X-CSE-ConnectionGUID: KZwq3ksjRAC19P1+234N6g==
X-CSE-MsgGUID: khzp7A3tSw+oWT/MNx36OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; d="scan'208";a="10030856"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:02:15 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:02:11 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 01:02:11 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:02:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VpXt+Mx+cQAV7gf7iMEls8Ii63PX9gQbwkTCM0O/94mXZVZYPjkND9kCyhzC7BC3h93155dNvLyq3/XnYOYVXYwXMROBXLPjDvTjwORaVma/YPvAnuUlwoNVVoF6SXi8cyfmqIS3qiL2NNB59M1XBqLWuJ0rIZ558P81e8RKCdF0/aONX4M7cWMZYX4AA5R2vtIKQX5XXOXZqmibu6kTX0KIonnAB2XATIklw2poCu7JLRl/a9Sku6Xn7m93+ka5WB64Rkfsvaw7QfSjVjyPhRQsq5qSy0oZJuiF6wwik5n39sbO616LwegTIwpuxuTvsYpMi4tkroiiiziYqvFU6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfnpZHhIMF/Ibohx+bm+RLM3NdGQEFIlGR+OeuyXn7I=;
 b=LMSFcSMsThl0dq+Fm/Bcc7u3uqrI5OchwAUv42aH9+GjmeSuxC3dv0U2R1LdQ2aOyXQ2efF+KbDfWopssosMNzBRdnMeXrBaPr0Fnd/PCoeA0dzG+cZ7U4olL/zyTc08pja771BG4qlo5ne1MJjgQTNFux1VxdVx7KlwKpm2NBo4WAwFs+0TLYSQidOXWuS0VQEzTDSs0yNG2kq5UZsDxEc9u0kX7FVqX2vJNf9g1kzCf8KRpBW/Sx4viEKPhJaR5w9jqLBapmCwDrKPdVs5BFBoFgwroK1WSDQq7E8EJTpEz8CY6x9uknQsDWDuRbKET+LGJCwohX6xCbLCuPrkcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfnpZHhIMF/Ibohx+bm+RLM3NdGQEFIlGR+OeuyXn7I=;
 b=je2BzozjQc2kwnPF01Vi8O3F0O+w+KIYMqm3w5fJaSSTK28mqdoQkXnl0B8hPkMjdk2IT1anhO8fkq4YfCmjqXzz9bt2fjr65IXNY6iPK392Iw4xEOldU1xSLb7/Jv+Adkf+/tZE8rGb3L36a5yaxv4GHx1OfD0BGZoSXcMeWlY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SJ2PR11MB7620.namprd11.prod.outlook.com (2603:10b6:a03:4d1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:01:15 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 09:01:15 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v9 2/5] drm/xe/ggtt: Introduce full GGTT range size
Date: Mon, 16 Nov 2026 10:00:50 +0100
Message-Id: <20261116090053.2466938-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116090053.2466938-1-piotr.piorkowski@intel.com>
References: <20261116090053.2466938-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0050.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34b::11) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SJ2PR11MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 30ed8a69-b123-4c0e-e071-08df43c02b65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|261009223027099003|56012099006|11063799006|261102123227099003|261028144727099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: iWOsQrkEZdrxJt3jzNvKvfiD72vP7PFXkdsV5iqCPiDEEcWI1GygtEeH5HEThTGckLxy7rLnhw9UN+ZsR8szjVPZp+WIH1HZGU52O6XkvJFYlhJ7S/1ys3aezF2Bkm+JXWYRdg0V4D76c9V/FVWhm17FmDrrDmvNxBgkWk8ZA4hE6IYwUyr/tFA+6hgKpgfv6AUMYBb2kGut1vdLjEfTowmfvzjUWWKnD/AKzg77l0ZNwdjSxC3ucuHLl3qtdCHwefV6tL1LtrWU5oazg9azscGi4vHqlgUXMQ003gRyYf5gMvMatA9XPX2JVaFSbzZIesu3Py7O/cOXFTaOKJBJ5E2+oh4P+bSBSydeS5FfJteqVnBVN0SK7S3nJY0/bhA+5QdSTOqzPFNLIzJ9r0LLLeYK//9YSePYrgIGGOrrQ3lLp+Jr9llhdwhEf0H8vpockV636NCNG/c24I9RlF1r5i5bVRbBC267aPmI+EVUc2NN1eG7vH3DJUUn7dckmGz5loR26jY2GxUFBlkTJwwvku7EmZccvQ7yU50N22AULrmGiIEzm7WbI1FtCfgTSxSjTtZsSmIFJFfFNeIDuo60ILdbZGUMeTymUiBFWD+eGPR4CPH42D6qI1+tSg/VtcmbYRNcV51f4+Y7xyb/1ZHnGxPfYrE6cnJWJ2W3omiS1ZE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUNFZmZmUjBTQm9reVhRR2dtMXoyYStrZmlCVEZYTktHNXhVR0pmbGx2eWpU?=
 =?utf-8?B?SFVBZzkvYjkvT2ZzZm9kQVBHUHFkajdvU0hMUThGV01YTjJsNXhzWXJiS1pX?=
 =?utf-8?B?U1l1VnNLQXNEWmttYzFBQlE0SVBZK2tkL0V1a2ZlMzVmVWhhdUtWT3NNb3c0?=
 =?utf-8?B?SEtzR1o4N1k0dkZ1UW91eGpRL2tHa1NJZFllQ2RzZ1U4eERKWVVSSXM0WU1B?=
 =?utf-8?B?dTNTSTBlZS9lNVNhS1pNSVJNTWt0UlhOMnE3Ni9RWG8xM1k1WnpZZUo2R2Ji?=
 =?utf-8?B?QXBacjJPNEQxY1psWTJaN3RGZExwYSs0R2ljQWJmYXNnWVJxYkVtK3RZVUZS?=
 =?utf-8?B?Zy8yc0lQZUFxSlc3VTJsb1lCdTZBT1N1MllVa2QxZDA1ejhWNXVaVStBbFZ2?=
 =?utf-8?B?UzJ0aFVqemE4dmxjOVdpVGtvNUY1czlqeEZ5Q2hIck9ZZ2hCeUJBZWZyMzVr?=
 =?utf-8?B?ck1Ga0lVblF2encxQ3hSTUxaaGlVa2Q4V3ZKclpGOVc3ajNQb1U5LzBxUlF6?=
 =?utf-8?B?L01iOUF6d0tlV1BpaHFWd1FRRjdML0wwaWN0cng4SUJWQkh6d2gxTEMvRDBI?=
 =?utf-8?B?UUVweHRjYkwycm05akcyQVFDM0hBdVlhR290a0ZCR3g0L2NsbUJmSzJJenF1?=
 =?utf-8?B?Q3pGai9IK3dzRWhCOXllSTlVS2FDckhsTGgwSTR0OTBjM2x4UldJL1R3aXFK?=
 =?utf-8?B?a0NlVXU5Vjhpby91YzMvQVAzRnRIeGs0M3A0dkQ5VVp5b3Z4bkRmOEpSSk1D?=
 =?utf-8?B?VWVDSmd1dk53b0s1blVLV0YzOXBoUHN3OFVQRkxHeGVCeTBlcDhUVThGL3JP?=
 =?utf-8?B?QlNSaUp4SERQWEQ5c3VldjFBT2x1czlaN3RLZlhEVTdkbjFyWjQ1djVlYUh1?=
 =?utf-8?B?bE9BZkw5K2xHQ0JIeE1WNWV2bTJSODZjTGp4WGkwRkF0eGxyOEFpM1QxeHZ5?=
 =?utf-8?B?cjQyZHNsU011bTRjZ0V3dDRYUktWaVNQMTI0cDFoNTBRVUorZTNpWjVrekhK?=
 =?utf-8?B?c2ZLVndTc0kvMFp3RlRxQ0NmdGR5SzdkeTdGSnkwUmlTc01xbFROcENqdERz?=
 =?utf-8?B?Q2RycTdSK0xmWTg2cXRZd21ZVWRHdG9HdWZTb3U1QTM5REtCU1B0b0hBbFdl?=
 =?utf-8?B?a003bkFmRzlsajUra0phUkp3ajhUL0lXOFg5UDVlOTBFVkdqamk2c2RYYXlO?=
 =?utf-8?B?UUxVeDBYbGZ5U055QTE5V3Q1Rnp6M0tWSjVOZURpRlZpQ2VQWGV4cUdhdDFH?=
 =?utf-8?B?VXUvRVZNdVNadzAxd1hEblJXM2ljakp1aUFWbG0xWkIxM3FRYjc1cW9VRHRx?=
 =?utf-8?B?amYyRVV0elF2dkVvZFBPcTNrK2RZUlJnb2tiQlZoUW45TEI1eDJoT3Fza0pa?=
 =?utf-8?B?LzZ5aXdGYi9qcUZnSGltbjNxV0NXK3VzOWhMcXNSSE5zUFlFNVFDLzBXUlQx?=
 =?utf-8?B?cStHZjhRcWpKcEhXNHQ4TmJjWjNrZHlCYnZ3WkRaNStkLzc0WTF3QnVTVHRX?=
 =?utf-8?B?T2JSQVEzdm5vWmZxdDFxUVNTZ25FSkladkhOdnducGhKRlo4RXRYWHFDSUVU?=
 =?utf-8?B?ME5nSjlrVldLYWRuZmNBNnV3RWpSM2IwOU9CeFNyT0sySzJjZVVZcHZDTnFU?=
 =?utf-8?B?TnRxZElSZWlMTEpoZ0M2Zm5yaXU2Nkg3cVBFZU1yUk5pNkdSRGZwQXVKYVRr?=
 =?utf-8?B?VTNzVmdna3pxNFNoM1JPNy9QT2N5SldoWjJ6dHduSDNhRkdHWVU1UERhaS9O?=
 =?utf-8?B?SlRGaEJheGJrYXBWSFZNNWpsOXR6TVNJUGl3S3hDU0Q0MmF3ODZtNE11Z2Iw?=
 =?utf-8?B?L05XMEZkWHh6aTRSaDQyejNKdTA5Qi84bUptKzJqbGUzYWZleXo4cU5WbzJu?=
 =?utf-8?B?YWJCMjNGZTFCQ0RxT204ci8zeGorV1M4YUtWY0tONWFxbm5qdGhndzlzYkI3?=
 =?utf-8?B?M1VnSVNZWXBFTkorQ0dYY0JTNHYrcGsrTEdyYzZudXlQcHFmamdqd3BKVWgx?=
 =?utf-8?B?YWFMWlZIV3BrK0NBdHFQZ0R1QzlHc1Z4RmN1ajN6OEo1b1QwZTRMYUtldHVu?=
 =?utf-8?B?bHZjQjgwKzVVUzFCcHRYejAvQ2s3L1c0U2dRVU9JZDFCRy9RV2hUMEI5Z2pH?=
 =?utf-8?B?R3VtSHVpQ1c2eGtQRzFwbFV1Q2R3cGtLVUhURW9OR0dkNTNQK1l6QWU0cTJI?=
 =?utf-8?B?ZHEzY20rRTZCbjAxRGxGZVgwcFVEMURZVnQ2d1ZuRGNNSWZRVy9YZDZhbmhX?=
 =?utf-8?B?MUJWV3RWczU5bkM1WnIyb0ZwbEFKeXNZaXFwYm5XdVJVVVo3TFd6d3UyTGtp?=
 =?utf-8?B?OEZZSk8zbmZSNHo2anE0ZTI4NUI1NHVPR01sSUpFbTlrOS9BWWZJUnVUMFkx?=
 =?utf-8?Q?WaKfrHSZQrOQ9UEE=3D?=
X-Exchange-RoutingPolicyChecked: ltPXjT/WBdMuk5QNcxvcLTTeYWdzaoVSnabRdr2VEEn9e7QYMvC4hvkTZO/07megOWYRf8kUpcUQ0cJTB8ah/MOvdnvRYgP4jOlZZYvYBAz4q0XQu/37JCgjqq1AT80pTucd9T1eKRqUlu0rvaZ6k24ncnWZFEplf+J8qgis/1rsmKwXo65uNjgdwYtFPZWjAZVp5ZiMDyq2T1bj7nVMmxKqG0VgNLB+xEc+klL/WGZzJaMGzgCjxEZ3TyVjv6RWaNCOzfia1rXnHMVQuiAOiyAhFVfxk5t2i1F8BwzRh3IVe66KMqeFnAZXymtejxLRa5q6Nd3i/mDJHNnoygM6Ug==
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ed8a69-b123-4c0e-e071-08df43c02b65
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:01:15.1726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8MFxi/txqpn8JcCS1nfs7WKhTwA7AoJt2F8reOBiC20OBMTPTEuetMd9FxKZHlo7EtTC0pNvDF70lSS41iAlh6GeOYogTbO3yfo79H0hdIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7620
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

Separate the full assigned GGTT range size from the size available for
regular allocations.

For now both sizes are identical. A subsequent change will reserve part of
the full range for VF provisioning.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index deddf18d0bb09..73c45eecae2be 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -113,9 +113,11 @@ struct xe_ggtt_pt_ops {
 struct xe_ggtt {
 	/** @tile: Back pointer to tile where this GGTT belongs */
 	struct xe_tile *tile;
-	/** @start: Start offset of GGTT */
+	/** @start: Start offset of the assigned GGTT range */
 	u64 start;
-	/** @size: Total usable size of this GGTT */
+	/** @full_size: Full size of the assigned GGTT range */
+	u64 full_size;
+	/** @size: Size of the GGTT range for regular use */
 	u64 size;
 	/**
 	 * @flags: Flags for this GGTT.
@@ -241,7 +243,7 @@ static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
 	xe_tile_assert(ggtt->tile, addr >= ggtt->start);
-	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->full_size);
 
 	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
@@ -256,7 +258,7 @@ static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
 	xe_tile_assert(ggtt->tile, addr >= ggtt->start);
-	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->full_size);
 
 	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
@@ -361,6 +363,7 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
 	ggtt->start = start;
+	ggtt->full_size = size;
 	ggtt->size = size;
 	drm_mm_init(&ggtt->mm, 0, size);
 }
-- 
2.34.1

