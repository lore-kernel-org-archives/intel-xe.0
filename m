Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79884C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 17:12:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4CF10EC1A;
	Fri,  7 Jun 2024 17:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KBZJJ9Is";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D4C10EC1A
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 17:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717780324; x=1749316324;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jSeFULkGFM3Yis27E16yO8BKLvFMfURZkjxuEpWNQaM=;
 b=KBZJJ9IsXXKPUB3COBwQahvunKFrBexk3hJuwda0nbz+Qy78xJ/XNupH
 2yDHWd5GvuHU2a9Z7vT+0ZohE/0AgS0fERIwaA2ZtDBhKn8KtHJQ5o4ty
 rT5KG7suRJYxAE8bcyPdFRQmy8B/dthyj/5+4iG2dQbHoKMOC+EGsFOHW
 h138OpIOXF06T1sDIpsN2lfEHCh1reW/gph2bTBBhRYwRGcDGAXhQzwMX
 ew+v1nu5aiT2QPRXI6mB8G5lCGn2AZHxCS373YMbuHFHN83QOljprWeOz
 pzYJfObsiqY4dociOzk+TkCJWJy5um00EVDSAecd/hU+YidMKN5u0/R2Z w==;
X-CSE-ConnectionGUID: ogO/nxNMRxKnffGG29Cuig==
X-CSE-MsgGUID: qnwipqKbRjGpeLdsw5L09g==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14745638"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14745638"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 10:12:04 -0700
X-CSE-ConnectionGUID: ojiFmw7aR2upLjj/WK/kmg==
X-CSE-MsgGUID: pqDxgB85SVCRZp/2iMLWdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38241794"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 10:12:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 10:12:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 10:12:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 10:12:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7pqxCFi5V5vO5LJCQ7RPgzVQrB4bYFBLUp6Xx57w+V2bQAVih+X76BdzqgeZCckct/AblLNe49uiwNI0LRcFOnAg19OtAQyKUY6o8oloyAGoKcBeSF8SVy4AJCdSRFD94TICyJP5e/oMZGTbwHDLPts2nrwiga3YhjTFi4ka4UVa/t1bQDAsRbnWSPJ6yek53y5nw2l4t2WqVHv3dKdqKEp/e7Zwiduhp9mhowhyrqhuRyt6ILKiy2wDGonIBazddtXRxOv99Jnrb20Px1936k9/9iTefMjfBYqIJvxY0xgFEy3cV/GKeTa/OTHLM20cXEzLTzAcYegIlp7/YZ3Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3vN22WBllsFDoULpEL5Q/pHwbvqoog71l9nOVED+r0=;
 b=NA6R3Y89qC7QjXFooIBMsP9qU+EG7VVakF8hDPdQMZ+uXkC032VaaeHHbjWGtT7VG3mZDcmGKIXKhbl79gAkAwsEwWlGJQYJdd3XlB91PBoXVVnNn7aDfF30hvQv+urodnx1tgQxhkORpnHJdBDnH0wM+WL4rVi+7mKw23D9SxmcdTqtkBwB+aTQIePp3KAwduYLv20DCcrjmm7TUS7JKGgCdiJyj0tBkDfMC1Jhs02fsh50D9olPrDiyyyoSsqFQQ5G8rnbYhygSaKfkCr8k+H8j6S44nBZkibgbyg30YRQxoxNh5b1cVS8zV0TbrmLFS7TsMOZSV6qe5ceC+5ICQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CH3PR11MB7769.namprd11.prod.outlook.com (2603:10b6:610:123::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 17:12:00 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5%3]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 17:12:00 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Bommu, Krishnaiah"
 <krishnaiah.bommu@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Welty, Brian" <brian.welty@intel.com>
Subject: RE: [v2 28/31] drm/xe/svm: Introduce helper to migrate vma to vram
Thread-Topic: [v2 28/31] drm/xe/svm: Introduce helper to migrate vma to vram
Thread-Index: AQHairloFf471qqUJU+z0CvmU05xhbFiYEKAgAKtOCCABLZ/AIBTCBwQ
Date: Fri, 7 Jun 2024 17:12:00 +0000
Message-ID: <SA1PR11MB69916E3FB64283557E36D0F692FB2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-29-oak.zeng@intel.com>
 <ZhdPsV/ou2DMQe3O@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB6991AB46782299FA3E2ACE7F92042@SA1PR11MB6991.namprd11.prod.outlook.com>
 <Zh2ClEZweYvYFpWN@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zh2ClEZweYvYFpWN@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: krishnaiah.bommu@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CH3PR11MB7769:EE_
x-ms-office365-filtering-correlation-id: f2b8afa2-e3c6-42b5-3c39-08dc8714f1bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?HRobOJB9i965lX6Gqn5cv0cuRKxnvspiYBRMuIcrR3oN9GJebFT8MaQc1m?=
 =?iso-8859-1?Q?x33WpKMqnagjGSgLJXLdapVL+iL3UZ9AZnsX2L/3xH/d1Zb4pohxcLs7Dw?=
 =?iso-8859-1?Q?z2jHTRCelrJxZmSbJFWlYELuKoe6u7l6VgGG9VOGOlPmVvjJPSq/M2RBvO?=
 =?iso-8859-1?Q?Bb3OyJwyG8NjWee+wd950lgJRnBxh/3W5oYcGewmL6hOH+NvbkjX3gJMN+?=
 =?iso-8859-1?Q?F+USkIyaYDKqrWTjCrmIDsqoPJIsrfOzmWZlpwhYHb99ClCHjo99nSVB4R?=
 =?iso-8859-1?Q?2IX5cFWa2JG5g8ayibLQfWPqwFwB9nM+xdytrCu7mTZdySqh7MmVg6AOCZ?=
 =?iso-8859-1?Q?CG3mDBugdSbjptQ7QFr02Ikot8jVUmEeXLElLVr2LZgQvSZCzHsiOVLiI6?=
 =?iso-8859-1?Q?YB8SGj9imWKXk6gCri6Gv3y4hGVvakoWD4ZLx0qSweT3r0sasOT4LRAp01?=
 =?iso-8859-1?Q?WSo5vL3WSTjz6Sa/PO38tBPOweF/8sR7u1CIy1jxrzOCa/k8ofs8x8BCyV?=
 =?iso-8859-1?Q?xiJ2q2EdigL6XExeq5Ooq6tkRt4WWD7DTdakcbNcA+mvqfQr47VdYTsY/l?=
 =?iso-8859-1?Q?dU5apS/9v/1J/HzLf9bsFImbO6DkaEoegGgfiUsFGvQmoExRL2qH5IvWb8?=
 =?iso-8859-1?Q?sboW8ls4lr3ylCugGjP3eXOEU3+wmHY/s2oygzrMPbkjQuuXp/pmJeIJgd?=
 =?iso-8859-1?Q?zTr7RER8i8XbMiCBZCxUtyFRPZ9SOz43tbXqB27zLnZgfuGVxq/k5xfoj5?=
 =?iso-8859-1?Q?cNYdtqxVLdxAPXKAw7QkTw7SoGBwMzNfEEZmEeE//sSg87EM9ig9CfAXOb?=
 =?iso-8859-1?Q?2YnR/O84GIpqzPVDgpOzzZg4fAeWqs8EigtcnNfB+gEDSHz/qRkTO12Mvf?=
 =?iso-8859-1?Q?3ypd4kb6/4f+oSnFF2j2XgB6t3IuZil2iNRAzOz0dtP5U0HbjvMgNNyJEo?=
 =?iso-8859-1?Q?Wk/2Fxxp4uj3ahBt/FaJzdz36m1HYJ7JQ4JvGUNTC6JCeaOOeXaOi3p7WY?=
 =?iso-8859-1?Q?Fb/9Nr7/0TragmyCEYTktW7Kwx6qB79cq0YqR8zPLuPsNH4ZG0x9z6pGWt?=
 =?iso-8859-1?Q?Ze9naowPcR5R0YGh0O3FdLI2a/PY/GHqfE6l5zkLqV/a/p6TEin4xfdHUI?=
 =?iso-8859-1?Q?H/vNAT5zDovcUr+/3gL9j8dtl7ujqw2WD7mgblSENdDSGqPe6rTIspFNTj?=
 =?iso-8859-1?Q?g3XCeFqqJ3h9bdPyTYrIqBo8+ralGAjFESN8zjq2iLbDLhucQ9CWkSH4kI?=
 =?iso-8859-1?Q?l8CqxzyHMHfXMcSnxAkcGfVKKHj2m3zJS8sb+7uzxLAfuqOYkYUOp/QY7f?=
 =?iso-8859-1?Q?lUpP33s/HdtVmM1EEMPgm6f6c8hjSLlbFAGaIHKX7DCiaEXdPy9KtVpfT3?=
 =?iso-8859-1?Q?yQlP5YP5Y5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?v5QgbiXwy7A8Ou3J3+zV1GlTJqFkWGsNdFo3bLdQ7FEmHjYu6xQzwDoBA4?=
 =?iso-8859-1?Q?UIezNUDjGH5qaNzcfLRvFK0lblzk2yQvlIMjPt0/Qg5BGlDJJ0zYo/k2DA?=
 =?iso-8859-1?Q?VRkh40lPVjW7MdaXGgt7TFAolPzXi+ly/DEfvkCw9EqowiXhtPEbbTCC8Y?=
 =?iso-8859-1?Q?sreDIawAES3p1FY0dsvAOs0qug9//C9jh1wGKWifboDwPABUWQRBzZhhdt?=
 =?iso-8859-1?Q?MxFI9/qVZ43i50bnlyjMelnsQrwwGi1Cl2rA3CyHLjXbHf4sXwI9RBo5Cv?=
 =?iso-8859-1?Q?W31e23/3Mt7IwHZlDmDL3GKUk+HhLUQXvJJ6kNJY/cbT9dJAjOKFGw9cwP?=
 =?iso-8859-1?Q?vHXqYh87uicaQeThfQXTMflmRcmTumrDJwpwQL71MSv7JNxI9gdcn0Gn+z?=
 =?iso-8859-1?Q?zsELcmM27Fza8Px2rnyNjOnrW2aa8SwlM6z2sTJxkaAmFX5oSezfx5sRZd?=
 =?iso-8859-1?Q?Pq1uXsLyHQKaymHFQ5BhmJ9VIUf05u0vXdQbk8Z/35kwirs2N6g6WEKQQT?=
 =?iso-8859-1?Q?IRbAGqX+DVGAvWPcsGPZd+gM+l3kpK6yOoPJqEgmjum/UhanqhKu5vvBUR?=
 =?iso-8859-1?Q?pufsEXeF1pkO6AN/x04ss3+SUDRjZaBXJ9XpW4jw6YRECJNkFiNIZuUmyg?=
 =?iso-8859-1?Q?j+wiPuHvweQUTLkkmkClPUSztVonKw5W5ZDSikrP/ZY4nisVXe6rzlVsfV?=
 =?iso-8859-1?Q?lADgLA1jhnTcmz+vw/0v4qHq6PCMxvGTRhMTXVVrP0uzOB9Diha4zGP/Mu?=
 =?iso-8859-1?Q?dhhz3GwpRKTn9InUUBmuLS2lk2bdF6Cg5InbQZlN6xdQ0OgkdubkmmU9df?=
 =?iso-8859-1?Q?NP6RudflTDLvYDvTzkuKUD2TFWqV2ethoLGCmemhzApz/v8HUsoX/74yd/?=
 =?iso-8859-1?Q?IilHW5OaZk2iscu8w8bqLbVMbOOO6ilcBNBqfrFn+MqTp5ulizRpbOej4G?=
 =?iso-8859-1?Q?u9UDMgnSy+T7tiPlhRk9utMSnjkCL7Ou9XfhWO7TENcWvFTHLE2lDndz2m?=
 =?iso-8859-1?Q?+jmwQxaA12OtKQY36OyaIugG096M5XIlMsxI1J/ICxBq/ozD4AhHHceMS/?=
 =?iso-8859-1?Q?js0eIlKD32WlCKpu+3M1Vz9cG3rdfETLr8DD1CSe/9BqpmuyqJ+pssQJc4?=
 =?iso-8859-1?Q?tz4Hdw3REJrSIUpEFgl7e0ewloZUiDbvvRjLIJZyHJtamyFGr84i1qSD+r?=
 =?iso-8859-1?Q?RhgdKrlN+WKg7wxGf0e5C/GsP1NI2W0Rskq3ESloU4jHKiMH3FPXsElpBH?=
 =?iso-8859-1?Q?zFz6V13h8BXj07RQf2WaiuI1pSCX2+j7BNguA96JfWpV+VBoxzjOfy996Z?=
 =?iso-8859-1?Q?GVEVPuFPa8WXGre0mScjhcZxO6kLOJtpCC+TlYC3TBxp3vXj616zTaOeAP?=
 =?iso-8859-1?Q?tMfzyrjeJrNYgBz1WVU+e7Xo00L7EMt0WUPSKnNfu9MPY+lASSdVc4fi53?=
 =?iso-8859-1?Q?F8lkJGncTRAYV6LkvX5naL35g6XKiJatt+2ekmcN+xxLntNnm0qdnY4fT0?=
 =?iso-8859-1?Q?VbYwU46KmuQGld73UGKLsnmWbJ8JmECGfQQqSdYq5ZAZaSZod4vl9UdcIG?=
 =?iso-8859-1?Q?YxwgeV4xLo4qC0/3qCEjSOZmLyLBsk9rLRQKBBRqBytjNsTzYmGkOACH1a?=
 =?iso-8859-1?Q?y6lDvZW2nl6jw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b8afa2-e3c6-42b5-3c39-08dc8714f1bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 17:12:00.4268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MN0F/7iUNTXLaUf+JOvpTnipGYnBHnIhpAaaSwW1K7gqhCSPeJxWHn1VEYLFPQwEoSWFSHZCdG1Sobz4hhcM9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7769
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

Hi Matt,

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Monday, April 15, 2024 3:40 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com; Welty,
> Brian <brian.welty@intel.com>
> Subject: Re: [v2 28/31] drm/xe/svm: Introduce helper to migrate vma to
> vram
>=20
> On Fri, Apr 12, 2024 at 03:21:04PM -0600, Zeng, Oak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Wednesday, April 10, 2024 10:49 PM
> > > To: Zeng, Oak <oak.zeng@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> > > <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> > > <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com;
> Welty,
> > > Brian <brian.welty@intel.com>
> > > Subject: Re: [v2 28/31] drm/xe/svm: Introduce helper to migrate vma t=
o
> vram
> > >
> > > On Tue, Apr 09, 2024 at 04:17:39PM -0400, Oak Zeng wrote:
> > > > Introduce a helper function xe_svm_migrate_vma_to_vram.
> > > >
> > > > Since the source pages of the svm range can be physically not
> > > > contiguous, and the destination vram pages can also be not
> > > > contiguous, there is no easy way to migrate multiple pages per
> > > > blitter command. We do page by page migration for now.
> > > >
> > > > Migration is best effort. Even if we fail to migrate some pages,
> > > > we will try to migrate the rest pages.
> > > >
> > > > FIXME: Use one blitter command to copy when both src and dst are
> > > > physically contiguous
> > > >
> > >
> > > Yep, touch in this throughout the series. Only vram needs to be
> > > contiguous though as we dynamically create PT mappings for sram pages
> in
> > > the migrate code. Getting this in a must and should be done immediate=
ly
> > > IMO as this a very, very basic perform thing we know needs to be done=
.
> > > We will likely have to tune this code quite a bit for performance so
> > > getting known things done would be helpful.
> > >
> > > > FIXME: when a vma is partially migrated, split vma as we assume
> > > > no mixture vma placement.
> > > >
> > >
> > > Agree we do not want support partial migrations. We likely want to
> > > return -EAGAIN for something and fault back to a smaller xe_vma chunk
> > > size which I discussed in [1] and add comment on in [2].


I thought into this when I worked on v3. I end up with keep the xe-vma not =
splitting, but migrate partially of a vma. A vma can have mixed backing sto=
re now... To support this, I had to make the page table update and invalida=
tion range based (vs whole xe-vma based) I am testing it. Not very sure how=
 well this goes.

One thing I realized that might now work well is the range based invalidati=
on. Say we a pde entry covering a huge 2M or 1G page. If we only zap 4k in =
this rang, we will need to split pde entry and replace it with many pde/pte=
 entries. Even though the zap_ptes/page table walk functions are range base=
d, I doubt it works for such case. I will have to test it out. I think even=
 if it doesn't work, it worth to make it work as an improvement area. For e=
xample, core mm obviously support such function, see zap_pte_range.



> > >
> > > Migration should be best case too if we fail migrate we can always le=
ave
> > > backing store in sram too.
> > >
> > > I do have question though, when do we get partial migrations? A user
> > > having called mlock on some of the pages? I just want to make sure I
> > > fully understand that case.
> >
> > Yah, mlock could be one case...
> >
> > I also looked the hmm code. There are few other cases where
> MIGRATE_PFN_MIGRATE is not set (so we skip migration after), such as pte
> is NULL and vma is file-backed (not anonymous); entry is swapped out to
> hard disk etc. see more details in function migrate_vma_collect_pmd.
> >
> >
> > >
> > > [1]
> https://patchwork.freedesktop.org/patch/588526/?series=3D132229&rev=3D1
> > > [2]
> https://patchwork.freedesktop.org/patch/588528/?series=3D132229&rev=3D1
> > >
> > > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > > Co-developed-by: Niranjana Vishwanathapura
> > > <niranjana.vishwanathapura@intel.com>
> > > > Signed-off-by: Niranjana Vishwanathapura
> > > <niranjana.vishwanathapura@intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Thomas Hellstr=F6m <thomas.hellstrom@intel.com>
> > > > Cc: Brian Welty <brian.welty@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_svm.h         |   2 +
> > > >  drivers/gpu/drm/xe/xe_svm_migrate.c | 115
> > > ++++++++++++++++++++++++++++
> > >
> > > Same comment on file structure throughout the series apply here too.
> > >
> > > >  2 files changed, 117 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> > > > index c9e4239c44b4..18ce2e3757c5 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > > @@ -83,4 +83,6 @@ int xe_devm_alloc_pages(struct xe_tile *tile,
> > > >  void xe_devm_free_blocks(struct list_head *blocks);
> > > >  void xe_devm_page_free(struct page *page);
> > > >  vm_fault_t xe_svm_migrate_to_sram(struct vm_fault *vmf);
> > > > +int xe_svm_migrate_vma_to_vram(struct xe_vm *vm, struct xe_vma
> *vma,
> > > > +							struct xe_tile *tile);
> > > >  #endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm_migrate.c
> > > b/drivers/gpu/drm/xe/xe_svm_migrate.c
> > > > index 0db831af098e..ab8dd1f58aa4 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm_migrate.c
> > > > +++ b/drivers/gpu/drm/xe/xe_svm_migrate.c
> > > > @@ -220,3 +220,118 @@ vm_fault_t xe_svm_migrate_to_sram(struct
> > > vm_fault *vmf)
> > > >  	kvfree(buf);
> > > >  	return 0;
> > > >  }
> > > > +
> > > > +/**
> > > > + * xe_svm_migrate_vma_to_vram() - migrate backing store of a vma
> to
> > > vram
> > > > + * Must be called with mmap_read_lock held.
> > > > + * @vm: the vm that the vma belongs to
> > > > + * @vma: the vma to migrate.
> > > > + * @tile: the destination tile which holds the new backing store o=
f the
> range
> > > > + *
> > > > + * Returns: negative errno on faiure, 0 on success
> > > > + */
> > > > +int xe_svm_migrate_vma_to_vram(struct xe_vm *vm,
> > > > +							struct xe_vma *vma,
> > > > +							struct xe_tile *tile)
> > > > +{
> > > > +	struct mm_struct *mm =3D vm->mm;
> > > > +	unsigned long start =3D xe_vma_start(vma);
> > > > +	unsigned long end =3D xe_vma_end(vma);
> > > > +	unsigned long npages =3D (end - start) >> PAGE_SHIFT;
> > > > +	struct xe_mem_region *mr =3D &tile->mem.vram;
> > > > +	struct vm_area_struct *vas;
> > > > +
> > > > +	struct migrate_vma migrate =3D {
> > > > +		.start		=3D start,
> > > > +		.end		=3D end,
> > > > +		.pgmap_owner	=3D tile->xe,
> > >
> > > Again helper to assign owner.
> > >
> > > > +		.flags          =3D MIGRATE_VMA_SELECT_SYSTEM,
> > > > +	};
> > > > +	struct device *dev =3D tile->xe->drm.dev;
> > > > +	dma_addr_t *src_dma_addr;
> > > > +	struct dma_fence *fence;
> > > > +	struct page *src_page;
> > > > +	LIST_HEAD(blocks);
> > > > +	int ret =3D 0, i;
> > > > +	u64 dst_dpa;
> > > > +	void *buf;
> > > > +
> > > > +	mmap_assert_locked(mm);
> > >
> > > This mmap_assert_locked is ambiguous, we should make it clear if this
> > > read or write locked. Doesn't it have to be write to do the migrate
> > > pages?
> >
> > I followed hmm document (Documents/mm/hmm.rst), see section
> "Migration to and from device memory". It explicitly write a read_lock in=
 this
> document.
> >
> > I believe a read_lock is enough for the
> migrate_vma_setup/migrate_vma_finalize().
> >
> > As I understand it, the mm.mmap_lock protect the process's address spac=
e.
> When we modify process's address space such as mmap/munmap, we need
> to hold a write mode lock; if we only read process's address space, such =
as in
> the migrate_vma_setup/finalize, or in the cpu page fault handler case, we
> only need a read mode lock.
> >
> > I also cross checked amd driver. They also use a read lock.. see functi=
on
> svm_range_restore_pages in kfd_svm.c....
> >
>=20
> Yea, I see that too. Trying to figure out the locking, IMO the locking
> document might actually be wrong, or the very least the locking design
> is very ill-conceived. We can discuss internally a bit before I
> publically share my grievances.
>=20
> >
> > >
> > > A larger question about the locking... The CPU fault handler holds th=
e
> > > mmap lock in write mode, right?
> >
> > No. since cpu fault handler doesn't modify process address space, inste=
ad it
> only fill up cpu page table for some valid address range, a read lock is =
enough.
> >
>=20
> Ah, yes after digging around a bit I see this.
>=20
> > >
> > > I'm asking as basically I think at least initially we want to hold th=
e
> > > mmap lock in a way that the GPU handler and CPU handler do not race.
> > > i.e. From fault userptr create in GPU fault handler to issuing the bi=
nd
> > > we prevent the CPU fault handler from running.
> >
> > Yes we hold mmap_read_lock in both cpu and gpu fault handler to avoid
> that race.
> >
>=20
> That's not how rw lock work. 2 threads can both hold the read lock in
> parallel (shared read access), only 1 thread hold the write lock
> (exclusive write access, no one can hold read lock either). Thus my
> concern about the cpu and gpu fault handler running in parallel and the
> larger locking design questions. Again we can talk through this in
> detail internally a bit.
>=20


It is a great question of the gpu/cpu handler race. Obviously my above thin=
king is wrong. Here is my new understanding:=20

think about this scenario: address backing store is in vram - cpu access - =
cpu fault- migrate_vma_setup - invalidate gpu pt  - gpu access same address=
 - gpu fault - migrate_vma_setup triggered by gpu fault - this read back pf=
n of vram backing store because cpu fault is not finished/migrate_vma_final=
ized is not called yet, but since gpu side would only migrate memory in sra=
m, so migrate_vma_setup from gpu side wouldn't return any valid pfn to migr=
ate and gpu page fault handler would return successfully and gpu hw executi=
on is resumed but immediately trigger another gpu page fault, until cpu sid=
e migration is done.=20


Similar when gpu fault happens during the other stage of cpu fault handler.=
 Same thing when CPU fault handler interrupt a gpu fault handler.

This seems work to me but we need to test it out. We will add a test case f=
or this race condition. @Bommu, Krishnaiah fyi.

> > In user mmap/munmap (such as kernel function vm_munmap), we hold a
> mmap_write_lock which prevent it racing with cpu and gpu fault handler.
> >
> >
> > >
> > > I'm having issues figuring out how to prevent races between initial
> > > binds of userptrs and userptr invalidates on faulting VMs. This race =
is
> > > seen any xe_exec_fault_mode for example... So preventing races
> between
> > > CPU / GPU fault handler with the mmap probably is a good idea initial=
ly.
> > > Likely can make the locking finer grained once this is all working an=
d I
> > > figure out how to handle this race better.
> >
> >
> > I don't quite follow here.
> >
> > Initial bind of user ptr... if you meant the bind in gpu page fault han=
dler,
> then the racing with invalidation is roughly like below:
> > Invalidation is called with mmap_write_lock
>=20
> Is it? If the notifer does the invalidation via migrate_vma_setup in the
> CPU fault handler we established about that only the mmap_read_lock is
> held.

Yes the cpu fault triggered migrate-vma-setup/invalidation only hold read_l=
ock.=20

It was the munmap triggered invalidation in my mind. For this case, we hold=
 mmap_write_lock during invalidation, so it is mutual exclusive with gpu tr=
iggered migration.

But a cpu fault triggered invalidation can proceed during gpu fault trigger=
ed migration. As explained above, it cause extra gpu page table invalidatio=
n which is just fine because the consequence is just extra gpu page fault (=
and later migration). So functionally I don't see a problem of this scheme.

The main reason we hold a read lock in gpu fault handler is, gpu fault hand=
ler doesn't modify process address space, rather it only traverse the cpu p=
age table.

>=20
> > In userptr_pin_page, we hold a mmap_read_lock, so we know during pin
> page, invalidation is excluded.
>=20
> Nope, see above invalidation can happen when userptr_pin_page is
> executing because of the read lock. The seqno check (described below) is
> what prevents programming of bad page tables.

You are right.


>=20
> > After pin, before programming gpu page table, we check whether there is
> invalidation happen *after last pin but before programming page table*, i=
f
> that happened, we retry
> >
>=20
> Yes, that is how it works on tip but I am refactoring it in [1]. I was
> trying to avoid the retry loop by turning PDE/PTE writes into clears if a=
n
> invalidation happened but not sure if that works without a larger
> refactor due to nature PDEs being shared. I may need the retry loop but
> that also gets tricky with array of binds... A few options here and will
> land a on solution once [2] is merged.

I discussed this retry loop (I refer to the retry loop in xe-pt-userptr-pre=
-commit function before your change)with Thomas some time ago. I agree the =
retry loop scheme work

But to me other scheme without loop also work. As long as we have a retry c=
heck before programming gpu page table, it is fine to me.=20

If you have further fix in this area, I will keep watching and pick it.=20

>=20
> Regardless my point here is still valid - it may not be the worst idea
> when getting this code initially up and running just to grab
> mmap_write_lock in GPU fault handler as a BLK (big kernel lock) to
> prevent all races. Once the code is stable and stress testing in place,
> switch to finer grained locking as define in HMM document (or newly
> defined if we fine locking design is insufficient).

As explained, I will keep the read-lock for now. And we will test it. If we=
 do run into race condition, I will try write-lock and come back.

Thanks a lot for the great questions Matt! It is very helpful!


Oak

>=20
> Matt
>=20
> [1] https://patchwork.freedesktop.org/series/125608/
> [2] https://patchwork.freedesktop.org/series/132246/
>=20
> >
> >
> > Oak
> >
> > >
> > > > +
> > > > +	vas =3D find_vma_intersection(mm, start, start + 4);
> > >
> > > find_vma should work fine here.
> > >
> > > > +	if (!vas)
> > > > +		return -ENOENT;
> > > > +
> > > > +	migrate.vma =3D vas;
> > > > +	buf =3D kvcalloc(npages, 2* sizeof(*migrate.src) +
> sizeof(*src_dma_addr),
> > > > +					GFP_KERNEL);
> > > > +	if(!buf)
> > > > +		return -ENOMEM;
> > > > +	migrate.src =3D buf;
> > > > +	migrate.dst =3D migrate.src + npages;
> > > > +	src_dma_addr =3D (dma_addr_t *) (migrate.dst + npages);
> > > > +	ret =3D xe_devm_alloc_pages(tile, npages, &blocks, migrate.dst);
> > >
> > > Again as I discussed in [3] I think this should be broken out into a
> > > different step with the blocks allocated before this, and here just
> > > populate migrate.dst from the existing blocks.
> > >
> > > [3]
> https://patchwork.freedesktop.org/patch/588523/?series=3D132229&rev=3D1
> > >
> > > > +	if (ret)
> > > > +		goto kfree_buf;
> > > > +
> > > > +	ret =3D migrate_vma_setup(&migrate);
> > > > +	if (ret) {
> > > > +		drm_err(&tile->xe->drm, "vma setup returned %d for range
> > > [%lx - %lx]\n",
> > > > +				ret, start, end);
> > > > +		goto free_dst_pages;
> > > > +	}
> > > > +
> > > > +	/**FIXME: partial migration of a range print a warning for now.
> > > > +	 * If this message is printed, we need to split xe_vma as we
> > > > +	 * don't support a mixture placement of one vma
> > > > +	 */
> > > > +	if (migrate.cpages !=3D npages)
> > > > +		drm_warn(&tile->xe->drm, "Partial migration for range [%lx -
> > >  %lx], range is %ld pages, migrate only %ld pages\n",
> > > > +				start, end, npages, migrate.cpages);
> > >
> > > As discussed above, we shouldn't support this. We should fall back to
> > > smaller xe_vma chunk size until we find one that works or simply leav=
e
> > > the pages in sram and map those pages to GPU.
> > >
> > > > +
> > > > +	/**Migrate page by page for now.
> > > > +	 * Both source pages and destination pages can physically not
> > > contiguous,
> > > > +	 * there is no good way to migrate multiple pages per blitter
> command.
> > > > +	 */
> > >
> > > Touched on this a bunch throughout the series, lets do better than a
> > > page a time migration.
> > >
> > > Algorithm should be very similar to what I discussed here [4] but wit=
h a
> > > few key differences.
> > >
> > > - I think the sram pages can be unpopulated (page =3D=3D NULL) if the=
 user
> > >   has not yet touched the page
> > > - Also I think the MIGRATE_PFN_MIGRATE bit being clear is valid
> > >
> > > In these cases this indicate we have to issue a copy for the pages we
> > > are accumulating with contigous vram addresses.
> > >
> > > [4]
> https://patchwork.freedesktop.org/patch/588526/?series=3D132229&rev=3D1
> > >
> > > > +	for (i =3D 0; i < npages; i++) {
> > > > +		src_page =3D migrate_pfn_to_page(migrate.src[i]);
> > > > +		if (unlikely(!src_page || !(migrate.src[i] &
> > > MIGRATE_PFN_MIGRATE)))
> > >
> > > Discussed this in the CPU fault patch, once we call migrate_vma_setup=
,
> > > on subsequent errors we need to call migrate_vma_finalize to revert t=
he
> > > pages to the original state. At least I think if I am reading the doc
> > > after this correctly.
> > >
> > > Here on error we just free the pages...
> > >
> > > Matt
> > >
> > > > +			goto free_dst_page;
> > > > +
> > > > +		xe_assert(tile->xe, !is_zone_device_page(src_page));
> > > > +		src_dma_addr[i] =3D dma_map_page(dev, src_page, 0,
> > > PAGE_SIZE, DMA_TO_DEVICE);
> > > > +		if (unlikely(dma_mapping_error(dev, src_dma_addr[i]))) {
> > > > +			drm_warn(&tile->xe->drm, "dma map error for host
> > > pfn %lx\n", migrate.src[i]);
> > > > +			goto free_dst_page;
> > > > +		}
> > > > +		dst_dpa =3D xe_mem_region_pfn_to_dpa(mr, migrate.dst[i]);
> > > > +		fence =3D xe_migrate_pa(tile->migrate, src_dma_addr[i], false,
> > > > +				dst_dpa, true, PAGE_SIZE);
> > > > +		if (IS_ERR(fence)) {
> > > > +			drm_warn(&tile->xe->drm, "migrate host page
> > > (pfn: %lx) to vram failed\n",
> > > > +					migrate.src[i]);
> > > > +			/**Migration is best effort. Even we failed here, we
> > > continue*/
> > > > +			goto free_dst_page;
> > > > +		}
> > > > +		/**FIXME: Use the first migration's out fence as the second
> > > migration's input fence,
> > > > +		 * and so on. Only wait the out fence of last migration?
> > > > +		 */
> > > > +		dma_fence_wait(fence, false);
> > > > +		dma_fence_put(fence);
> > > > +free_dst_page:
> > > > +		xe_devm_page_free(pfn_to_page(migrate.dst[i]));
> > > > +	}
> > > > +
> > > > +	for (i =3D 0; i < npages; i++)
> > > > +		if (!(dma_mapping_error(dev, src_dma_addr[i])))
> > > > +			dma_unmap_page(dev, src_dma_addr[i], PAGE_SIZE,
> > > DMA_TO_DEVICE);
> > > > +
> > > > +	migrate_vma_pages(&migrate);
> > > > +	migrate_vma_finalize(&migrate);
> > > > +free_dst_pages:
> > > > +	if (ret)
> > > > +		xe_devm_free_blocks(&blocks);
> > > > +kfree_buf:
> > > > +	kfree(buf);
> > > > +	return ret;
> > > > +}
> > > > --
> > > > 2.26.3
> > > >
