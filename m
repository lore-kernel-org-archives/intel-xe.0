Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B45ECE579
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 18:07:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC3B10E61F;
	Mon,  9 Sep 2024 18:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dFMRQT0T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AC610E61F
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Sep 2024 18:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725905218; x=1757441218;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WtwA6SLjCeJwIro7mX6WgtzGNg9JyDYl3mZY+a0v8rc=;
 b=dFMRQT0TZXIt7kpJTwGCMO1Vb0wFNd+qGQi3wdWkfN6J1+zsSreo0tv7
 rLxtb4+4d2sX8MjWlea2BBh4HoOjAVHcNT3LTasv2B4/FlmSpgx0aDWPw
 +TH969OTJfWqEmgJkjhtmEmldtvXUNsQBv7rMWARFH1vhR7TIO9fm3pL3
 tsAGjDoL7ReYoV3ipcyZfrrB/h5Awah+GHEIB7VzVUzq4DskG/00g2PHM
 efmX4Po/Y71r186Rf5AffODpjwwDUGuGfSA4GP0icRgs5R4TY0PblO9/a
 kZomuLFrux6cP+RSTMApYKaHTdsV/IE36VK2UtNTUvAb1IK5Ml/4qD/ie A==;
X-CSE-ConnectionGUID: uRcUAGwTRduraadAEx0zyw==
X-CSE-MsgGUID: PyM4KV2OR5G22cuJuMayfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="27541190"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="27541190"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 11:06:58 -0700
X-CSE-ConnectionGUID: FAU6RkapS8unWGKZs/CArg==
X-CSE-MsgGUID: rXWf1VlVTIypYE/oc2FVow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="104215637"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 11:06:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 11:06:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 11:06:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 11:06:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEb4tRtcCl5BcKVoyOh0a10kKY4HfMrXjWdCLeBW0yMO6OsZ06B3pKFJr1vFKnELJrBExQ3Q5VK9smZ0qUQVeRL2WuMUbD1KCjwWd13ZfzXpvLYydHLD9zu+z9xdlKyQymOm8eaLc6WiLm8tnulORnCkWj4dahSAG+4RSItZrqxzcnB8xf63nAJgtQ+t4x+BiGxT4lbsfqSFi/W4KfJ3FgWpuAVsmMceiePCQ6GEK48tggL1BwGKrBpqNG4te8Hbz8fR20cerS1h81B+cJs4TmHbKoD1i8h2shdJunon+BJ55bk1YNqTRvz3bo9QkCrJgF6OQxuQ4oHeBrG+7efOjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C54ff+KbZzUmgFPHGJTp/Zj52mO3rdap+7dpwGwCwhc=;
 b=tMY+pdwCIwenR0wWbgK72q/eDzWDAuf4gnq0WfwhhRIJuVh9juMdswcfY9yvqZf/gUdJNPoA/ifZpVWspa8V8w8C35B5TYX127ikey73Az9oczlNWRSXEF7QUE6n2Ez0J9vHJagdwlV0/f11ymM8DJYOvIlXOuA+aBrZ0ExbArDXlWbPT2XimEz71tglPgoOqVX07Cy5MEt/20pPl5GylENmZ9mFwPvsj4KkiZwCc7Cja630XL4PeJHMJ/JiP/vXxYmYPhT3h0GkLl2lzPCt2u/Jsc8xNFsEkGaKpTHgg29L78ODRiOcJ7ZKTz7pnOvV+ue94qocBqjxr0bmOD1dZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB7007.namprd11.prod.outlook.com (2603:10b6:303:22c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Mon, 9 Sep
 2024 18:06:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 18:06:51 +0000
Date: Mon, 9 Sep 2024 13:06:49 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Mark reserved engines in snapshot
Message-ID: <cu6z2g3slc4ild6lvvf6nrxty4ybdhe3hyf2qhpnv2kj6qi53u@fj56lxxphlcm>
References: <20240906205609.3131330-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240906205609.3131330-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0210.namprd04.prod.outlook.com
 (2603:10b6:303:86::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: 338981f5-f72f-4276-6a01-08dcd0fa2e3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?89vrBrVcPZTIC0JFTzgjz8tZF5nyLMjdRnrZ0SWwgAF5SDK8tz2PT3pNI+?=
 =?iso-8859-1?Q?XLU8WGqkksAX/It72l5yKV6SPqEGiRiLJRfJ8wYNKqRWXv3ixNsvYVIpFg?=
 =?iso-8859-1?Q?3OnC6Y9xTHabREiGCCXXMU0jC8oiX2jsYfKgSSFYYQv3pS2US5laO1K1oT?=
 =?iso-8859-1?Q?511cdJ7zPpJjoZLBxk0eZZWFJrruWNwXhX5O8hsDyWOvoPlGuIZ0dWpHgx?=
 =?iso-8859-1?Q?g8xYmv3dpPR/83/wg2DITwXqpLhXI3zlER7KUIL4aKlxW1uSIeyHqzTMPM?=
 =?iso-8859-1?Q?iWjZ1JhkAZcvlSF1Akdz0zQ3Ft5uU8MMPl8PqaI78SCAYWFWY0txYtU88s?=
 =?iso-8859-1?Q?1yaHSvUZiOM61YHXPc8nvm8mKoBG99P7Gdxtd+FeCfh6L1HhP0ItIutn4P?=
 =?iso-8859-1?Q?e3Zzf2oFGjUAbieWnIqaXXMzJoKq4Ts7TblkHVTgUTxUCxG3RM0xqXTZpP?=
 =?iso-8859-1?Q?6/5UeE25PCSkIHp/ebD8TPUBHBK2/xnEOoKO9rHJ6H3NPEvBDCnuWRBudb?=
 =?iso-8859-1?Q?ooylWDekFepmE4FCleGqn181TACzcdS4SOVTMXGWcD7vj5KOBY3Cw8THH3?=
 =?iso-8859-1?Q?RFYh1BpbkeK5qzK02Bb84dzIIY+DkHyOGdZEfWfQmErCMyu5sj4knMfRgb?=
 =?iso-8859-1?Q?52YezHXKVU+Iq84IK/61Wmks/KXsTHauy7gAgXqAnt5HmVC48r3iwm9oCc?=
 =?iso-8859-1?Q?R2ikTFxpt450bu89YqUi6CQawKGow8FBLLlsWt1xzKlKP96NPN2NaK+MFb?=
 =?iso-8859-1?Q?y0jwrLGDXbNUFC0ZKcMfJ1Yf+7eYt8h9ujp9MATBjBr+8jHYqK3htjKnyv?=
 =?iso-8859-1?Q?mvhHtVMnaIvrn6oV+4y+Nt8qZE2QKlG8RrlG0XoRjqeTwavesDY6vrFsdu?=
 =?iso-8859-1?Q?y38VSlv7R86RP3ufeo0Zm0aqhwGMXZjnifeaZg7bVs0jSrKDlkDSEzGJMY?=
 =?iso-8859-1?Q?6n7B8wkdiL91fsY5mrGJ/UsOHWiTx6VQlzvCyQvwRWs3kJwFEt4SWU2l7y?=
 =?iso-8859-1?Q?SqPU/6wJKE9RUaSzq3F/uS2RAKUOu2VZUHC8jnPYKQ9Nl7rySomnRYNIVY?=
 =?iso-8859-1?Q?8hL0jd5mmgw1/NaPvMklZJDF6wiksqigHWvNq6Kk3SCc/hcsv5VVtSSdYo?=
 =?iso-8859-1?Q?EMUW13YT3cQxkVkqJEASBu/ohZmSnskEXRAosNgmQZwsP+8DyocBvst0Vk?=
 =?iso-8859-1?Q?tpMWnedpIPsQLS5qrcubeazChOlW/Jd4KGk2uH1jY6T+byOJGCPwXx2wwF?=
 =?iso-8859-1?Q?1DS5uHTpmYsOGywkgix2FIlkiZo+Y4+a7pDcRIrf7ROD5aQeMJbUfBn8Mg?=
 =?iso-8859-1?Q?AfpwIRLvvKKqHC7zc4gFTaoLFbs1rpmc7tXnioz5Jy9cE07+DiMUq3JASU?=
 =?iso-8859-1?Q?bQtJ6enJ6QMLpea7a6oEmUWr9Rf4Nrmw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?r2wnOKUGMx/TipIQr8nV7dIoCNZAmILNcS0yWHKEKLvNs1VNIG7G0F/tN4?=
 =?iso-8859-1?Q?r/RDeOMsACTWK4X4j4HX3CrJ1/evMUem4TrQTVqE2T2bBll0ZOVlIBEksc?=
 =?iso-8859-1?Q?9i5TkmaMwm3YWFovE2CTWDb0sACVnz8sFogHrc+/qHO+7dNfGy+/XaOMFK?=
 =?iso-8859-1?Q?1XfaZAC1oSu5Ua1bhmBksHyKxI9relmcDytFO3QDXs9cTHU2fd3Jiu3gZi?=
 =?iso-8859-1?Q?BaQ1LUxiNaJ5q6ChfZ0HURju6JzTUqxVtv8R0zLNJUXKr66/mq2wn0zHMi?=
 =?iso-8859-1?Q?GdGl39a00VZxgZyndmXry4YfqUmkcba72loHB0DrzDcOd+6fG77mgad/eX?=
 =?iso-8859-1?Q?I0aXIXqfFijzauoc3wuMDMcOOYCaM/wtHn/zGL/7HB1IbqsUQH9wa4HTJY?=
 =?iso-8859-1?Q?fzvHuczW9SYwR6/cSbOe6zvatknXnSO8Uenul6ZaCBSxHvKioY7L83Jt/Z?=
 =?iso-8859-1?Q?vlxItnTqotgRrQhcSiPSB/9CyxHHDKSWeGFEsr4TtX04dcHTprPuTWO0AF?=
 =?iso-8859-1?Q?1CMO9yQJTkXYkpUOiCnrvQLWHRQMO912v9I4bN+6qzjYNSyHQ9NujZHAdz?=
 =?iso-8859-1?Q?lNwoAsVkOLbHnwwTEXWeCbwchJ7hTeHOG5QyWe1xDg0AUlT/omIYDXdOgb?=
 =?iso-8859-1?Q?qy7JvbFiP7XW6pjGRwtCNXB0vizdLwTCzboI5Ld9QihC4qfXiTnlSatjMJ?=
 =?iso-8859-1?Q?l+uxPBP5/ehuJfVZwzKfUr7JT/SvVe0Usi5ogfcy4fYyKLu9MNSK+12sai?=
 =?iso-8859-1?Q?fTwcwVt4Y36O4UrhggRo1lcC2OwPz4HBDjhi2OVsL7115Kv8HSpFcUxT3B?=
 =?iso-8859-1?Q?UJD5HWAHSyzt/MVCW4DdoS2C5GriRYt++z6ofwJJJsgols8z1iLMt5Ktml?=
 =?iso-8859-1?Q?0Tg9SUlhPw9xTxZ1W+RED6W5ccHnxDk/zQinEirkLzNgavQxmkiV69kXTp?=
 =?iso-8859-1?Q?cFc6Yz7LKz5Fo6ZMIKNqUOfeh8ZDbrtLQb1j0qBgsZMpdsBC1OTrdjoWUi?=
 =?iso-8859-1?Q?fhtXdyPHvsMklelHBJzSdV3XulLNjYGhAuB+2sBjGBEPgnrkfKiS6DiFYh?=
 =?iso-8859-1?Q?w/Xq/qoz6KTBYZ/l2Vi4D3VX5iIU673vu/2hsJRhL2XST0HBALbOKSycZd?=
 =?iso-8859-1?Q?f3pqCvP1X7lKrVRUC7q5E1PupWlr0pUG1BHB1q49wF4LsP8zWDYWfPom1N?=
 =?iso-8859-1?Q?L94bvxoSWaaw2VTxcTzg39kLN9BvGVOBMC6Mn1K/D2HBdE6iTeeFudsr0n?=
 =?iso-8859-1?Q?IW8undDA9xGawX9zwiZ1wn9BFZp2vwg9RH8NHW3l/v4CgJG7C9t3H1POF3?=
 =?iso-8859-1?Q?yED8NU3sZ9ALs35pCJ+GHVkrfznI+do0C9fX+cjYErl9EXBK8WQrqDj+z6?=
 =?iso-8859-1?Q?jpMuile9S7O9i5tIRj13tf4bp1vL9u3lbupOL7bUU0+6uRZ6US7UCfsfIl?=
 =?iso-8859-1?Q?tWkBYQ5QiZtb2UGuz03P+gLJ2wiLYiqONpkUO0q9haZd/PTnJo4HWsHkPf?=
 =?iso-8859-1?Q?m9FnbFdJSgOsxRLyIZSZTOeQlvfA5AdwrU7OCDB5JK8FCa/SHocOMLexK3?=
 =?iso-8859-1?Q?e7AaDRcKQC+yf69dLV+6Y8nyXdKcyibXqN29PweJVxuIiGG8T55G/eWkwq?=
 =?iso-8859-1?Q?eFEDaAcJFXJP2BuMhMA1gxJoUQYsZIHffcgZ95+dpOKyrXPUxzsFyAnA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 338981f5-f72f-4276-6a01-08dcd0fa2e3d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 18:06:51.7227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mr+K2p14ddJYXh2yLN4KWNd8y1Cn/edA76qcJKqB/ZNW/IUV27EZkwbaiPSptlcFiLqqYSpg52XewrHyXjh7HLvGihuGkN5fD7rtFXg1oO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7007
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

On Fri, Sep 06, 2024 at 01:56:09PM GMT, Lucas De Marchi wrote:
>When printing <debufs>/gt*/hw_engines, it's useful to mark
>what engines are reserved so it doesn't mislead developers
>while debugging.
>
>Cc: José Roberto de Souza <jose.souza@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Applied. Thanks for the reviews.

Lucas De Marchi
