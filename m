Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6F1CA0FE7
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 18:28:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF38E10E27E;
	Mon, 25 Aug 2025 18:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJkDFqGP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7501B10E27E
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 18:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756146496; x=1787682496;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uONo5ZSc1DhPeJ0s/+mojcCNRLAPwHVu55h4Zv9Ifz4=;
 b=ZJkDFqGPDZ87kuCGLpr5bx03yT1LK85cK//bjfVBtiDjaH40K9bdVPcE
 w5T/0IlkeAWmhJPXGOsVRri6DQvMAgAWd5gN06aPqRZkkWnWLbl/aQd44
 Og19tUt//+acMc3PRTOtdaGiowr5UJceGsuMl9eNw8J1F5boDUG3OMdHr
 Ip5p2dcKeYAFl1CMwykA5Kyx4lcBuiC6S6Ts92sp50jY1VQl7hLiSs7IK
 lo0jLOE9pGuLPJ4PwUPFM+xvPXyqF8OpkIUiZViqkgB2YjmgchgOLV49+
 KllSfvU8j1ZGZYvmTpfbXy7N+mqHUFV0lQFeAIA60B9p3GooGeAaYuBX8 w==;
X-CSE-ConnectionGUID: eZa/ydZ+QW+1Vdva80iHKA==
X-CSE-MsgGUID: lgIa/uS9TQaHkqJ7152lcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58438146"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="58438146"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 11:28:15 -0700
X-CSE-ConnectionGUID: HvMXVcWbTK+kFl1nxEMWrQ==
X-CSE-MsgGUID: RldxF4xETAGcLPhKTtq+HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="169539798"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 11:28:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 11:28:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 11:28:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.47)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 11:28:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgaO8w8a/ppAiT77+3doGYin+PHOUlYEw169JMEt/9n1BmzYwzB1GQriIUL9MBJ2vRo1BWISZczyAimLbynpnRXmJG1fg2QEzP3kdo2zrqOh7d6TNlqgmlEuHYcU6fFPDsNInH6B61CLdF2J6/7a6tCiMP4pfoppqTq+fSqQ/ePfoWa1PUuvS7sA/blUpqFxm1d+mP6K9ce1R9MxTG99/ZE0IHQY++RUMCE/j4vm795zycz35LygIBoaE38ek5TcaACO+vAvJqFBJGJ3nhkQSZ3QRp5ue5q7g0JZxp2123mqH+WPAWprcrifTPOoxoGCcLRXdAb2nmKW7HBuIWpixQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdPDdZToHtwEtjxZrQgzfWnlu7h+pOgE9EZQfMZ9WIM=;
 b=VwWzQ7gWOGkuROY/aCAWC5pz022zCbs9fOfe1mhHLFKawJVf8j5tRASchOLLxQNSz/48ZgeZ3ljt0ZFSZ8LbliqUgZrTYVdis2TUGqL3xR2S4HJpSjf/b5Q+0rPaUopL17BCebEYFcmAcKJs6kKQNDRTuMP45GByoc6HE/UMOKHNt65SH+EZLtG78acIPRXnz1AnFL7OdQKU1WOsACFxscmJToCSGoygN7H9+0el7QZJ1Dz91kOCcY9LfL3+7KREGZdgYSlXr0bb5uRqGTYtnmZfRn12rJ8fc40hZTe7XWcJ/9GqPyWKG0DvY3goRNs5outPcef8RgmnZ0uy9gis4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by PH7PR11MB5793.namprd11.prod.outlook.com (2603:10b6:510:13a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Mon, 25 Aug
 2025 18:28:10 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%6]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 18:28:10 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Poosa, 
 Karthik" <karthik.poosa@intel.com>, "Xiong, James" <james.xiong@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: RE: [PATCH 1/2] drm/xe: make xe_gt_idle_disable_c6() handle the
 forcewake internally
Thread-Topic: [PATCH 1/2] drm/xe: make xe_gt_idle_disable_c6() handle the
 forcewake internally
Thread-Index: AQHcFeGKgIKVlPHqyUK2Fq3RN/9k7bRzrLUAgAACpbA=
Date: Mon, 25 Aug 2025 18:28:09 +0000
Message-ID: <SA3PR11MB8046BB4EF58E2E3450FA213B863EA@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20250825165759.1263546-1-x.wang@intel.com>
 <20250825165759.1263546-2-x.wang@intel.com> <aKyoQNJEq70Q4nkv@intel.com>
In-Reply-To: <aKyoQNJEq70Q4nkv@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|PH7PR11MB5793:EE_
x-ms-office365-filtering-correlation-id: 371afdb5-3423-43d7-e2fc-08dde40524d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|42112799006|38070700018|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?ZLqhfcFDXgFRrElQQUZ+llqjDrttuhKHrUMhNq/JgauDWt50kk+HPF2tlu/6?=
 =?us-ascii?Q?W67tdvdoYBmCEk0sd6OIzQR8bTlIQIIjAQbm3fjIt1gWvxEjZs+moa4K4hDi?=
 =?us-ascii?Q?AbAhe7vZMSr9hQrLunA6VP0VxRsIRWz3qgP/1CArh5l8uBFSd8QIVUN48lb5?=
 =?us-ascii?Q?DWhfD+HAVRnXM2gxmIRG22g5m/mN3PpYaORY/Yo34sPggr3iSV2zNDBoS04G?=
 =?us-ascii?Q?hl+fJImFZBrIYnvBOaXhKSXStPOVrrHrxV4Bb6yVqjIdLYPdPXtFi8CLpCcv?=
 =?us-ascii?Q?k1SLJG4dAmOF80On7nS51AlilBZHzuhUmGOsuVsuB0c3vur9RAkwLiz8mAEM?=
 =?us-ascii?Q?zCBvgeH+XdBvvJj785mXVnLffHioEb0n58ZE+EpDCG1l4bA/o4BnXydBkJQz?=
 =?us-ascii?Q?u7OEwBM+AigA9kkzLOJHv/YbNecTJhosmwSQj8OQoV55mSbk/na7KyqsMR+t?=
 =?us-ascii?Q?qrRTgCxSJUpZ2+Mccdm07h+rpdEsqIo5zjRNkf7kvQXPD0HGnRvlYiEjkXoH?=
 =?us-ascii?Q?aIsGgt/lLdIGGQuw/21IcpQZDIWHi8N3hT6hZwUNBHDKR27DDCov/e5VFmEQ?=
 =?us-ascii?Q?n4ElqM74A8EcM0H7E17DLa3yFdnZl1v7ynaa7unbRZ4iS6mRVtz18bO8tF8b?=
 =?us-ascii?Q?z+IFW08Kn2LzgrxW46QtwbYkkvf6W/fzn0+S4h0E8EOAEVUqrapM1ldTtmZU?=
 =?us-ascii?Q?Em2gcGxH40YjhHVfrMvHl/koJDAzEeg9iflULwe/JTayOq/Y9mb4IDrzBVUy?=
 =?us-ascii?Q?vdzYGo5+dlAycQdVLddBnotfHgsQ3fJAUsNeOXXWQfY4HIkhYWbjj9HIwm8U?=
 =?us-ascii?Q?+tspq35Rl+gLgHJGcrU0vcq0c6QU3x1sK8Xz70rx0IzXIQq+P1VfbaYcpDlR?=
 =?us-ascii?Q?xofc8bBc5EjAnWD14DYc67uyJNoz7ejKXs0Nrs1ZPW6eJoPGNNh/V7MQ8cqR?=
 =?us-ascii?Q?l23F3SsNCa5mNQ7i3KxlCzILLSZXUfN3C1qhD4nsCHlyJAoSsBfqynWodlOJ?=
 =?us-ascii?Q?5a54bR0NdnqGC4597BbqA61yOWI4baz2WAoH6BfohBzITXuOfI7lDBuCnFbR?=
 =?us-ascii?Q?MZmxcTAfc+kbAlMZwmTF1621dSwyM4AqYuBbThKpdrS/0DlOYz8/E5/aG/Xy?=
 =?us-ascii?Q?MvOnkSjPVexRs7zRm50mmTtsE9WuMVTEQoCOlCetAjne7Qe2i6mv7U/yVS3P?=
 =?us-ascii?Q?QtffReStnx2yfBoYxwf0zREHtyutcF7sNIOlgOOZc3bqehebUmoNKkd0WrkX?=
 =?us-ascii?Q?+qu+2RpZI1FotXPWaipT3xlkpPjSwaiewto5k+alFT5tb+hjsufAm8P1nvcj?=
 =?us-ascii?Q?AljvoIMRRt0gv10GYoNM+umfDNSJpNX/1LM+29hrJnl71DkpAbcLa8xV9GDF?=
 =?us-ascii?Q?KLnSgKlZrMDveYtgFq07lhHajj9g8A93hCY0LlHeeG7oXMCSq3F0WK/tlauD?=
 =?us-ascii?Q?1yq0XGzwewfCjmFf8m1DNaehrO0NImRc9iA8FR7xGNGDbpFVdHrfjcHlQ1/l?=
 =?us-ascii?Q?HEZ6qTVuYWp/6B0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(42112799006)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vcfQEIRIjmtNicyUs4+Bt8oTWgmxXGK6IDxwhT2fr2FqdmTUPdT4P8IxXJql?=
 =?us-ascii?Q?M9pMoqVC874aVkcIFsbWokAzYU85yHP9g4DIVY2egSJqI1T2wJ0tziiF0n51?=
 =?us-ascii?Q?EIAxmqyuqo81y5sLzzek2aQy/SIpBA5Sd/DabdBeFI1BCZd3o15bi7OFmUpu?=
 =?us-ascii?Q?Ly08MJPH/1Duqg6x/MCr/ml5eOoFLvLQnS1iJ7Hpwc/3lc7gYez7ZZoGpZ+c?=
 =?us-ascii?Q?jRJ7OmWf5p/HRGsN3CkKNkIKmyX5Kf/2gQWK/TS/tjzcDrpEZwMSEkVzgA55?=
 =?us-ascii?Q?0ubccTJSvVPvN95svbkJvRhKOAh27te6wDd8gIMxWHJoUocswvWqQddtaL+s?=
 =?us-ascii?Q?XxooSdIXBcNu4N4U4Xy3CVr6GaUhKFBY7Yx8DRufL+Tsdy4oBPmyB18nof20?=
 =?us-ascii?Q?ycj5BndZAmEfLdobH58zSQA9IVwjQnLJnugmZG4nlcI4rRCG5JxDteasVwD7?=
 =?us-ascii?Q?9AtBNpNhKbs5z+Qm1G6zYUyaYSR2DSWbyxnuzHuyiVZ3WTkfW2FMy6E9gELG?=
 =?us-ascii?Q?EJ0ivnwoB9vZ5aYTfin4fO65xk3qB6hGW4Gp760jLVC0TnXwDnmMFV+RLr8e?=
 =?us-ascii?Q?4QDgpPciHy/LJxYSi+9UPdi5SZgUmn6NoCID+z+TaxLGR/CVKAga2uYPhyVL?=
 =?us-ascii?Q?tkRVsJjJX7utsDJr9DyLiA9+AYb6os/jk6zcm0ZwK2/B7OK3Q2Nviq0i9RdE?=
 =?us-ascii?Q?sbhNrg2VueObjrgkA4k9YKL8h6+Tk6u2rO2HKrcwgK+beKX50ggq5JHADCSp?=
 =?us-ascii?Q?Dj2J6xTxToCRm3PfbdW4uHXRkKfMmcdZWyspSbPwEl7i4HWoDQ7nQO1Yu0pD?=
 =?us-ascii?Q?LFlGYP3iUJSq4p0WxgnH+09XvlT2V+C/xRG/SpAfiqnHYZ7+YoojxMZ5lcY7?=
 =?us-ascii?Q?a4cqCyWPCxKzhH/txupryMdPaEuIR/JiJ2nA1aAKQUqCMkFc2wUsHoIej3+q?=
 =?us-ascii?Q?EuwV3qt7Unjozvdgww/fw3ylvv2wfoikEuK30d7oi3fVo3o6gBWvTfemOi82?=
 =?us-ascii?Q?+Awe2tLMfqq7ySnd9sNYHyP+L4ZHd7VZplFeSHSg/iOJz7GgSnqTI40EZw0g?=
 =?us-ascii?Q?8LEKetz37Pfl92ienTAosR7vDQSXCvGvyqgOnVZth/NAQC2Hlv+arjmIspjN?=
 =?us-ascii?Q?FyuwwF7ERYJZ3YhrNtoIBw2iG9SdT5HVojqsFIlsXk4n35r+7L7zMV0VohD8?=
 =?us-ascii?Q?BkwRfXAOjxFtZPW+66M9IXunzzt47Js6yqi7nzcCsesvLFk2SFGUOMFUVI5L?=
 =?us-ascii?Q?YSaIdlXY8B3hCt7JjnjqaUgTTuCUiwQQZEziTYI3WudgzSOVsO6Hr8npmanl?=
 =?us-ascii?Q?0or3UqWwjs+puVCBfU3d+ETtAVQjfnAK3SNCKLO93HYv7vu/nvu0Nr7tzUJG?=
 =?us-ascii?Q?P9t404uXhQusZySivTlmKCEhVGPUVIG9JdGyhEOJgRMdP9PqKz5t2AU23OO6?=
 =?us-ascii?Q?LWDiIrd2l3eEM3KhgMOoD10z0HKee+XlM2h+RfQ3CdV/JrfpU53pQemuBO8V?=
 =?us-ascii?Q?M78DZpLSkJweXejwz3L6Kx2fE5Y31aqR2Qu8rbMCjVySs+KCLCVd0JcQef/+?=
 =?us-ascii?Q?vXZ/nohP3RErX/fTVZa89o4wORQOwa3Qq0Tf+YS/tbSgcdL+8JdGhk9S3+FB?=
 =?us-ascii?Q?KZQv4QL8di/NL7gkr+PNjJI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 371afdb5-3423-43d7-e2fc-08dde40524d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 18:28:09.9794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cuR+u5OyxKh403iL4ZQFz3715SpHh4nfzGpE5DE4OdbZj1Cj4tE84DlEsz83aCWNt3d4v03E+xRPfT3Ws9ogtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5793
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



> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Monday, August 25, 2025 11:15
> To: Wang, X <x.wang@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Poosa, Karthik <karthik.poosa@intel.c=
om>;
> Xiong, James <james.xiong@intel.com>; Summers, Stuart
> <stuart.summers@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.com>;
> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>
> Subject: Re: [PATCH 1/2] drm/xe: make xe_gt_idle_disable_c6() handle the
> forcewake internally
>=20
> On Mon, Aug 25, 2025 at 09:57:58AM -0700, Xin Wang wrote:
> > Move forcewake_get() into xe_gt_idle_enable_c6() to streamline the
> > code and make it easier to use.
> >
> > Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Xin Wang <x.wang@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_idle.c | 23 ++++++++++++++---------
> > drivers/gpu/drm/xe/xe_gt_idle.h |  2 +-
> > drivers/gpu/drm/xe/xe_guc_pc.c  | 13 +------------
> >  3 files changed, 16 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c
> > b/drivers/gpu/drm/xe/xe_gt_idle.c index ffb210216aa9..8556b3ff1561
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> > @@ -322,15 +322,11 @@ static void gt_idle_fini(void *arg)  {
> >  	struct kobject *kobj =3D arg;
> >  	struct xe_gt *gt =3D kobj_to_gt(kobj->parent);
> > -	unsigned int fw_ref;
> >
> >  	xe_gt_idle_disable_pg(gt);
> >
> > -	if (gt_to_xe(gt)->info.skip_guc_pc) {
> > -		fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > +	if (gt_to_xe(gt)->info.skip_guc_pc)
> >  		xe_gt_idle_disable_c6(gt);
> > -		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > -	}
> >
> >  	sysfs_remove_files(kobj, gt_idle_attrs);
> >  	kobject_put(kobj);
> > @@ -390,14 +386,23 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
> >  			RC_CTL_HW_ENABLE | RC_CTL_TO_MODE |
> RC_CTL_RC6_ENABLE);  }
> >
> > -void xe_gt_idle_disable_c6(struct xe_gt *gt)
> > +int xe_gt_idle_disable_c6(struct xe_gt *gt)
> >  {
> > -	xe_device_assert_mem_access(gt_to_xe(gt));
>=20
> I'm afraid you missed my comment about this line in the previous review.
>=20
> This line has nothing to do with forcewake, so it should remain.
> or if you really want to remove, please send it in a separate patch with =
proper
> explanation.
>=20
> Thanks,
> Rodrigo.
>=20
> > -	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> > +	unsigned int fw_ref;
> >
> >  	if (IS_SRIOV_VF(gt_to_xe(gt)))
> > -		return;
> > +		return 0;
> > +
> > +	xe_device_assert_mem_access(gt_to_xe(gt));
Sorry I missed your previous comments; I did not remove this line.=20
Move it here since we could directly return if Xe is running in SRIOV mode.
> > +
> > +	fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > +	if (!fw_ref)
> > +		return -ETIMEDOUT;
> >
> >  	xe_mmio_write32(&gt->mmio, RC_CONTROL, 0);
> >  	xe_mmio_write32(&gt->mmio, RC_STATE, 0);
> > +
> > +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > +
> > +	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h
> > b/drivers/gpu/drm/xe/xe_gt_idle.h index 591a01e181bc..9c34a155e102
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> > @@ -13,7 +13,7 @@ struct xe_gt;
> >
> >  int xe_gt_idle_init(struct xe_gt_idle *gtidle);  void
> > xe_gt_idle_enable_c6(struct xe_gt *gt); -void
> > xe_gt_idle_disable_c6(struct xe_gt *gt);
> > +int xe_gt_idle_disable_c6(struct xe_gt *gt);
> >  void xe_gt_idle_enable_pg(struct xe_gt *gt);  void
> > xe_gt_idle_disable_pg(struct xe_gt *gt);  int
> > xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p); diff
> > --git a/drivers/gpu/drm/xe/xe_guc_pc.c
> > b/drivers/gpu/drm/xe/xe_guc_pc.c index 0f8430acd16d..88557e86d637
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > @@ -1076,7 +1076,6 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc
> > *pc)  {
> >  	struct xe_device *xe =3D pc_to_xe(pc);
> >  	struct xe_gt *gt =3D pc_to_gt(pc);
> > -	unsigned int fw_ref;
> >  	int ret =3D 0;
> >
> >  	if (xe->info.skip_guc_pc)
> > @@ -1086,17 +1085,7 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc=
)
> >  	if (ret)
> >  		return ret;
> >
> > -	fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > -	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> > -		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > -		return -ETIMEDOUT;
> > -	}
> > -
> > -	xe_gt_idle_disable_c6(gt);
> > -
> > -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > -
> > -	return 0;
> > +	return xe_gt_idle_disable_c6(gt);
> >  }
> >
> >  /**
> > --
> > 2.43.0
> >
