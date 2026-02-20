Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62862C5AD46
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:41:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CA910E827;
	Fri, 20 Feb 2026 17:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="REnaaBQi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC6110E827
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771609278; x=1803145278;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lj3wd5cQ4dF12vV7mRa87gAPtanBIrPjTEfzmNbQaz8=;
 b=REnaaBQiFRAU5rMl+p+k8dkbQLCcH9+d7510/viI3vTl5g4jMFDE8Oap
 KJpZ9TB8iSpOO+y8toCyPZqr+SwgAcEmEIxqMACtYPuFcQaIvVBcmViM8
 J5OJwKGvQIoAwhFRfkGrEc1IDJYVvNWWKcEn3LobU2Ab0tPLF2WFrlPek
 +5dqHVlM/x4HWKw5ZkcXA0A/yhUqiVZ+dcdgtCOLT1Rikjs4X7ideKTo6
 gsUxmkGtFphYFp3fDxpfRhRSVes8hD4w0sHzXOj34uPm/LnwL8BAoPz6V
 D43riQBsV1YdVaKAXh1gPhbfjD8CqeRpb2i3GNgrze3v5iGRb3cmLApSX A==;
X-CSE-ConnectionGUID: PCnFAyoNQQWDrE9B4BISHQ==
X-CSE-MsgGUID: f18C9i6xRACoxlNF01DJlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72805466"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72805466"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:41:16 -0800
X-CSE-ConnectionGUID: SglPR2xMQGW0bLvnrl3/yg==
X-CSE-MsgGUID: r0NWcilxT9m1qZPC8cU/CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="219411598"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:41:16 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 09:41:15 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 09:41:15 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 09:41:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yr7jo/LkEkvf+aXQBK4n6zFBDsxmQVZDUoe6DAQoh+gYM1PuvHFo+Gxc37RyRPftzcojbMROzSVEDzPFqkZrngjhOcEkHgYii6nhIJ4sx8W2t9TErqr09vsLXC3cwV7TdkPohJURI3Y0mFNAct4r0e76aINKKf/kggMqp0xmD+wsY00Afoi6XCT1Q4HghkxnXZcscvZqNVx8mv/MzpvkBkJClJ+fQc/UbAjCRl6v6QF+G08WMyKFWmpHIDzImBS8p/qTusEaVnOtewjCyN14c92nrdBGVYnruMFLgR5eNnFxmNyO0u1GLflVDL/BnADnLvjZHhMqpmsfdl2f22Rwhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvHTUhtlYtGlmAAEzBNpCnGqoq/roGb/Na58GTfC5io=;
 b=hewag0dWY5elW1JnPEOIl4AU3gzbiiLkLL6XdxxUk84ltBWFFg5xdFZohdRyeb0D5CAL3fKqGMjvkeOv9Ua1BD9Fe0lHfGAg/TA/DwdGOtJo7GBee/2kjYp4w9Pvdn4EQfl9no7UIdXWC+6b1oYLK5Xp2lnuPdJFJ+OsnsfM5F7mBx3WeFmC+za3yQv0US5m6spulzNZ95lzJdxAy2OXxl5vqIGgiY+I6Ttm+pGsphjhimyK6kieR7YxEtBYNx1pDK1wlc3B9/zdYG57CaX4f82eSK1zQzqvcDM0BZ3DPI19Cnb1XWBYe16mZYCsx4SC68cgQdiyVZzQ9Z7ZlCBCrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV2PR11MB6045.namprd11.prod.outlook.com (2603:10b6:408:17b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Fri, 20 Feb
 2026 17:41:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 17:41:11 +0000
Date: Fri, 20 Feb 2026 09:41:09 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v2 5/5] drm/xe/vf: Use marker to catch fixups during LRC
 creation
Message-ID: <aZictbFKXH0O7Xie@lstrano-desk.jf.intel.com>
References: <20260218232159.1726873-1-tomasz.lis@intel.com>
 <20260218232159.1726873-6-tomasz.lis@intel.com>
 <aZdznFXPHUm6QxYD@lstrano-desk.jf.intel.com>
 <32a24f8a-582a-49e3-9d6a-5f5bd91e22cc@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <32a24f8a-582a-49e3-9d6a-5f5bd91e22cc@intel.com>
X-ClientProxiedBy: MW3PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:303:2b::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV2PR11MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d44289b-7f12-4c5e-6797-08de70a73cd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Te1HBqnKDHlk6rHYzksvn6WY3/WEKx9Yyw3sOZ4e0efE7/TW8v31JaEGVeV2?=
 =?us-ascii?Q?XIYxndc6kshjD46Eolrho+TG2ylCVlePzPOK8LHaUqDyt3P4E512CGHWev2X?=
 =?us-ascii?Q?6sFMIpxg5IReSUxJsCB8RyMxGw1Qa0s2idooCj1h1yGMrOtTzc6KRBJ8qHHE?=
 =?us-ascii?Q?KchLN76v4yBi1eCXNDSoE5tLm+Q9bTcJ/EJLslHxCbDHGdm6ghxw8VqzO8PH?=
 =?us-ascii?Q?YMQ4siyEVhgs6PG+7wczp/wWo+yOgZaobZY3C7gvp+NfOIg/jL9tI0eQFzCW?=
 =?us-ascii?Q?2BYOydd15NxgU2h3BtoZaWfIwxkDrbr2hNCtT4rQnV1OHczXUdHcsrw7ALRv?=
 =?us-ascii?Q?j9vGC4ubOdVl/D1WYocp4hx61IAijOtzErD7L4avUOYRLmVYOhihZJTzMU0M?=
 =?us-ascii?Q?xt6TvtVOwZ/pSpLYEouK+ulSTdJrqUoUAixg2WNx2FJ54zluGGiAMWxmLUXS?=
 =?us-ascii?Q?CG5yM61kBDG0J3JabCZ6F6c1vmBFtpxPl/x7Qd1noMrtVtJoU80xvR3PEfnD?=
 =?us-ascii?Q?KIo3S9W9CVsoaxsnqirN+v/VYUFZT1HtyYKXU6hFp6ZRAlqWUNK0hW+HN3WG?=
 =?us-ascii?Q?DGF/jRQHh7B6SItyI8MM1l6wvzV4RDNci8moLHiOws4vToE9TzFakE9JI7o2?=
 =?us-ascii?Q?j81HhyHH3U3qbn+Kss+exzw3Fqhwww5/RpCPPsmM8uNPoyhJuXeBRqU0Zb6i?=
 =?us-ascii?Q?Hb+h35qyAPat5ngdkg8vjww6Esp1ZEDNJXc9Fj3DZjgzcfbIKxi+ZVt/c/cT?=
 =?us-ascii?Q?ZdEmpXubrkYUgwm3AJcGLZQBjlYb9RsUm2WUA+ru25KyEzXk6c8Av0sy1/Ek?=
 =?us-ascii?Q?I5yO/QjfWMXfTOwGRMqYHLGSCkGZuO14b8EiFd+fupvSTtOBzYpilI7gazSK?=
 =?us-ascii?Q?n//PvG5OxoQZpgQDAGTJ26c/awAzKraeqfkvmy6/sxnXEe9vXjLuB8dqCNV/?=
 =?us-ascii?Q?98n7enviLfIGdz/J/V7/2VyLAdO5jZNcmaVkwfyLPP3FzC6pXFeaBg1P4shG?=
 =?us-ascii?Q?+8s0KpstZLkrfxnrWCTB63wLX6G6MXkkvA5nEgKkVmXzmt/WOolLiydaGo5w?=
 =?us-ascii?Q?WpCMuytB+Ywsf1ClKtQp7z7dUxQGm8bAIcF1bNJ0YEDKXrTj/rNqEACWqHzq?=
 =?us-ascii?Q?xle3aVIblgh/HdqlSvbpDwrHOnEKO1mNYmA+nO3t7ad94jN+/D4BanbaWSBq?=
 =?us-ascii?Q?thuNzzH+tShtZn5BoLiAo8r36FBHXtJwr28KJ48YFOnj99GiX0CbV+KAT6P8?=
 =?us-ascii?Q?vt5kwwpWW9kMvz9I04YUsyeAncRYkla/eaU9isA5bl11/tQ6Y3bgs0NxMNaI?=
 =?us-ascii?Q?qMn2HXAULw/qR+3jj6MfhlDIFJSYNKXqRewbKyQ2hEnnuXW9NKDFK6vrYEtU?=
 =?us-ascii?Q?XVxJnBXYOTxSl+sIZa502R/VkvKPNx9hdTFUWXk/iparh9lCSmcsCaPz11V8?=
 =?us-ascii?Q?4AnqoEIEET/qIZegWWU2Osg0iSHKM5ddlTPU7VIG6f3xoQcfeaCehnKoY1Vz?=
 =?us-ascii?Q?6c86eyufBhr9B3vweuvQKKPMaZX6SIEC09E3ZmEw7fkdOG7vKpBtVmenMhn7?=
 =?us-ascii?Q?gU3XEhW2z9EvPph7SNE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JDykiaedgZYaHHQp/+/UU9rJ0vuNRj/fccbrZR/O4z2iDaThiWfxVzr+73DR?=
 =?us-ascii?Q?236olp5+pCb87A/vvCaKBkWWS6h3hfeakZpW+3cueAkwhBJEvhkJWwtKqDiO?=
 =?us-ascii?Q?5+jDDsw4/6vTgaW5EcRg1jvLXUHKFi/m2V2XMFtMNbDL+dD06v8GqceiR57Q?=
 =?us-ascii?Q?1QSKkITM31rTyqqoCgOucIxsUIG8eS421l3GILEUTeoNy49/PhZKHzRZBb++?=
 =?us-ascii?Q?fqK2MQ61uA73WreycNKHcagE4F+j6i8VcWp2ylpXCqG6uJ128OzjYlc6DRxe?=
 =?us-ascii?Q?aIhp9F+QUakWixZLwUngOoJ2AuDzX0dQkOOJ88FkSOtTuQ8bYRvzGGrdj0Gu?=
 =?us-ascii?Q?fNdWMSfFI/EmdyfZywfZcAx2pjtEba8uye5IbeXgSaLYbNrGlr3qcGKBqcMB?=
 =?us-ascii?Q?GFvH9GDjtk3YVibb6gywUbPbl/j3QgwRnOGp5kIF2D1lOfU1ckMk1yz6ulZJ?=
 =?us-ascii?Q?iYY9/fQxLkASkualwSd8Z0ujvBOvXJfNqbqDdNhYF4hyrIKl0OjhajDwC+uW?=
 =?us-ascii?Q?odlqW1BJzaCEVfraCBXHhmk99XjlkkDkU6VM4GJY5NggF9yTDUbujf2DRBOk?=
 =?us-ascii?Q?A9z7UJttzsL3il10Sb9OL9VW+4x+I9HyZr7GBDq5s9PCX0J2cFmdUoYB9aav?=
 =?us-ascii?Q?vwkFBUuY5ZRUx7Rx9NTkVR/TJodM5hbS5ep9TQV/Ua3p18NseEWUH3uqucQK?=
 =?us-ascii?Q?bxK882AWrGq23Fk0tpMAo4xvaJ/7Mu8yn7weoIifd+g9dWGehtcslCbfEnsX?=
 =?us-ascii?Q?s3wA8+lwswqrr/6m7jFlKzIJ/kSHPitsJVVmtSxlzOrnwDq5V8WhxM8rbpFZ?=
 =?us-ascii?Q?2NffRrPt+M3SmpQ2NFZXEP79tJCoo9l/nAA74pm7wemgQtxkP1RDmd6YUAOV?=
 =?us-ascii?Q?XaOAUBe/iB2UtpfRvc89SFnjNTLVaXLUaFXkwQISMhTKJG0Ocd+s2eox7siE?=
 =?us-ascii?Q?j97rsicbNJJyyow3KMKGsn/hM1s3oJxKrmsatxT03sNgxje6JlLwB1o3VOj6?=
 =?us-ascii?Q?ctQZvDozjbNNsvPKc0/wKF6AdldY+v8MdoR4vAO64m7Ffaw8yxoHZvJcQtXG?=
 =?us-ascii?Q?PhyyukbpUWJQKfyp3CIlXcTdYoKKVLsSCoybiyjVtVXFVHEpwZpdjA/Sdj0K?=
 =?us-ascii?Q?4DMi6lce1FQ6g4OBhNxNAgWhzJcM1fIJKxKHnipzw+R2qAuC1/jiXpu02FAb?=
 =?us-ascii?Q?L2SqDSWsKpUAMfm7JoOk4LIokjxhtH0kDJCGAVQbsScqrVHY70FaMADe0tAI?=
 =?us-ascii?Q?FcT9yBJ8ZUVGe0sbfi9I84iL63jOyQG16khOCpozggJ/jLKcuKm3/MtZ/QrE?=
 =?us-ascii?Q?Adlp22VnaKb2a+5IYc26zoE8kh7wb/2yXYW+4zdF5TDcg6AoGhdJF1a+r5RM?=
 =?us-ascii?Q?MHY7b8Lmpq1PKWPMfXZtKRouFYR9+eCgxxCc4Ds9wcTuT9heLqlMWQOYf5Gf?=
 =?us-ascii?Q?ZIRatvMThz0+qxD80+KRBFmScuA6krdYf97zhbZhGpDvS7Uz0JxVU2/BQwSz?=
 =?us-ascii?Q?K/urP+N2R8YFkhukBlKUCG0hxckzvayBBma7/qVeQlx0QkAzuTKGJ84mlSm/?=
 =?us-ascii?Q?Y4Qq0T3cTUl68MD/1Ilbcs65ZpXN2W2zbUV9pTi9jo4ub8p7697IW+KMiBUB?=
 =?us-ascii?Q?pQ9e3x+draYMoirZQfJdc+HaYhs2FCybMYPnj1qOA7lwON8X91PpKY3bOZz2?=
 =?us-ascii?Q?JNupvoE2aWdyDfMJkGrK3bIYKoiH+91CIupmJ8uzYgZ3otklBmnFW6XDC0n+?=
 =?us-ascii?Q?Zb7hm0CPwpKSAzu2HU3ZzU+e+mjGQmU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d44289b-7f12-4c5e-6797-08de70a73cd2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 17:41:11.7074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ik6cRPO/lQremXjrSJtBnaYWUR+3jI1VBMd6IaAeY2zg+E+GA69VhITgbGE2CpG7nulnStD3/3emZfC7do2RPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6045
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

On Fri, Feb 20, 2026 at 05:43:50PM +0100, Lis, Tomasz wrote:
> 
> On 2/19/2026 9:33 PM, Matthew Brost wrote:
> > On Thu, Feb 19, 2026 at 12:21:58AM +0100, Tomasz Lis wrote:
> > > When LRC is created during fixups, it may have invalid state. Ensure
> > > that all such situations are caught, so that LRC creation can be
> > > repeated.
> > > 
> > > Due to VM having arbitrarly set amount of CPU cores, it is possible
> > > to limit the amount to 1. In such case, there is a possibility that
> > > kernel will switch CPU contexts in a way which makes previously used
> > > detection methods miss a VF migration recovery running in parallel
> > > (by simply not switching to the LRC creation thread during recovery).
> > > 
> > > This possibility is not only theoretical, it was revealed by testing
> > > that in a small percentage of specially crafted test cases, the
> > > resulting LRC is damaged and causes GPU hang.
> > > 
> > > With the additional atomic value increased after fixups, any VF
> > > migration that avoided the usual detection during LRC creation will
> > > be caught.
> > > 
> > > Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_exec_queue.c        | 6 +++++-
> > >   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 7 +++++++
> > >   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       | 1 +
> > >   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 2 ++
> > >   4 files changed, 15 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index 2ebf25a35557..a8d26fece38a 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -308,15 +308,19 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
> > >   	 */
> > >   	for (i = 0; i < q->width; ++i) {
> > >   		struct xe_lrc *lrc;
> > > +		int marker;
> > >   		xe_gt_sriov_vf_wait_valid_default_lrc(q->gt);
> > > +		marker = xe_vf_migration_fixups_complete_count(q->gt);
> > > +
> > >   		lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
> > >   				    xe_lrc_ring_size(), q->msix_vec, flags);
> > >   		if (IS_ERR(lrc)) {
> > >   			err = PTR_ERR(lrc);
> > >   			goto err_lrc;
> > >   		}
> > > -		if (!xe_gt_vf_valid_default_lrc(q->gt)) {
> > > +		if (!xe_gt_vf_valid_default_lrc(q->gt) ||
> > > +		    marker != xe_vf_migration_fixups_complete_count(q->gt)) {
> > >   			xe_lrc_put(lrc);
> > What exactly does this marker buy us? Couldn't patch #3 just signal
> > 'gt->sriov.vf.migration.default_lrcs_need_fixes' where
> > 'gt->sriov.vf.migration.fixups_complete' is incremented in this patch?
> > 
> > Then just drop this patch?
> 
> This solves an issue which was found by test fails, so it's not theoretical
> (though it is a rare sporadic):
> 

I agree the existing code is broken and need to be fixed.

> Consider a VM with one-core CPU, where migration happened while __xe_exec_queue_init() was executing, during creation of LRCs - so after xe_gt_sriov_vf_wait_valid_default_lrc() has finished, stop was inside xe_lrc_create().
> It is possible that this queue creation function will be preempted and will remain without progress during the whole migration recovery. When the function finally gets back to being executed, it is already past the recovery - and xe_gt_vf_valid_default_lrc() will return true.
> 
> This means the whole function will run as normal, without any code flow change caused by migration. In particular, a LRC which was partially created before migration, and partially after recovery, will be kept.
> There are two problems with that: one is that depending on when the CPU context was switched, this LRC may have GGTT references and may have skipped fixups. The other is that LRC created during VF migration is sometimes damaged even after fixups, so it needs to be freed and re-created - and we did not detected that, leaving the LRC as is.
> 

Ok, yes I see the problem but the way you have this coded is still racey
and bit ugly on function calls.
 
How about...


        for (i = 0; i < q->width; ++i) {
		struct xe_lrc *__lrc = NULL;

		do { 
			marker = xe_gt_sriov_vf_wait_valid_default_lrc(q->gt);

			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
					    xe_lrc_ring_size(), q->msix_vec, flags);
			if (IS_ERR(lrc)) {
				err = PTR_ERR(lrc);
				goto err_lrc;
			}

			/* Pairs with READ_ONCE to xe_exec_queue_contexts_hwsp_rebase */
			WRITE_ONCE(q->lrc[i], lrc);

			if (__lrc)
				xe_lrc_put(__lrc);
			__lrc = lrc;
		} while (marker != xe_vf_migration_fixups_marker(q->gt);
        }

So we basically combine xe_gt_sriov_vf_wait_valid_default_lrc and
xe_vf_migration_fixups_complete_count into a single function.

Like xe_gt_vf_valid_default_lrc and
xe_vf_migration_fixups_complete_count are combined into
xe_vf_migration_fixups_marker. The implementation would be something
like:

xe_vf_migration_fixups_marker(...)
{
	if (!xe_gt_vf_valid_default_lrc(gt))
		return -1;

	return atomic_read(&gt->sriov.vf.migration.fixups_complete);
}

The lastly, we move the marker check after making the LRC available to
the fixup handler. My code does have bug in it though, the fixup handler
can UAF on q->lrc[i] if we retry here in __xe_exec_queue_init.

So let's add some helpers for LRC access on the queue...

/* Use this in __xe_exec_queue_init */
void xe_exec_queue_set_lrc(struct xe_exec_queue *q, xe_lrc *lrc, int idx)
{
	xe_assert(..., idx < q->width);

	spin_lock(&q->lrc_lookup);
	q->lrc[i] = lrc;
	spin_unlock(&q->lrc_lookup);
}

/* Use this in xe_exec_queue_contexts_hwsp_rebase */
struct xe_exec_queue *xe_exec_queue_get_lrc(struct xe_exec_queue *q, int idx)
{
	struct xe_lrc *lrc;

	xe_assert(..., idx < q->width);

	spin_lock(&q->lrc_lookup);
	lrc = q->lrc[i];
	if (lrc)
		xe_lrc_get(lrc);
	spin_unlock(&q->lrc_lookup);

	return lrc;
}

What do you think?

Matt

> The `default_lrcs_need_fixes` tells us the recovery is still in progress,
> but it doesn't tell us whether it already finished before and we've missed
> it.
> 
> I originally didn't though it was achievable, as GuC communication is slow
> and something will be always executed while the VF recovery is waiting for
> GuC. But it turns out the CPU may get switched to other tasks, leaving the
> queue creation starving for the whole recovery.
> 
> What can I improve in the description to make this clearer?
> 
> -Tomasz
> 
> > Matt
> > 
> > >   			i--;
> > >   			continue;
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > > index ff9fb9196486..240c53b07eb3 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > > @@ -1254,6 +1254,11 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
> > >   	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
> > >   }
> > > +int xe_vf_migration_fixups_complete_count(struct xe_gt *gt)
> > > +{
> > > +	return atomic_read(&gt->sriov.vf.migration.fixups_complete);
> > > +}
> > > +
> > >   static int vf_post_migration_fixups(struct xe_gt *gt)
> > >   {
> > >   	void *buf = gt->sriov.vf.migration.scratch;
> > > @@ -1274,6 +1279,8 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
> > >   	if (err)
> > >   		return err;
> > > +	atomic_inc(&gt->sriov.vf.migration.fixups_complete);
> > > +
> > >   	return 0;
> > >   }
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > > index 8c21b8ab2f16..4651c7f3335c 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > > @@ -41,5 +41,6 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
> > >   bool xe_gt_vf_valid_default_lrc(struct xe_gt *gt);
> > >   void xe_gt_sriov_vf_wait_valid_default_lrc(struct xe_gt *gt);
> > > +int xe_vf_migration_fixups_complete_count(struct xe_gt *gt);
> > >   #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > > index 8be181bf3cf3..41d6199e3508 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > > @@ -54,6 +54,8 @@ struct xe_gt_sriov_vf_migration {
> > >   	wait_queue_head_t wq;
> > >   	/** @scratch: Scratch memory for VF recovery */
> > >   	void *scratch;
> > > +	/** @fixups_complete: Counts completed fixups stages */
> > > +	atomic_t fixups_complete;
> > >   	/** @debug: Debug hooks for delaying migration */
> > >   	struct {
> > >   		/**
> > > -- 
> > > 2.25.1
> > > 
