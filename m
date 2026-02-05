Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39E3ECD992
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 17:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A9F10E390;
	Thu,  5 Feb 2026 17:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bmLw/PFw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC65C10E390
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 17:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770314324; x=1801850324;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZMADfTmXeRpD+Fvlu8MBlpRYe++BrXg1qQuzXBHDshk=;
 b=bmLw/PFwTQEuuloJpjSsM6KpRWjB1/GBJiiO5MWAzGUqpo5oPRD8wB4t
 aC3N1bCJtqClc4RMqSwR6HvOJZZz9KdQKAnHkVysurNvl1viQv6xSRlNx
 1sADEAdhZr148T2dx0QM99/0bvlNLdGzN++sTzyg07LhcGXGPlkitPgi6
 +MuGUjesyE+EcCpRH5I9heG8/D+Qk/PP0mc23t1VO1l8mduXTRAFp6jo7
 QHYru2BaeoC+BRgAhayIEUzmZzTGXbYeNwblkRBa5trG0U6/adja5fUf5
 PCb/gafKXQmzaUbUIftBb2oqiqCdkKuc21q6a08TJqfk+7HPVN+d2ht10 w==;
X-CSE-ConnectionGUID: 94IK+CUISeO83CTvDEeLeQ==
X-CSE-MsgGUID: 3hYaLBimSXmXvkW690qg4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71618683"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="71618683"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 09:58:43 -0800
X-CSE-ConnectionGUID: inVmd2z2Sp+ISEFElOt4Kg==
X-CSE-MsgGUID: o/Pj2LEgQCKHmyeWxlJlQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="215112945"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 09:58:42 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 09:58:42 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 09:58:42 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 09:58:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZet+jZrl5k77ybtm5uuXpsgHZK+KN4O7NpqTkb6FChXwfklM8NWtxFmFW6ggS7aFVZM/TNI9AfIVVujT20sDHiP5aX5lwxx/0io8VqLI3+sNrGjvrFWUb/d+J/zvFriStm6SqHkflg40R+o5UxymXVdbzKBFud5tn3l1H/OP+Al+C9w5Olyr7hMPzBJjz2KQD3cIqXehxu0mv2FoB2Lv7zWj1D9wI3MyIHZeW/SmBOdhHbCXxkdJg5YDYdA7ZIP2GL1SaqwppY7PUVzz+67VdcX2x0L5CQnyvopRup1tS/yoghXR71YfTNng6WLfnq9NJHRJTwpUAJ4JFnjUmSang==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnRw220IgahJV/di2SJx1Xp4f/cLfwdtFeYl7Kr1jL4=;
 b=zLPtq2xsaZbnQeCaY+OeW2YOfKj9HQUJKFbT51/Nusi5VaSyPVKalUwgPOTvNL8xmfOg4gt9bLrDh3a1hKH/nTPy3iyO4NLrRTcfR6smzNFDfvat6xYX3fnI4m6bsPxlQctp5sKv5NtkAheGQgfGAYLyccF4UiJjqJkG0BjAqrZsHzTtwCMGOcQudYqUYUnkWmTfqVAZK5BWbTjXGbEBCyYUqenGzjDpwsZTxuVaqPw+T2ZmUCx66Kc+AWByIUjMojof5pnbXwkwne0CoMyw7R7Z6irBpuoOLqFWsWmqQKr9X1S+PMOx3gRDgss0+ZLdPUFkXSpTvL/l8yCCjjvWNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL3PR11MB6316.namprd11.prod.outlook.com (2603:10b6:208:3b3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 17:58:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 17:58:40 +0000
Date: Thu, 5 Feb 2026 09:58:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Falkowski
 <john.falkowski@intel.com>, Michal Mrozek <michal.mrozek@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Introduce a flag to disallow vm overcommit
 in fault mode
Message-ID: <aYTaTTm+iaj2VfQt@lstrano-desk.jf.intel.com>
References: <20260204153320.17989-1-thomas.hellstrom@linux.intel.com>
 <aYOWWAg9O1KUhnpO@lstrano-desk.jf.intel.com>
 <4a012fa66d9eb5858f41159d5b65f790d57e6297.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a012fa66d9eb5858f41159d5b65f790d57e6297.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0097.namprd05.prod.outlook.com
 (2603:10b6:a03:334::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL3PR11MB6316:EE_
X-MS-Office365-Filtering-Correlation-Id: cd0f4471-707a-4426-094d-08de64e0316d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7JsYSru6u9lthPGzh3kLYHOG8LvCobvZ3JHnYGRxH4wY5gE8qan1rVEFXE?=
 =?iso-8859-1?Q?0vS+x3Uynnxs7YnaKDRy+DCTMxKW16DDmH7aicI9YqZBuM0lOf3VQN5r4B?=
 =?iso-8859-1?Q?cMNPxOIvwsDxCbCwiOYI3nC2N8QiCAbaafYtqmHr+ySn8AEbUIfQ8YPTKH?=
 =?iso-8859-1?Q?MbaC+zFqh/c1WlgkLL2q1JrfbWtiRziQPqhEjLzn7kmUFwg8M4Xjy0WGa+?=
 =?iso-8859-1?Q?Ape+U0CZbgVpIkUDr656yXF5IRYP1TfnOugQvQ93GRBW69cRBBc/EFhDCy?=
 =?iso-8859-1?Q?vpqyxxiMqs8b08JRp0Cgu7jywOLPa0z5PGG68T0bWpv0e7LYHy4r4nzK7F?=
 =?iso-8859-1?Q?3sxv3homVyA7xCzzJfJbMd1z8F+Vausl6VSNsho7s2oZC/0x7bCAqoM2e2?=
 =?iso-8859-1?Q?Jw2KJ9n50LLx2YbJ4Dk+sn9WA9Xs7ksXD5poK3y1i7mAeMPAe/HApqUwu1?=
 =?iso-8859-1?Q?XPACIgVHcIyWmiTnchMVmlg2aU5CVJLfm9/PPwBzVagKndEs8oB9/siTk7?=
 =?iso-8859-1?Q?6MToFkFBav+Tgo8zca2XI7mho37kBsLOPMVxx7+NnUfrQhFEUSVvxMx+UD?=
 =?iso-8859-1?Q?xUuy4+tYomv7Dor2uFswPo6KhnGute2/WIwTozY1hHVoiWJHhqSGXXlXfQ?=
 =?iso-8859-1?Q?1CRbGM99k+CGo2pPNmRCdKDvNVgxuZSQ14izSrbVRSpgZX+b86uIA1W5qO?=
 =?iso-8859-1?Q?4P5dqcYhOieEOYXb/Z+coNgIe+U/6zmRNnZ5vxdipmkTpcboMycDbyDEGf?=
 =?iso-8859-1?Q?y9SS6TIMuSmsltXfcDPnqGzEFe0Ggo6hKULj23YYOVaKreN3xOC1u10NS3?=
 =?iso-8859-1?Q?KO8Z9EYtDHPyKpBpVi89gdB8513D3PqeyKD77ZoILI3FH/YI+BlMhoKBSf?=
 =?iso-8859-1?Q?SBb1OolMOY/mYp1sLrqk1V0oH2+P7EhVaSwk1yCBsNlQHqZ+2s/40iQKZu?=
 =?iso-8859-1?Q?fPCP7SV86JrQTH6VrIIEYA55D5GFI1HkBDHaZVd+yhHqk0p5T3CO7WPVX0?=
 =?iso-8859-1?Q?73f/TmPB7KOyonGS7iT4t0i34jYhEQbrvEOBcrjalr2J02tf0+peB0dvYZ?=
 =?iso-8859-1?Q?Riw+/hTRm6PHl8y4lO6TRvUoBoigxm18iqeCV+1OJRM3l3bjZD5e/rZWm0?=
 =?iso-8859-1?Q?G5KZn3LQv9igYahxNad2EBigkHdG7I9rBhOWDJLqKKKF07oAfC4z6Qmmi7?=
 =?iso-8859-1?Q?QBfCqAWNY5kKh3vWh4vB+ullayhEsaGAg8NbCv/pSeIDksztRxrAe5DK2c?=
 =?iso-8859-1?Q?Zho/2CgfCMKWod62x77gQZjeVBcuhUrHHYyJttdHGBzl9eDlNRUsPK1P4Y?=
 =?iso-8859-1?Q?7Tj+oYDtHiWg40HQx3SeEREG+MvEQu+tqVnX/JmixAGQ2mBkotg3W8hg1S?=
 =?iso-8859-1?Q?hrURw/wDvJTkQRPs6sQWA/qp0Exsvr6VzunFWaMCVJIGweWA9g0R9lG3EO?=
 =?iso-8859-1?Q?wnRa0mO6I5plTGl8ilsMQH1H1tgxgzOCPxRf0yoSP3oHVCx8hd93YhM46j?=
 =?iso-8859-1?Q?G00AdbnB8HGkUCJUoXYfcaZMzK/sb+aBx3Vhq+KY10ljhU5ljTgn/w8btG?=
 =?iso-8859-1?Q?Cl0DT8UOtf9tACz/z5AaFOoW2enkRjQu2iD3T0MgIzWseaO7X6MTTWOZo7?=
 =?iso-8859-1?Q?OteuyqkxqHIto=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Dr6oWwuqyxQGv8il5ZfuyGl2nbDRKx226gxQXXbUTsbfXAZiAnNG4nvjAq?=
 =?iso-8859-1?Q?q/ldGafAZT6HRSp2DeXIpjf5ZvMNL92UUyv7xeyLUq7vWdeUOjU0iNbiV6?=
 =?iso-8859-1?Q?JSVcZFCrXxUuyGx+tYXOw3auv248fflC41/YOl577QVTYXXK7mIr0xoH38?=
 =?iso-8859-1?Q?kMMH0TjMBV3ItupaL9KcVNDGp+GV2a1PHHsC4VzEWcFAG04ANds/5KtUIf?=
 =?iso-8859-1?Q?HBGbkA6BWXiewf7gRbYFmn74COOMFsxGY2dllp45cJEkIcUuFPw2RqcKRk?=
 =?iso-8859-1?Q?GWf9h1pRogaFiM5cl/wJGeU+MQJdFxYDiUGaRae+oTDujMsOgCnFJ90U4r?=
 =?iso-8859-1?Q?VQaagGPnE9nlXgWr4he92A+GbFuDO0tL3k3oGN9j8tvLG84lelXYzOsuLe?=
 =?iso-8859-1?Q?Sdbpye6sqsIzCl8wf9eCNUsAYFEI+EgWLCqxnjUk0sgbml7WyC4TNYGdHd?=
 =?iso-8859-1?Q?Lf672KJlI481gv6OjfxOVCA5w6dT6i1CyHz4vm8OBtSxFHyzovQrsp4poW?=
 =?iso-8859-1?Q?LusBo5t3CaY7CKgwkFUkOHHXREsZyqC2ruTdKlKiLPj/peNIh6Q1ssRQvY?=
 =?iso-8859-1?Q?rwiBQAfJFqqNPy2YQ4XXixapxitwC7JmkTvu/2JA6avp4irxHsyNZs+FbN?=
 =?iso-8859-1?Q?Do6BA1ZRWJpKFgyH1kRvNIRyr3pwGjozAtVOgtXxuRw8FMmnnGjz63PxPh?=
 =?iso-8859-1?Q?bIVEOjC+w0Ebep5ZWU4ziV/xqCEfy+viDF4ga0mW+DgU8Zi8eNMKGea5/I?=
 =?iso-8859-1?Q?pE+EtMvpfeyBcaCpmGHviU934wjnLSFUH0B5xmr8qGik0x5KevzUhREaI3?=
 =?iso-8859-1?Q?vFDwbbdiYThr9cnZVDRSnwwSg/7Hzqn27W9/yRf6QXVoJr+pq6/W3KRC9a?=
 =?iso-8859-1?Q?Wa2YwXaZ9F+RpYBRaXz9KA2Hp6Kr0UjveeHdrHYzGK7FVMN1777h/rbLSZ?=
 =?iso-8859-1?Q?/YPwdU+MLvyGdli5bpLzxhJWPNFRu5Hg7hWNnSPNsyQAxGAJ8zFY7SKp+K?=
 =?iso-8859-1?Q?fU5R6UVNnpPgsT66FyfwSZfO0fsR942/XUcrBtm+UR+GgRCNTv5E28E8Rw?=
 =?iso-8859-1?Q?zI3LKnvo5cVtLI+WhsiM6AclobRtd10EMqstc+YGKDZzvqCnDOdzI6x+9E?=
 =?iso-8859-1?Q?xQSNhCJ6LIvZsNn2zPQ5B36RHxdAFzjd1ujbW1ZMsUBxHmEYeyalAv94Sw?=
 =?iso-8859-1?Q?NDqvDogAjfFlzMjyLJVp8HOUhV0r88I8zqKtKobYrNi4NTwORZEGTly1uX?=
 =?iso-8859-1?Q?EcKIhqkw0/y7E+h7ZLCk/rVD6SkzxpC0o+gn+OM8+81M2H8jQUm5QaTtjj?=
 =?iso-8859-1?Q?Bgla0l9aNzplYZIeZKHhXLNJt9IywuSSa15qj+8qpd6nuMg/iEyZ8QSjpS?=
 =?iso-8859-1?Q?CndiFclMbyXH/TuZj15N03vgi1nYWE+i81LRGG+C+0ncACQI27PdzFyMVs?=
 =?iso-8859-1?Q?ulUi5GDiER+XTwIHpmKQvq/5dAygf8IrGyxn4mc3VNd4ClW1IrX1xN2hw4?=
 =?iso-8859-1?Q?3vcBNLMdjUMitKrTdAlyAdiNo9NSqbn0x+Ud/xhciJ+vI4r7MOsbzqFC/z?=
 =?iso-8859-1?Q?+YpXFtQBIMAublh5TgXV2X7zH1yu40MMyh5IXf6Dpq5ZR4bR+TPSK/gdjP?=
 =?iso-8859-1?Q?ziEL4Ao/PLNWuSkvRQGGMoC3qzUJyVWx96vXde1kU5ZNKEW6dsIE8LkFbb?=
 =?iso-8859-1?Q?t5MKDJrf+9sopaQ+4RtnM/NpCa0U3JH7uI/dac8+Cpv2HBL0LQFdLXrm75?=
 =?iso-8859-1?Q?w+o8ndiU50cYeO6MMVDmYO+5RmFanP0Yx25DLHbN0D7+RS6ISxrfLuYRWP?=
 =?iso-8859-1?Q?asbUAzBP0A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0f4471-707a-4426-094d-08de64e0316d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 17:58:39.9910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ggi073+1vUbmg3JHoW6HUwisz+rG2im0XO7UGFcbeOQBGQWN03sSoNolfdrems+oae2znO6fRWbeG59FgCQhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6316
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

On Thu, Feb 05, 2026 at 09:06:24AM +0100, Thomas Hellström wrote:
> On Wed, 2026-02-04 at 10:56 -0800, Matthew Brost wrote:
> > On Wed, Feb 04, 2026 at 04:33:20PM +0100, Thomas Hellström wrote:
> > > Some compute applications may try to allocate device memory to
> > > probe
> > > how much device memory is actually available, assuming that the
> > > application will be the only one running on the particular GPU.
> > > 
> > > That strategy fails in fault mode since it allows VM overcommit.
> > > 
> > > While this could be resolved in user-space it's further complicated
> > > by cgroups potentially restricting the amount of memory available
> > > to the application.
> > > 
> > > Introduce a vm create flag, DRM_XE_VM_CREATE_NO_VM_OVERCOMMIT, that
> > > allows fault mode to mimic the behaviour of !fault mode WRT this.
> > > It
> > > blocks evicting same vm bos during VM_BIND processing. However,
> > > it does *not* block evicting same-vm bos during pagefault
> > > processing, preferring eviction rather than VM banning in
> > > OOM situations.
> > > 
> > > Cc: John Falkowski <john.falkowski@intel.com>
> > > Cc: Michal Mrozek <michal.mrozek@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_vm.c       | 11 +++++++++--
> > >  drivers/gpu/drm/xe/xe_vm.h       |  7 +++++++
> > >  drivers/gpu/drm/xe/xe_vm_types.h |  1 +
> > >  include/uapi/drm/xe_drm.h        |  6 ++++++
> > >  4 files changed, 23 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > b/drivers/gpu/drm/xe/xe_vm.c
> > > index 8fe54a998385..cf92b6e13a16 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -1938,7 +1938,8 @@ find_ufence_get(struct xe_sync_entry *syncs,
> > > u32 num_syncs)
> > >  
> > >  #define ALL_DRM_XE_VM_CREATE_FLAGS
> > > (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
> > >  				    DRM_XE_VM_CREATE_FLAG_LR_MODE
> > > | \
> > > -				   
> > > DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
> > > +				   
> > > DRM_XE_VM_CREATE_FLAG_FAULT_MODE | \
> > > +				   
> > > DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT)
> > >  
> > >  int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> > >  		       struct drm_file *file)
> > > @@ -1977,12 +1978,18 @@ int xe_vm_create_ioctl(struct drm_device
> > > *dev, void *data,
> > >  			 args->flags &
> > > DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
> > >  		return -EINVAL;
> > >  
> > > +	if (XE_IOCTL_DBG(xe, !(args->flags &
> > > DRM_XE_VM_CREATE_FLAG_FAULT_MODE) &&
> > > +			 args->flags &
> > > DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT))
> > > +		return -EINVAL;
> > > +
> > >  	if (args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE)
> > >  		flags |= XE_VM_FLAG_SCRATCH_PAGE;
> > >  	if (args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE)
> > >  		flags |= XE_VM_FLAG_LR_MODE;
> > >  	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
> > >  		flags |= XE_VM_FLAG_FAULT_MODE;
> > > +	if (args->flags & DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT)
> > > +		flags |= XE_VM_FLAG_NO_VM_OVERCOMMIT;
> > >  
> > >  	vm = xe_vm_create(xe, flags, xef);
> > >  	if (IS_ERR(vm))
> > > @@ -2903,7 +2910,7 @@ static int vma_lock_and_validate(struct
> > > drm_exec *exec, struct xe_vma *vma,
> > >  			err = drm_exec_lock_obj(exec, &bo-
> > > >ttm.base);
> > >  		if (!err && validate)
> > >  			err = xe_bo_validate(bo, vm,
> > > -					    
> > > !xe_vm_in_preempt_fence_mode(vm) &&
> > > +					    
> > > xe_vm_allow_vm_eviction(vm) &&
> > 
> > One question. This is existing code but can you refresh my memory why
> > we
> > allow overcommit on dma-fencing VMs? Wouldn't the next exec IOCTL
> > immediately fail?
> 
> Yes, but mesa can handle that by user-space eviction. In practice IIRC
> they unbind everything and re-bind on demand. No care for performance.
> 

Right, no I recall the background.

This patch LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> For preempt-fence mode we have the dreaded oom-in-the-rebind-worker
> which we still haven't fixed with a UMD notification, so we're forced
> to avoid that if at all possible.
> 
> /Thomas
> 
> 
> > 
> > Matt
> > 
> > >  					     res_evict, exec);
> > >  	}
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.h
> > > b/drivers/gpu/drm/xe/xe_vm.h
> > > index 288115c7844a..f849e369432b 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > @@ -220,6 +220,13 @@ static inline bool
> > > xe_vm_in_preempt_fence_mode(struct xe_vm *vm)
> > >  	return xe_vm_in_lr_mode(vm) && !xe_vm_in_fault_mode(vm);
> > >  }
> > >  
> > > +static inline bool xe_vm_allow_vm_eviction(struct xe_vm *vm)
> > > +{
> > > +	return !xe_vm_in_lr_mode(vm) ||
> > > +		(xe_vm_in_fault_mode(vm) &&
> > > +		 !(vm->flags & XE_VM_FLAG_NO_VM_OVERCOMMIT));
> > > +}
> > > +
> > >  int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct
> > > xe_exec_queue *q);
> > >  void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct
> > > xe_exec_queue *q);
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 43203e90ee3e..1f6f7e30e751 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -232,6 +232,7 @@ struct xe_vm {
> > >  #define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(7, 6),
> > > flags)
> > >  #define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(7, 6),
> > > (tile)->id)
> > >  #define XE_VM_FLAG_GSC			BIT(8)
> > > +#define XE_VM_FLAG_NO_VM_OVERCOMMIT     BIT(9)
> > >  	unsigned long flags;
> > >  
> > >  	/**
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index 077e66a682e2..e54f8e12acd9 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -975,6 +975,11 @@ struct drm_xe_gem_mmap_offset {
> > >   *    demand when accessed, and also allows per-VM overcommit of
> > > memory.
> > >   *    The xe driver internally uses recoverable pagefaults to
> > > implement
> > >   *    this.
> > > + *  - %DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT - Requires also
> > > + *    DRM_XE_VM_CREATE_FLAG_FAULT_MODE. This disallows per-VM
> > > overcommit
> > > + *    but only during a &DRM_IOCTL_XE_VM_BIND operation with the
> > > + *    %DRM_XE_VM_BIND_FLAG_IMMEDIATE flag set. This may be useful
> > > for
> > > + *    user-space naively probing the amount of available memory.
> > >   */
> > >  struct drm_xe_vm_create {
> > >  	/** @extensions: Pointer to the first extension struct, if
> > > any */
> > > @@ -983,6 +988,7 @@ struct drm_xe_vm_create {
> > >  #define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
> > >  #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
> > >  #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
> > > +#define DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT  (1 << 3)
> > >  	/** @flags: Flags */
> > >  	__u32 flags;
> > >  
> > > -- 
> > > 2.52.0
> > > 
