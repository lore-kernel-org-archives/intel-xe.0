Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB907C5B572
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 21:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7792610F762;
	Fri, 14 Aug 2026 21:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MG8330iQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF5C10F762
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 21:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786742570; x=1818278570;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=b0rrv5pdhTsVuS0XKT4v1rZCFxJUGDAu9c1vHEPvmps=;
 b=MG8330iQHVN4jBtXuFQzlfVh9nDVvL28sXnsG9DMryQGSogNd2/bs3dw
 kUCdVmRimZebqUU7G6dpdbXlQ/29HKjuiIgDagMIDctgrd/OC/aUcVHZQ
 EDI63yKBD8eIOMR/2lxdaI5GCJ4Yz5TeNqkFlElrZJEFfPmPl8cMEFBTQ
 Qbm7YqIlBSf9DW157ekDSAyfz2gLS22ftrgJX8vLHzV+sQrwRRE3N4ItE
 ceuneJ9ytlQQWJiI/V4XcPpK/gucyDPAsG0GnPE1frBB+PjVcxFPS6R6U
 0QpzDSbyGgsmvlLFKb1veTrCC2nlT7iH1Z+uJPZvK3Sq9F0KC0EQDWC2l w==;
X-CSE-ConnectionGUID: rGSSjuenSCyOxV4+GjSp8A==
X-CSE-MsgGUID: 6ipmd2WgTzSExKRhbh05KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="74856117"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; d="scan'208";a="74856117"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 14:22:50 -0700
X-CSE-ConnectionGUID: ScMWwGAURWKgESFw86jBjA==
X-CSE-MsgGUID: 7rE44G34SMy7dNFqH6srQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; d="scan'208";a="294251912"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 14:22:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 14:22:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 14:22:49 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 14:22:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KoGsL0hu5DPON3UKEL17+CZBxS3m4yB2wUn+gH2Tg5blsR7tSdVVxpXECnKNsgtDp7WXIh1NaNOdSCRm/ogbcbUX6EF8dOVpLY8tEQtSOWMFntCbg250ic5sKdc7hd9upXXQ+A1NYjdDkD1d5fYWDb1f+BxeTCDQCgO6CbJLmNcnPq4jiWD9VoeEn54f8wDa8o0e9GjXoJeyzAn4izW7dQxghtcqAGX4yHihYVr3+DOSnFpQt7q/ZShTkYbr408OnolF+25tQE+g2wa9EpDmUDa6Mn5HGlMvmTrr0wV0UzARJ+nK12qn80oou0m5JT4P+0m2yJ5cBiC3HwZXZArW8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=is7OJ9W0iGyXiU3t8QJtfdrlSof6dr7WTssx3aj1Akg=;
 b=vAbku2JeIcAVJeXOMJUVvpzFLIWUq6OtbE78N3g0pIx/lKINK8LiOFFyacUrHriMIyTa5d3ZV2s/BeXmWcJXKYyImQijY7waN2Dd4F7FLFNut7Y543HvrOq2odhooBGHzvXRY9RKSiDzfl5szwnmahoTzL4PvG+bPFmKjke+M5aQHQAhwaH//5UElWmoZUMrjKhjChHj5ZgQXJCQ4YmjJsw+aw571K2YIaTa1mX5kpuwu0lAR+ySPmYI2sMORyMkY+n4FN6JtrSBHYr2MuAuh8Tcyn9+3CGry1UWEHwVEw3wdOJqE1oFtcKapCiBvt86AbYrAG+rNMsy1UUN+Z48Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS7PR11MB7887.namprd11.prod.outlook.com (2603:10b6:8:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 21:22:47 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 21:22:47 +0000
Date: Fri, 14 Aug 2026 14:22:25 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v7 2/2] drm/xe/sysctrl: Add helper to check oCode
 firmware readiness
Message-ID: <an+HER3exoUdIj0P@soc-5CG1426VCC.clients.intel.com>
References: <20260814095306.2482289-4-anoop.c.vijay@intel.com>
 <20260814095306.2482289-6-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260814095306.2482289-6-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::26) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS7PR11MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: f35e4ed7-4b99-427a-ccbe-08defa4a2467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: f50n8BZuZb8Mq9dnDunAqSO8PRcz5VjvnKA8+JOGU7XAWmXNJkSm6glcG25Zlm9bOKtHqLJJ57mSjKHXKbCf7iGKjlSxgj1PjG4nhNStakRcILhcYYmG3rTTFP01fZZniHEn9cbqki5PTNLJjukiZDtNLBxAVKGxHQqhU6PWhfQJZlBMuo1k2QNl4GG1YexfQqLu/ct3ON8xuh2IgVBE6Jwj5I/KW3sNQSlk/6pXhBiuACsl7EHJIwrerL4E5+s6rF5jx083hgtL07sBqUxUlhGE8x1YisomwTD5RIeIJ3/BQ0nEVeVfR2tjBTy9iSw8VCbYbYBkGnx5vaFRUNo0ZougE/Hcd5bJWkF/O3ekSTedMq9n8nPt387b1fuASg4PiXiH0wzZ7NrAx/WwdyOTNxfIjxFbE/lS8+BkHVkbSexp5JJlNM7tWdB4Z08JcKbKrfMzeSRpqHHEwJCwOJZ+7IAZvkJBVm5Xwni9AcvSx/R8o5mPeDBKsjz8i1SVR+9tArYPyUREj1YCBPUT468Kq5PMV5bDMmx3TUiYq2h+6T+ysLZWLEKfcexAFujF5bCAxABy8s/amks5WDDykmhL1Ey3iwKTKhC4hIlpJdxPoDaW9E/VDMZckn/xkKvvOVuKlWrQCqk0+3/NFyQkKEIsTYqVr1B+J7u97mzdmYrFVw4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGkxVXloeS9VVkZZUkJPT2VaZmZvZldxSy8vVER4NGkwVCtQTnFnVEg0VUhV?=
 =?utf-8?B?WnQxRTlVUE1XenprMzl5YkErandoWS9Wc2ltZ2tnTHpKcE1iZmJyMDlnUzlV?=
 =?utf-8?B?aWdvRUxtY3haZTRjMkQyd0lsbENVN1VzZHMrL2hGTC9OcWRQbURyZTZYUDZi?=
 =?utf-8?B?b3pKU1dLSzIzNGlqcWp5RnJQN2F2OHhpNW1SMTQySDZ6eXBKSGRxQUExN0ts?=
 =?utf-8?B?ZGNxdWRaVnNhN2hUa0xpWXA2aGtObzRiYmxqK2R2UEhVSC9wb2hVd3BHY3pY?=
 =?utf-8?B?NGs1NHZ3YUhoYStENFNmalNNRXQ4Sno3MXRnblFLQ1hlc09qeVFTVFI3Zmd1?=
 =?utf-8?B?a2YvRjIrcWdqNklhN3J3TjlnaUkyQnI4eW9JVE5IZFNzVm1hRDdVY1JtR0lv?=
 =?utf-8?B?TFl4SE9zQ0VpVUFTNk55QW5KcGtsQk1OUTV4ZkdVZzR0cGwwQnYyQmdrLzBy?=
 =?utf-8?B?SXM5QlVJNVh3b1VlV0NKUkVublltQ2ZkR3NSaWgxSUxyMVpDV0laME5ZWVor?=
 =?utf-8?B?Wkpsa0dGcUQ5L0xtN05oL3dBUnlZSXZxNnBaQVN4LzBZdlFNVWN2QmsrY3lj?=
 =?utf-8?B?YXN2anRhUXRVeUpWQVFuYWQ5M1pXV3ZFdlcwQmxVS2Vuc2JOWlNxN2FFWWov?=
 =?utf-8?B?VEJRTTJBRjJmVmU1M2dqQjVLSGMzVENQcFBhMkhVZDdSYnBzaS9ZRVllUVZ2?=
 =?utf-8?B?YkJMNGJxdzlTMUFxdnRvdGVtcjF2dVBqSDI2ek9FTmZnZEZHV0FrSk5Qb0RR?=
 =?utf-8?B?dXNEeTBubFkyOVZuUEh1cHdqdElubnBpTVBoanlJdHl3emc2aUpFNDBWTjBk?=
 =?utf-8?B?YzJkekZWY0JsYjlBekJkNjlWa3B3YmVsczhIYW5XWTB3aHJrbk8zaTRPdzd0?=
 =?utf-8?B?aWdoTDErUGFrVEcyTVZzS1lXczFRbmpuOS91aXRtMU55Vjd0L0RjbXRtME02?=
 =?utf-8?B?bGxLTTNwdDQ5RzJObVNmNUR3c0RGdVJ4NFdlQUJiYlkyVEkxMnVmS0lsL0NH?=
 =?utf-8?B?L3VRa09KbjYycjlzcEdTMkdiT2dFRWNrbW9aWFRKWkJwbXJZS1RqS0hDTzJE?=
 =?utf-8?B?bnJBb09xaTFhd1NHVnIvSG9NSVZrbmd6aVhzRWMxRXlranNvOGdJTEZsdmFk?=
 =?utf-8?B?M0plNFZISHBvREViUVd3bllseFlYdzdZNlhQOWpjcDVvUmhkRXhuV2F2OVBK?=
 =?utf-8?B?RUNIa3ExTnFjdkREeGxRQlpnTVhMRW1zbXFtTFp0U3g5czFXaFFmbGhKbFcy?=
 =?utf-8?B?bVpIVkxJM2VCcDhDSlFZVEo1NGhhVjdDOS96bnZNWmlMZlpvSmw2NHJia2k0?=
 =?utf-8?B?S0E5V0xTYm1xKzd1TnJDQTZXUDNyZ0hXN2RKci9FSGRCYVdQWW5JYjRHeGFX?=
 =?utf-8?B?ekZrNDczV1BlZ3dqK0V2eG51SDVlRVhxU1RhaHZraXZmeU1sWjNpdkd2d2NU?=
 =?utf-8?B?dlhEZmVZRXFHY1ZMQ21PMml3ZUM1QVdzQWxWSzhHRU9WcnRVeldBUUZtZWZh?=
 =?utf-8?B?SU1iMFpBdG1UVld4c3Z3SHpHTDBrekdSeGgrVkVwbmtKbjI4blhaanBJSUZn?=
 =?utf-8?B?emFNOVdxUlhhdGZwWGZkWlhrWWZ3cytWQlNtK1d4TFh4MGJuUWJNQmx1VWlT?=
 =?utf-8?B?d3g5bTFqMWxyN24wNTBGSlZvNkxPSUxSc1Z4NWZEZkxjNlNhaEdSZW5pN1Zh?=
 =?utf-8?B?dmVFc3ZFdHIvS2l2Uy9hR1ZQbHh6dnpkLzFrd2ZZM3d6L2dRTDA1dEgzR0Nv?=
 =?utf-8?B?bldTdUxXbVhyVGdCeVJwS2RYdEVoUUI4d2cxRjRYVXczVUlzZWZmQ1NZWWhK?=
 =?utf-8?B?TlZveVJ6cUI4Y1phNzJsakZEWHpxT2dpWS9jaFc0WWlDOSs1WndYekVxbitT?=
 =?utf-8?B?cncvdktiSVhYRURQWXV4aWozVlRoQ2w1RDJmUXBHSnZHZGZsazZ4b2Uxd0NV?=
 =?utf-8?B?Nm1kdElRVG40eUhGa3Vjb3Y4b2NpcGNYc2dVb29DQi9aT1ZUWjdyZnFWMVgv?=
 =?utf-8?B?M01hcG5CZUdoVExSRjJndko0ZG9ZelhYUDFxcDN6Mk1HYTRBQ3lYWEFMTjlQ?=
 =?utf-8?B?elBVaS95b2dXSHZrd0lTbkY2VXBkU3NTUlZIUFIxM0hSbmJNSEJSWmNGTW5V?=
 =?utf-8?B?MHZhYlB0ZlVNYzJQWm9BY3k3bmJTanFhbHd1N25iN1RZOTVxZnB4UFd0VkFJ?=
 =?utf-8?B?VmJWdkY1MjZRakkwMzRacTk0dHVGOFZJMEpxcVVnMlE1U1pBNklGZ05ORmti?=
 =?utf-8?B?VC9Eem52YmxRbHM0YmpVL1JxODZWd1VlSmhoRFFTaHY4SUQvMSt4bnBQeGJ5?=
 =?utf-8?B?TUdWcHM1S1ZkSDJKWC9WdDhLOFRVTFF3TEw4eHRaM24xaTZzNVhjRUJBamZO?=
 =?utf-8?Q?LynHHzk2pOBwx7Q4=3D?=
X-Exchange-RoutingPolicyChecked: SDV1FKIhQPwPYxB24XbGl2TnOfamPTapaUhijuIoJH0BEIJZyDOAUn5ojL/YTvVwcFymAJ9GRA+9UrFZaeHQZmT7ujN4278NWgU7no3wEsqiWgGd0K+gizt2WbMac5Bagiu0mRRsR6Q5oo4keDYAHUWcN1eMgfwATKbf6H6eHRB5F5rzVGhxs4Sdo7jYTgvB01BYiTqWzcbJwoEsftZzrjlPD0uZKSY7GVitAq2LUGdyn4Pvsl52n28OYHtI1+nbFrn9qv/3748VF///6Qpc9dgYLF8nt25Eqthq1h5fnVxR18EB7Rr9M7HU6ymMhCofp31HE4v9hrfW2Cdm/FFZ6g==
X-MS-Exchange-CrossTenant-Network-Message-Id: f35e4ed7-4b99-427a-ccbe-08defa4a2467
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 21:22:28.0082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4gZ3J7gPvXav/egE0uAa1hWRpe9bblCShi/DY6E1GOyesOgLiSYXz6l/jil3tVV6Y6fbIZKYtx6oAUJe+lCGvzYJJid7zwj1K444K8+lgQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7887
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

On Fri, Aug 14, 2026 at 02:53:07AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add xe_sysctrl_is_oobmsm_fw_ready(), a convenience wrapper around
>xe_sysctrl_check_app_status() to check oCode application readiness.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
>v6:
>- New patch — split oCode application readiness helper out of the
>  original patch into its own commit
>
>v7: (Umesh)
>- Clarify xe_sysctrl_is_oobmsm_fw_ready() comment for sysctrl-less platforms
>- Add XE_SYSCTRL_APP_OCODE to enum xe_sysctrl_app_id in xe_sysctrl.c
>---
> drivers/gpu/drm/xe/xe_sysctrl.c | 23 +++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl.h |  1 +
> 2 files changed, 24 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>index c53a26af3189..488e30b3d075 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl.c
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>@@ -42,6 +42,7 @@
>  * application ID.
>  */
> enum xe_sysctrl_app_id {
>+	XE_SYSCTRL_APP_OCODE	= 0x0C,
> 	XE_SYSCTRL_APP_DIAG	= 0x0D,
> };
>
>@@ -189,6 +190,28 @@ xe_sysctrl_check_app_status(struct xe_device *xe, enum xe_sysctrl_app_id app_id)
> 	return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
> }
>
>+/**
>+ * xe_sysctrl_is_oobmsm_fw_ready() - Check if oCode firmware is fully initialized
>+ * @xe: xe device instance
>+ *
>+ * Returns true if oCode firmware has reached the initialized state, indicating
>+ * it is ready to handle requests. On platforms without System Controller
>+ * support there is no System Controller mailbox to gate on, so oCode firmware
>+ * readiness is not tracked through this path; the function unconditionally
>+ * returns true so callers are not blocked by this check on such platforms.
>+ *
>+ * Return: true if oCode firmware is initialized, or if System Controller is
>+ * not present on this platform; false otherwise
>+ */
>+bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe)
>+{
>+	enum xe_sysctrl_fw_status status =
>+		xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_OCODE);
>+
>+	return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
>+	       status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>+}

Same here. I would split it into 2 separate helpers.

Thanks,
Umesh
>+
> /**
>  * xe_sysctrl_is_diag_fw_ready() - Check if diag firmware is fully initialized
>  * @xe: xe device instance
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
>index 8dc576796890..b69a3f474236 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl.h
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>@@ -20,6 +20,7 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
> int xe_sysctrl_init(struct xe_device *xe);
> void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
> void xe_sysctrl_pm_resume(struct xe_device *xe);
>+bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe);
> bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
>
> #endif
>-- 
>2.43.0
>
