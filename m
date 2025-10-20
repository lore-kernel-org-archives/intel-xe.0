Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5DDCCD193
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 10:00:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D22710E145;
	Mon, 20 Oct 2025 10:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZqStwRY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5CC10E397
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 09:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760954400; x=1792490400;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j+ypwQf8iDipejIO5CTR1wuPaSN8x4xR1IbJLcpayHM=;
 b=RZqStwRY3bB3C+By+W/NXfuF2I0vfv+n+u5w5g5GXSIKbv2u6EVGkOMN
 iAEz8clKqE4ilgj0AqpBjAJ+gnkbqPkcgfwYXbluLHqHn5L2kZ7VV6eIZ
 NmjgMiC+LduAvx/bRkiIekejP/HApeMe2oP044LwC3Pwp9qbOhcKFW71O
 bpw7+3f/veBjhpafrtdInu4LSyaJd6bw4URPtw/KUGnnrzb9rlgzlADT6
 82wGgOXX2vlO/TDPfdUb4s58WKYEIaVF73gib/PPoczYg+afiu6WiXMdE
 voIuHNzD+UL4JNENPf/RJ/GVcCdkg0h7PBDEn/3Yk6h3/C81bRrQ7HxEd w==;
X-CSE-ConnectionGUID: ABJ20/erQquHRwOMCfC+XQ==
X-CSE-MsgGUID: eYhNBtTUSqWgt3j5qXP7sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="74187369"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="74187369"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 03:00:00 -0700
X-CSE-ConnectionGUID: rRXrFJZkTkOpNJ8nba1hAA==
X-CSE-MsgGUID: b5hgZP8nSkOXp4IrbsBmsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="182480838"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 02:59:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 02:59:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 02:59:58 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.41)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 02:59:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4hLjv+taqEgh3lz03vgzFZ6XFgxm0aCfhJxuLS+k8YWgSdVDJIGBldeVixqhqcBCH3FrhgLxUn9/irAok2Hgfu6U/Z/QYwcuhV6iErJbecuvPt3niIBD2/HQ6VhkCJcjScleMjO7CcvQzBTsCiVi8Z7cxbN524eXjkvwzT+P7Q/y10enMXraOfFCiGKobufhDI9nmjSBFr6qucH8JD3iQei+Zl/aCYkZdr893kWvO46mBp9ZU2pRh9wTd0DAppCEmNJwTZpVhjnItmXyQRaNaERDCJgysNkgiu4I1UlbuSIPktENi+btjLmJW2Uq4as/dGiE+IwqP1ijZsoImJgtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+ypwQf8iDipejIO5CTR1wuPaSN8x4xR1IbJLcpayHM=;
 b=dAuRrV5dLBtL5KimxB9w1dB89RUZnpcOiLdIqAp0plZOoJ8h8Uqj6F4xxxwsw5Lue4EUJkwixNbVQsvv/QrU0UPr+s7kXaAkXRePmxk2PspOI8vDwWttzTitL1pdvYdjiKSVJDzItHmEnU9g7GljOro0Yvfhg4M520LxprtL85xaTpXGS6A068d6q0K0YP9vf9ZizFGy4f9LE8MT/V+iVNC3fdWAzprdkDOa5pGOHOzh9gcDh8YfpPRQOwUxuHEQX067mujEdk+X5fa1EatsIBETWnHJppc9XOFJeRR/QcopjT3MNc49gnDxvRRHKO+UlM7jwiZik8Y+o3rtialV2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6271.namprd11.prod.outlook.com (2603:10b6:8:95::6) by
 DM3PR11MB8684.namprd11.prod.outlook.com (2603:10b6:0:4a::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.16; Mon, 20 Oct 2025 09:59:56 +0000
Received: from DS7PR11MB6271.namprd11.prod.outlook.com
 ([fe80::3ced:5f14:c459:aa17]) by DS7PR11MB6271.namprd11.prod.outlook.com
 ([fe80::3ced:5f14:c459:aa17%6]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 09:59:56 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Falkowski, John"
 <john.falkowski@intel.com>
Subject: RE: [PATCH v2 2/2] drm/xe/uapi: Hide the madvise autoreset behind a
 VM_BIND flag
Thread-Topic: [PATCH v2 2/2] drm/xe/uapi: Hide the madvise autoreset behind a
 VM_BIND flag
Thread-Index: AQHcPfZCcx0JZq1LmUWnFhWSHT5Cd7TK1Fsg
Date: Mon, 20 Oct 2025 09:59:56 +0000
Message-ID: <DS7PR11MB627122ECC173F3A16615F683E7F5A@DS7PR11MB6271.namprd11.prod.outlook.com>
References: <20251015170726.178685-1-thomas.hellstrom@linux.intel.com>
 <20251015170726.178685-2-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20251015170726.178685-2-thomas.hellstrom@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6271:EE_|DM3PR11MB8684:EE_
x-ms-office365-filtering-correlation-id: 86713c50-850c-4ffb-2577-08de0fbf6c4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?aXYzbzhZcEpoQjAyaDBORFlLZi9NTVlHcTNlWjZGTVZKSFpZdTdnMDNlT2dB?=
 =?utf-8?B?ajZyc1pQSFRFcVEwbnhQcWZ2c3RHM1REQ25QNzNsOFBoTElhZnJuNUxjRnFo?=
 =?utf-8?B?OXlReUV0L285MVR4UUI3WDdvZ3piUGxTNmZjQ3FmeFA2SUo1Rmo2WHVPaHdS?=
 =?utf-8?B?RXFBSjlzbGxrV25mbWI0ekNxUHA1MklJZCs1ZkVJakcrVnJyOVJTQXpObXMv?=
 =?utf-8?B?Z21pQ1QzL3ZlaXFqOXdJejYvWU9RU1VwUjlqU2NyaUxkNnBDMlEvYXA1YzdK?=
 =?utf-8?B?SEZ6UU50eHhOMXFOK2lLWEFhUEFSTmJLR1dVb244M05pZnArdW80QjQxZW5h?=
 =?utf-8?B?bGJ6b0RPVjZNR0E1akxVWTYvQ3ZxNnVQS3hZNXEzRFo3dXF4ZnZoSHcrZVNq?=
 =?utf-8?B?L2M5Z2RnWjN0dmdXODlxZ1RjdVhnR2k5MUtRYUFCbGltd2NBUWxISGhhQkZ1?=
 =?utf-8?B?UUFXVS9xalhDbFlSRFIzM0RicmFrblFWSXA3STJieWFuYkYwWGNzcDBud0NM?=
 =?utf-8?B?dTYrbnF4S2hNN2NZY0R5bFFFZW9hZHJ3Smd3bFZpY3RZblptU2ZLNjJtbG5Q?=
 =?utf-8?B?M0N0akRrOTE4c0tQVURTT0ZjU3FzVDZsNEdzaHE1T3dNZTJrcmprQ1ZpTkQ4?=
 =?utf-8?B?MC9Gbll6RXZJQ2FIS21Zc0tsVzZYQ1pPUXpJVjhjcm1zZElaTjdpRUlSdmpD?=
 =?utf-8?B?RElDTjBwVkYyd0pwdkpkYlU0REFjN3A4TTU4THk4K0gvalg1cmxGSTJGZUU1?=
 =?utf-8?B?RGU5eGZvb3RRelVlT0YwRU5taStzVG5aMGZTZWRqSXZ1TzJQVEd3U2xaaS9x?=
 =?utf-8?B?MnJwZk1OSjVibUYxVjNsellTUzdzaVh2VmhYd3A1UWdzeWEybHBwYmRVVDYr?=
 =?utf-8?B?MjUyVmtURVJhb0NDVEFUVDBTK29PeXBnTFRwL2RWeFhERWhIUmhscmtoSzlH?=
 =?utf-8?B?ekRnODEzdFpJdktldGY5S09pL1FBVFRDTTVpUTVBZm1XSnJmL2h3cjJ1UG9X?=
 =?utf-8?B?aVVqWERJczVUTlE2TFY4RzRZbHdoZ3IwOXNqWEY3dXh6VTk0Y2g2Q0xBdkxN?=
 =?utf-8?B?TnFMWFhBZXl3ZEh1NzB0bEVJZE1BNEdZTEZTdFpaMWFqRE4yRkF5T05qVENO?=
 =?utf-8?B?dExEYk9MdU9veHQrdHAwL3l0eUlnSHptbWhUOEtNWkJ3MHVLdU1ZMmNxaEJJ?=
 =?utf-8?B?UEF6UUpHTUpSSFFYWFRqdmVTZDdOaGZRb21nL1VvSXhybmk1V29maW9zKzBB?=
 =?utf-8?B?cExaYXJjS1hyMG0rWkhxOWRqOGYzN29velo1VWRtckVCNmNFZENjaUVoQWdT?=
 =?utf-8?B?S3ZvdmRZZXFnMGtlZUJzY2ZFYTI1c09XK1V4SFBDdEFITDFlRGtJU2xkRnVu?=
 =?utf-8?B?anoraU5JYzZ5a21pOTFvVEVnazZGTk9uRnNKaHMvYUlaeVY5cFFYSUpsNHNP?=
 =?utf-8?B?RDl6Z0dOTURleDh1WVdjc1c2L0gzUmFZTS8xbU12ZFN1RkRycFFVcTRXUWZL?=
 =?utf-8?B?UVk0N0JCc2JUTTZuZkxXS3VCOEpkZ2xFNzg2cTcxa1RKeGRKTEdMWVRPSWRk?=
 =?utf-8?B?ZkE0VlR1cnc1bmVNWU9ZcThKdUcwQkhGalorZ2lseGZkRDM0d3E1NnBrUlRh?=
 =?utf-8?B?TlExbWpjaGxXM3k4ZGhyaDJlM2xoQlVyWU02aVdSV09SUDFKRzVCYXpmK2hH?=
 =?utf-8?B?ZkdIZ0hjV2VvWGlSclVFeVZ0dnRMSFpQdURZY1AyeVBIbytKM1V1amU2ZGwz?=
 =?utf-8?B?bnRjYy9NU2pSYXg1MWVKdW1raUszQ2Z1bHBDL0F0RVhGMHFFeHRzVUtzRU9m?=
 =?utf-8?B?Lyt1ZDFWY1FaaktNZStBSER0eFVwbFRSV0NVVWt0aVNoeFZJS2pXV1Nabmpy?=
 =?utf-8?B?N2pwb0lySTA4c2Y4U3pWVitaS1BmVGV0VEcvVjZOaVFjQTROSTIzdHhWYUdG?=
 =?utf-8?B?VWszSVV1SFg5VDVaVTBZeTR4Mm1DYUJFVzV0WUdRUDNNZW5wbTEwaytjTDgy?=
 =?utf-8?B?a05TRjF3TnNJS2RMSitlN2ZnbnROM3ZTVGtjdTE4dGppMFdvTUpmdWhRaGx0?=
 =?utf-8?Q?MY1N6p?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6271.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFowZVkyS0FGTFQ1MXJGTjBmb3JNNHplR2NyQzRHcU5rd1FZU0JuYWhYZXFS?=
 =?utf-8?B?OE1jOC85SWQrSDZiQTl1Q3RIUCsvbjF4U2NuL3VBTlZNZ0ZRUDF3cmU4SHRD?=
 =?utf-8?B?NSsxS3MvTGlzNldRUEdSaEk1dFlZT2ZWUHlqUmJOSjl1amYweHFXMU01U09z?=
 =?utf-8?B?d1pwTSswdmZlUGFlLzlQeXBwWGNJbFNmajVQdHRYS2s2amdXOWo5SEVnb05r?=
 =?utf-8?B?YVBvczYxSWo3YkVQUWtSYlM5VEJkTGdUUEVNNCtTM2FpS09CRnQxc3pzV203?=
 =?utf-8?B?Q3dCQnFyUXJSWEFaVVE3MkJFUlRrVHB4UzduYmZmcHFTcCtjSDUvTDhMbVpB?=
 =?utf-8?B?Q3hsV1lSc0o1U292UVhTVTl0SEZZZmRhREFjQWVPeXVTM2dkOUFhbTM1MXI5?=
 =?utf-8?B?bUpHZDFLcFpoQnMzM1hwSzJhS2ZCY1dxZGhwM29pd2sxSDlOWEJYS1BJd0U1?=
 =?utf-8?B?OXZJY1NWbjBHT3lpYTlrcG0wODN3cWpDeUtDRmRZNTlIcCtkNktFa0E2cXg5?=
 =?utf-8?B?YjVkeE1ycnlxUHg4czlKNWFkUy92WUZzZGQzcGRGVHNWOExsRlJEWGxQMVZx?=
 =?utf-8?B?UFJka0MzZk5ISVZnMVphSWdOWHV6RnBjK2QyRUduMnhvQ1hTT3htellQRGV5?=
 =?utf-8?B?cE9Hd0Z2bXc5cHRNZ2dVaERqeXpjUkJNN2hGVWh1cGJkdzY5NXFIWlJtRVlG?=
 =?utf-8?B?K0FGR3d1cUJmSHJwQURPTG1qWDlyaUpLaFZLVlFNb0ZPVUc1K0p3cFZMQjc0?=
 =?utf-8?B?Z2gzMTRFUWpISGRBTG9rSE9YQmJKZ1ByZVZ0Q2FicGhRQTV5RSthVGNSUElF?=
 =?utf-8?B?UnAxNGkyZHEzUHZsdXRNcWdNMnB6WEhMbEhkaUo3cW91S25aWXNVSkhvU3ZI?=
 =?utf-8?B?MHNONm9YU1poOENENHd0dnB2eFkvV1VjRGszczhGNlgzY256L3FrbWJPdWxm?=
 =?utf-8?B?aXp6c2NVQWMveEpsZXpPdkdDY1dHVlBISW9JZXRLczV5WFNsV3o4bTd0a0Yx?=
 =?utf-8?B?SU5tWmtoWmtlU2pJYnV6K3J5bVhCN3dyZ1RqMndLNXAzTk9XaFdBdU1Hc3lt?=
 =?utf-8?B?Q0FiSWdyZTBYMnM5d2pIQjk2YlBoeHJxRUdSSXlYb3h2bk5vUGZRZWR0cFFI?=
 =?utf-8?B?QXN1UW1zam52OG9meHpHMXBYclUxd0RQeU5WeWFHOVF6elRnbWJtSFFDWGJ0?=
 =?utf-8?B?QjE2ZXF3NmdiS25QMnA0VUZLR2RlL0RpYXprUHdlRytTYjFnTm85cVUyODlP?=
 =?utf-8?B?ak9POHJOODRYMnF5L1lmSlpWNUgrRUczbW9lZkV5eGg3Z3daY1c0amJoaW05?=
 =?utf-8?B?U0NOYXJSWFhOZGxtaDlmNWRDQXArVlhab0g2eldubkhCSVFzaXQySTdPZ0E2?=
 =?utf-8?B?SHRBTW5vb3VSUEFBMHRBMGU5S1lQWmdURE1vNms3UGxPc3UrcFFKZWFyM3lv?=
 =?utf-8?B?VVhUVFk5TVhLWWVoOHdCdEZYOXk2Y3RwUlpwaURhMVFFU1MrcmdLM3Q5Mkh1?=
 =?utf-8?B?OTBCWnRBNmtxQzZpY1RVcjROT0JGMk5yTTNDcVBmYVVmazF3SGxGK002YzhJ?=
 =?utf-8?B?OEx4SHY5RFMwdkJqRHZJWTBxV29IQ2JkRnA1OExXbXdVSm50SnlFc3lhZ2xw?=
 =?utf-8?B?TTd2Y2crODBmSmxPUGRlT3BDU1FjakF3c3lHTXhrVFMrYmZiSHdKWTVucXNp?=
 =?utf-8?B?RE56RlV6NTNrWExGNEEwREd6b2ZFSnJiWDNmVUFRYkk3d1pyUXp4M2ZraG0r?=
 =?utf-8?B?eEFZRG1oaXlYeFk0RTFNZmVFcm1nRzMyb0tVTFFwYnd1c0hjRDRjTEZ4Ujcy?=
 =?utf-8?B?K1Y1MDlycXRhM2hwVVFveEMzOXlNSnRVWno1elRIVTVsMUIzUkdndzJla2Nw?=
 =?utf-8?B?TmNEdTlSZHVMTW9nSVVzcFo0TWlBQTVBV1gwc1RSOEQvTSs0RTVzODVhTDRI?=
 =?utf-8?B?VFE5YWdCKytaeWs5S05XVjY1TWNlZTUzVHZlN3doNHk5NFhvSW1kQ043Wk9W?=
 =?utf-8?B?cE9pOE0zVGYrNXBBczk0c2hYS2F5RDNXU1Q2TU4ySEN2OG1iUWsydVRqK3lk?=
 =?utf-8?B?anhWY0Q3Z2VJL1d6YWxUOWNkMlJiZW5aNGIwWUh6Z0F2YmVRQmhlaUhBdTBQ?=
 =?utf-8?Q?Bwh8+5YETOBzaNWwyMJcE8E0o?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6271.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86713c50-850c-4ffb-2577-08de0fbf6c4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 09:59:56.3030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GFDwCbxyyj0KlGRyU/gtaHGVWNztXWQtXtVUQ5kletbVNoX8z0qSQOuxRvZ5ihrNx0Kk5KCXbQHb1oz3JHCUDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8684
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

Pj4gVGhlIG1hZHZpc2UgaW1wbGVtZW50YXRpb24gY3VycmVudGx5IHJlc2V0cyB0aGUgU1ZNIG1h
ZHZpc2UgaWYgdGhlIHVuZGVybHlpbmcgQ1BVIG1hcCBpcyB1bm1hcHBlZC4gVGhpcyBpcyBpbiBh
biBhdHRlbXB0IHRvIG1pbWljIHRoZSBDUFUgbWFkdmlzZSBiZWhhdmlvdXIuIEhvd2V2ZXIsIGl0
J3Mgbm90IGNsZWFyIHRoYXQgdGhpcyBpcyBhIGRlc2lyZWQgYmVoYXZpb3VyIHNpbmNlIGlmIHRo
ZSBlbmQgYXBwIHVzZXIgcmVsaWVzIG9uIGl0IGZvciBtYWxsb2MoKWVkIG9iamVjdHMgb3Igc3Rh
Y2sgb2JqZWN0cywgaXQgbWF5IG5vdCB3b3JrIGFzIGludGVuZGVkLg0KPj4gDQo+PiBJbnN0ZWFk
IG9mIGhhdmluZyB0aGUgYXV0b3Jlc2V0IGZ1bmN0aW9uYWxpdHkgYmVpbmcgYSBkaXJlY3QgYXBw
bGljYXRpb24tZmFjaW5nIGltcGxpY2l0IFVBUEksIG1ha2UgdGhlIFVNRCBleHBsaWNpdGx5IGNo
b29zZSB0aGlzIGJlaGF2aW91ciBpZiBpdCB3YW50cyB0byBleHBvc2UgaXQgYnkgaW50cm9kdWNp
bmcgRFJNX1hFX1ZNX0JJTkRfRkxBR19NQURWSVNFX0FVVE9SRVNFVCwgYW5kIGFkZCBhIHNlbWFu
dGljcyBkZXNjcmlwdGlvbi4NCj4+IA0KPj4gdjI6DQo+PiAtIEtlcm5lbGRvYyBmaXhlcy4gRml4
IGEgY29tbWl0IGxvZyBtZXNzYWdlLg0KPj4gDQo+PiBGaXhlczogYTJlYjhhZWMzZWJlICgiZHJt
L3hlOiBSZXNldCBWTUEgYXR0cmlidXRlcyB0byBkZWZhdWx0IGluIFNWTSBnYXJiYWdlIGNvbGxl
Y3RvciIpDQo+PiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+
PiBDYzogSGltYWwgUHJhc2FkIEdoaW1pcmF5IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwu
Y29tPg0KPj4gQ2M6ICJGYWxrb3dza2ksIEpvaG4iIDxqb2huLmZhbGtvd3NraUBpbnRlbC5jb20+
DQo+PiBDYzogIk1yb3playwgTWljaGFsIiA8bWljaGFsLm1yb3pla0BpbnRlbC5jb20+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5p
bnRlbC5jb20+DQo+PiBSZXZpZXdlZC1ieTogSGltYWwgUHJhc2FkIEdoaW1pcmF5IDxoaW1hbC5w
cmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPj4gLS0tDQo+PiAgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3N2bS5jICAgICAgfCAgNSArKysrKw0KPj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5j
ICAgICAgIHwgMTIgKysrKysrKysrLS0tDQo+PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX3R5
cGVzLmggfCAgMSArDQo+PiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCAgICAgICAgfCAxNSAr
KysrKysrKysrKysrKysNCj4+ICA0IGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
c3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3ZtLmMgaW5kZXggZGEyYTQxMmY4MGMwLi4x
MjllNzgxODU2NWMgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3ZtLmMN
Cj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zdm0uYw0KPj4gQEAgLTMwMiw2ICszMDIs
MTEgQEAgc3RhdGljIGludCB4ZV9zdm1fcmFuZ2Vfc2V0X2RlZmF1bHRfYXR0cihzdHJ1Y3QgeGVf
dm0gKnZtLCB1NjQgcmFuZ2Vfc3RhcnQsIHU2NA0KPj4gIAlpZiAoIXZtYSkNCj4+ICAJCXJldHVy
biAtRUlOVkFMOw0KPj4gIA0KPj4gKwlpZiAoISh2bWEtPmdwdXZhLmZsYWdzICYgWEVfVk1BX01B
RFZfQVVUT1JFU0VUKSkgew0KPj4gKwkJZHJtX2RiZygmdm0tPnhlLT5kcm0sICJTa2lwcGluZyBt
YWR2aXNlIHJlc2V0IGZvciB2bWEuXG4iKTsNCj4+ICsJCXJldHVybiAwOw0KPj4gKwl9DQo+PiAr
DQo+PiAgCWlmICh4ZV92bWFfaGFzX2RlZmF1bHRfbWVtX2F0dHJzKHZtYSkpDQo+PiAgCQlyZXR1
cm4gMDsNCj4+ICANCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jIGluZGV4IGMzMjMwZDNmOWU2Zi4uMTBkNzc2NjZh
NDI1IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+PiBAQCAtNjQ2LDcgKzY0Niw4IEBAIHN0YXRp
YyB2b2lkIHhlX3ZtYV9vcHNfaW5jcl9wdF91cGRhdGVfb3BzKHN0cnVjdCB4ZV92bWFfb3BzICp2
b3BzLCB1OCB0aWxlX21hc2ssDQo+PiAgCVhFX1ZNQV9SRUFEX09OTFkgfAkJICAgIFwNCj4+ICAJ
WEVfVk1BX0RVTVBBQkxFIHwJCSAgICBcDQo+PiAgCVhFX1ZNQV9TWVNURU1fQUxMT0NBVE9SIHwg
ICAgICAgICAgIFwNCj4+IC0JRFJNX0dQVVZBX1NQQVJTRSkNCj4+ICsJRFJNX0dQVVZBX1NQQVJT
RSB8CQkgICAgXA0KPj4gKwlYRV9WTUFfTUFEVl9BVVRPUkVTRVQpDQo+PiAgDQo+PiAgc3RhdGlj
IHZvaWQgeGVfdm1fcG9wdWxhdGVfcmViaW5kKHN0cnVjdCB4ZV92bWFfb3AgKm9wLCBzdHJ1Y3Qg
eGVfdm1hICp2bWEsDQo+PiAgCQkJCSAgdTggdGlsZV9tYXNrKQ0KPj4gQEAgLTIyOTcsNiArMjI5
OCw4IEBAIHZtX2JpbmRfaW9jdGxfb3BzX2NyZWF0ZShzdHJ1Y3QgeGVfdm0gKnZtLCBzdHJ1Y3Qg
eGVfdm1hX29wcyAqdm9wcywNCj4+ICAJCQkJb3AtPm1hcC52bWFfZmxhZ3MgfD0gWEVfVk1BX1NZ
U1RFTV9BTExPQ0FUT1I7DQo+PiAgCQkJaWYgKGZsYWdzICYgRFJNX1hFX1ZNX0JJTkRfRkxBR19E
VU1QQUJMRSkNCj4+ICAJCQkJb3AtPm1hcC52bWFfZmxhZ3MgfD0gWEVfVk1BX0RVTVBBQkxFOw0K
Pj4gKwkJCWlmIChmbGFncyAmIERSTV9YRV9WTV9CSU5EX0ZMQUdfTUFEVklTRV9BVVRPUkVTRVQp
DQo+PiArCQkJCW9wLT5tYXAudm1hX2ZsYWdzIHw9IFhFX1ZNQV9NQURWX0FVVE9SRVNFVDsNCj4+
ICAJCQlvcC0+bWFwLnBhdF9pbmRleCA9IHBhdF9pbmRleDsNCj4+ICAJCQlvcC0+bWFwLmludmFs
aWRhdGVfb25fYmluZCA9DQo+PiAgCQkJCV9feGVfdm1fbmVlZHNfY2xlYXJfc2NyYXRjaF9wYWdl
cyh2bSwgZmxhZ3MpOyBAQCAtMzI4MCw3ICszMjgzLDggQEAgQUxMT1dfRVJST1JfSU5KRUNUSU9O
KHZtX2JpbmRfaW9jdGxfb3BzX2V4ZWN1dGUsIEVSUk5PKTsNCj4+ICAJIERSTV9YRV9WTV9CSU5E
X0ZMQUdfTlVMTCB8IFwNCj4+ICAJIERSTV9YRV9WTV9CSU5EX0ZMQUdfRFVNUEFCTEUgfCBcDQo+
PiAgCSBEUk1fWEVfVk1fQklORF9GTEFHX0NIRUNLX1BYUCB8IFwNCj4+IC0JIERSTV9YRV9WTV9C
SU5EX0ZMQUdfQ1BVX0FERFJfTUlSUk9SKQ0KPj4gKwkgRFJNX1hFX1ZNX0JJTkRfRkxBR19DUFVf
QUREUl9NSVJST1IgfCBcDQo+PiArCSBEUk1fWEVfVk1fQklORF9GTEFHX01BRFZJU0VfQVVUT1JF
U0VUKQ0KPj4gIA0KPj4gICNpZmRlZiBURVNUX1ZNX09QU19FUlJPUg0KPj4gICNkZWZpbmUgU1VQ
UE9SVEVEX0ZMQUdTCShTVVBQT1JURURfRkxBR1NfU1RVQiB8IEZPUkNFX09QX0VSUk9SKQ0KPj4g
QEAgLTMzOTUsNyArMzM5OSw5IEBAIHN0YXRpYyBpbnQgdm1fYmluZF9pb2N0bF9jaGVja19hcmdz
KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgeGVfdm0gKnZtLA0KPj4gIAkJICAgIFhFX0lP
Q1RMX0RCRyh4ZSwgIChwcmVmZXRjaF9yZWdpb24gIT0gRFJNX1hFX0NPTlNVTFRfTUVNX0FEVklT
RV9QUkVGX0xPQyAmJg0KPj4gIAkJCQkgICAgICAgIShCSVQocHJlZmV0Y2hfcmVnaW9uKSAmIHhl
LT5pbmZvLm1lbV9yZWdpb25fbWFzaykpKSB8fA0KPj4gIAkJICAgIFhFX0lPQ1RMX0RCRyh4ZSwg
b2JqICYmDQo+PiAtCQkJCSBvcCA9PSBEUk1fWEVfVk1fQklORF9PUF9VTk1BUCkpIHsNCj4+ICsJ
CQkJIG9wID09IERSTV9YRV9WTV9CSU5EX09QX1VOTUFQKSB8fA0KPj4gKwkJICAgIFhFX0lPQ1RM
X0RCRyh4ZSwgKGZsYWdzICYgRFJNX1hFX1ZNX0JJTkRfRkxBR19NQURWSVNFX0FVVE9SRVNFVCkg
JiYNCj4+ICsJCQkJICghaXNfY3B1X2FkZHJfbWlycm9yIHx8IG9wICE9IERSTV9YRV9WTV9CSU5E
X09QX01BUCkpKSB7DQo+PiAgCQkJZXJyID0gLUVJTlZBTDsNCj4+ICAJCQlnb3RvIGZyZWVfYmlu
ZF9vcHM7DQo+PiAgCQl9DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Zt
X3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm1fdHlwZXMuaA0KPj4gaW5kZXggYTNi
NDIyYjI3YWU4Li5kNmUyYTBmZGQ0YjMgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfdm1fdHlwZXMuaA0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX3R5cGVz
LmgNCj4+IEBAIC00Niw2ICs0Niw3IEBAIHN0cnVjdCB4ZV92bV9wZ3RhYmxlX3VwZGF0ZV9vcDsN
Cj4+ICAjZGVmaW5lIFhFX1ZNQV9QVEVfQ09NUEFDVAkoRFJNX0dQVVZBX1VTRVJCSVRTIDw8IDcp
DQo+PiAgI2RlZmluZSBYRV9WTUFfRFVNUEFCTEUJCShEUk1fR1BVVkFfVVNFUkJJVFMgPDwgOCkN
Cj4+ICAjZGVmaW5lIFhFX1ZNQV9TWVNURU1fQUxMT0NBVE9SCShEUk1fR1BVVkFfVVNFUkJJVFMg
PDwgOSkNCj4+ICsjZGVmaW5lIFhFX1ZNQV9NQURWX0FVVE9SRVNFVAkoRFJNX0dQVVZBX1VTRVJC
SVRTIDw8IDEwKQ0KPj4gIA0KPj4gIC8qKg0KPj4gICAqIHN0cnVjdCB4ZV92bWFfbWVtX2F0dHIg
LSBtZW1vcnkgYXR0cmlidXRlcyBhc3NvY2lhdGVkIHdpdGggdm1hIGRpZmYgLS1naXQgYS9pbmNs
dWRlL3VhcGkvZHJtL3hlX2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCBpbmRleCA0
MGZmMTlmNTJhOGQuLjUxNzQ4OWE3ZWM2MCAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvdWFwaS9k
cm0veGVfZHJtLmgNCj4+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4+IEBAIC0x
MDEzLDYgKzEwMTMsMjAgQEAgc3RydWN0IGRybV94ZV92bV9kZXN0cm95IHsNCj4+ICAgKiAgICB2
YWxpZCBvbiBWTXMgd2l0aCBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfRkFVTFRfTU9ERSBzZXQuIFRo
ZSBDUFUgYWRkcmVzcw0KPj4gICAqICAgIG1pcnJvciBmbGFnIGFyZSBvbmx5IHZhbGlkIGZvciBE
Uk1fWEVfVk1fQklORF9PUF9NQVAgb3BlcmF0aW9ucywgdGhlIEJPDQo+PiAgICogICAgaGFuZGxl
IE1CWiwgYW5kIHRoZSBCTyBvZmZzZXQgTUJaLg0KPj4gKyAqICAtICVEUk1fWEVfVk1fQklORF9G
TEFHX01BRFZJU0VfQVVUT1JFU0VUIC0gQ2FuIGJlIHVzZWQgaW4gY29tYmluYXRpb24gd2l0aA0K
Pj4gKyAqICAgICVEUk1fWEVfVk1fQklORF9GTEFHX0NQVV9BRERSX01JUlJPUiB0byByZXNldCBt
YWR2aXNlcyB3aGVuIHRoZSB1bmRlcmx5aW5nDQo+PiArICogICAgQ1BVIGFkZHJlc3Mgc3BhY2Ug
cmFuZ2UgaXMgdW5tYXBwZWQgKHR5cGljYWxseSB3aXRoIG11bm1hcCgyKSBvciBicmsoMikpLg0K
Pj4gKyAqICAgIFRoZSBtYWR2aXNlIHZhbHVlcyBzZXQgd2l0aCAmRFJNX0lPQ1RMX1hFX01BRFZJ
U0UgYXJlIHJlc2V0IHRvIHRoZSB2YWx1ZXMNCj4+ICsgKiAgICB0aGF0IHdlcmUgcHJlc2VudCBp
bW1lZGlhdGVseSBhZnRlciB0aGUgJkRSTV9JT0NUTF9YRV9WTV9CSU5ELg0KPj4gKyAqICAgIFRo
ZSByZXNldCBHUFUgdmlydHVhbCBhZGRyZXNzIHJhbmdlIGlzIHRoZSBpbnRlcnNlY3Rpb24gb2Yg
dGhlIHJhbmdlIGJvdW5kDQo+PiArICogICAgdXNpbmcgJkRSTV9JT0NUTF9YRV9WTV9CSU5EIGFu
ZCB0aGUgdmlydHVhbCBDUFUgYWRkcmVzcyBzcGFjZSByYW5nZQ0KPj4gKyAqICAgIHVubWFwcGVk
Lg0KPj4gKyAqICAgIFRoaXMgZnVuY3Rpb25hbGl0eSBpcyBwcmVzZW50IHRvIG1pbWljIHRoZSBi
ZWhhdmlvdXIgb2YgQ1BVIGFkZHJlc3Mgc3BhY2UNCj4+ICsgKiAgICBtYWR2aXNlcyBzZXQgdXNp
bmcgbWFkdmlzZSgyKSwgd2hpY2ggYXJlIHR5cGljYWxseSByZXNldCBvbiB1bm1hcC4NCj4+ICsg
KiAgICBOb3RlOiBmcmVlKDMpIG1heSBvciBtYXkgbm90IGNhbGwgbXVubWFwKDIpIGFuZC9vciBi
cmsoMiksIGFuZCBtYXkgdGh1cw0KPj4gKyAqICAgIG5vdCBpbnZva2UgYXV0b3Jlc2V0LiBOZWl0
aGVyIHdpbGwgc3RhY2sgdmFyaWFibGVzIGdvaW5nIG91dCBvZiBzY29wZS4NCj4+ICsgKiAgICBU
aGVyZWZvcmUgaXQncyByZWNvbW1lbmRlZCB0byBhbHdheXMgZXhwbGljaXRseSByZXNldCB0aGUg
bWFkdmlzZXMgd2hlbg0KPj4gKyAqICAgIGZyZWVpbmcgdGhlIG1lbW9yeSBiYWNraW5nIGEgcmVn
aW9uIHVzZWQgaW4gYSAmRFJNX0lPQ1RMX1hFX01BRFZJU0UgY2FsbC4NCj4+ICAgKg0KPj4gICAq
IFRoZSBAcHJlZmV0Y2hfbWVtX3JlZ2lvbl9pbnN0YW5jZSBmb3IgJURSTV9YRV9WTV9CSU5EX09Q
X1BSRUZFVENIIGNhbiBhbHNvIGJlOg0KPj4gICAqICAtICVEUk1fWEVfQ09OU1VMVF9NRU1fQURW
SVNFX1BSRUZfTE9DLCB3aGljaCBlbnN1cmVzIHByZWZldGNoaW5nIG9jY3VycyBpbiBAQCAtMTEx
OSw2ICsxMTMzLDcgQEAgc3RydWN0IGRybV94ZV92bV9iaW5kX29wIHsNCj4+ICAjZGVmaW5lIERS
TV9YRV9WTV9CSU5EX0ZMQUdfRFVNUEFCTEUJKDEgPDwgMykNCj4+ICAjZGVmaW5lIERSTV9YRV9W
TV9CSU5EX0ZMQUdfQ0hFQ0tfUFhQCSgxIDw8IDQpDQo+PiAgI2RlZmluZSBEUk1fWEVfVk1fQklO
RF9GTEFHX0NQVV9BRERSX01JUlJPUgkoMSA8PCA1KQ0KPj4gKyNkZWZpbmUgRFJNX1hFX1ZNX0JJ
TkRfRkxBR19NQURWSVNFX0FVVE9SRVNFVAkoMSA8PCA2KQ0KPj4gIAkvKiogQGZsYWdzOiBCaW5k
IGZsYWdzICovDQo+PiAgCV9fdTMyIGZsYWdzOw0KPj4gIA0KPj4gLS0NCj4+IDIuNTEuMA0KPj4g
DQo+PiANCg0KQWNrZWQtYnk6IE1pY2hhbCBNcm96ZWsgPG1pY2hhbC5tcm96ZWtAaW50ZWwuY29t
Pg0K
