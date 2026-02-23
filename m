Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1CDEEC28E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 21:53:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800A610E317;
	Mon, 23 Feb 2026 21:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hsw85+Cx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD0A10E317
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 21:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771883616; x=1803419616;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BVe0trP0lDZSI2OejgTI27+aMp2A0gb0KhRpx92vEoY=;
 b=hsw85+Cxtyfe7CSVUr6pfy5okxygnPlr9c73KDerbzavvQbaX1KOsyaD
 6hy1Bm0dfvVRPWcVqrNSpA83ZrNPgppFdQAaGB+iu8ekqCK9kNZnFNVyW
 7TovWw/l+uhtBl4ZOdYdTSKnHHSiTfs+f7SIxc3jrz083JinTwU+t5Z/8
 iEXhs3wKhTpPKknXexaAflSLTHRJYT5mqtojJNhzcYIZoS6TrMbxUV6i+
 /XjuBoknwrJQ1qMMxeQAt9W0LSo/Fd3aOi7xenK51gWvaq2A8odbI/D+1
 6d6kb48GIGVgvoZZ7TCjg+A6ZP2X23pY5FSrddKF6eSk0CsHN1vMGRJqg w==;
X-CSE-ConnectionGUID: CGyEH++QRPCtq9rEGInXhQ==
X-CSE-MsgGUID: +pFEK3XYTyCua4ZKbzn9ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72929825"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72929825"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:53:35 -0800
X-CSE-ConnectionGUID: x/4+Edx1QSC/BClJK0Z3sQ==
X-CSE-MsgGUID: Do9tgT4bSGSE/BIdUpcokQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="253415387"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:53:35 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:53:35 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 13:53:35 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:53:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ma9S5dndtt0hQAWp3NYmvRQcWLwu5K6nR6md0N6I/frWGPQvgqLxb3lGB+Wch+i65oZ252fYMWMwVAbzcdnp3IOeorbmn4eG0hyQwHfxXkwYA9v/bHaJWEdpEGZRKuXfZgw8BK4/kCex532rKt7uGqR71YJ787CQyVoRZqvBt11b6zM0aHJtBiZXxUPKSpxdFxUn3qn/TUCcMA2N84bvLjj5ipVKUttVNoWpQFmWOFTmpgINLNW+wK0vZR+MyN1LaMIja245QjyRuRn0AyGnv0kQNX1NNl0sqmEddnpYY6gKoUiAkbk66bkvNVtskWIoeu3ayCuyRWfZexztEn2IgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVe0trP0lDZSI2OejgTI27+aMp2A0gb0KhRpx92vEoY=;
 b=EaRfqRcfGwvNx/7jD2b/we7WzrTKlSFo5yhu2JBvkpynk/yKM11uSke5h8vpW8W7pJ/bpnro1UR86v6mZV3A1FXUUcWFLfo8D6BfMmWyfR8yH1sktex1chukHorYsCR+H1bPZgwArcOsGOj7Q8mnSpqIlyiEE7apgapCcMwypL06uVmgJYGOlRyEgyMO+RhfQ7WVxta1NhrBQTnz1PcIK4sqn3vueUYnuGM1ZUhsUFZQ5iTesazgO60YLdYtu/jORH5bcL8uYag00gMO0xdUxsL4L/MQvSig5bw/E1u0o1awaeTriut9VXqoNjw0TJkPz/J5NKeW0Nf4fjejnbpqzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SJ0PR11MB6672.namprd11.prod.outlook.com (2603:10b6:a03:44c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 21:53:32 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 21:53:32 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2 14/23] drm/xe: Consolidate workaround entries for
 Wa_13012615864
Thread-Topic: [PATCH v2 14/23] drm/xe: Consolidate workaround entries for
 Wa_13012615864
Thread-Index: AQHcoo5hyWeKRu9jFk6Te86HKfo6FLWQ18ZQ
Date: Mon, 23 Feb 2026 21:53:31 +0000
Message-ID: <DM4PR11MB545622195867634A6C621D75EA77A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-14-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-14-b12005a05af6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SJ0PR11MB6672:EE_
x-ms-office365-filtering-correlation-id: 8e2a84ef-fff2-464d-9bda-08de7325fc80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Zjl3US9FVTcydGdXbEhCa2xaQVUvVEFRWmcrVVRGeFcyOTJjWXUwK2MvLzBi?=
 =?utf-8?B?Nzh0Q2pQaUpqNGFEZjJqMDI5SVpYWjdvcG1tTUhRaGJpVldoVFd5RzNDbHcy?=
 =?utf-8?B?bHM1SE5tK3p4TlpPS0pEenhUN05idGJrc3l5dG56SnMzVk91Qkt0bFJISnR1?=
 =?utf-8?B?ZGVSaVZtVzRPSWYwK0ZxbVVvVFMvZkZEa0hOWi9SV05SdlU3SFYyU1VhLzZu?=
 =?utf-8?B?Yno2Tzk1SmxRYzd0NndvYytTU2xzdjYraFkzYTVmOVU0eFhla0xmWU44WFJJ?=
 =?utf-8?B?VjZYSVVpNTg2dzZMaVpiQVVGMFRHVzl3S1pBdzB6R1BRSDhYWno5aHdTTkh5?=
 =?utf-8?B?RUh2aVV3RHVBRGloRVUzcVV6MG9ZRDlYYnYwblJUWUZVTCsvOXd5Z3FOeWk2?=
 =?utf-8?B?K1l3Tzkzc1R3L3JNMXBXKzRHZFJIS29VakU0ODRzUHJQRHZMdWJNZlRRVktB?=
 =?utf-8?B?alEydnloVXRDc05iWi9KVjAzeks2K0p3L2NCdk9TaWFyR0JUYTl2dEdmZzBF?=
 =?utf-8?B?Q3FRY0srYXRkQ1hXZ1YyNm94a0RaU2dweEg5TnI0L2NSZlJ4cVpoV25MbjBN?=
 =?utf-8?B?ZlpHVDVSNU1EYXRCSW1pRDZkeXJwWk5hS1FFUUdEakJrTUNMWDdybFFoc2JV?=
 =?utf-8?B?NUE0bU1qbG1NN04xQlA4NVl6M2JiTnc2Rjg0YndDQ25vdmdJRTJyYk1Sa3oy?=
 =?utf-8?B?UTR3U2dlakZwV3FmY0lnZ25lTHdKejRaWGx5czRnQVFLN1J2OGV6TXNnVGI4?=
 =?utf-8?B?VmYvVzEwOTQyQzljRXJCWDNHS1FrOFVoR253bTJhNmZPM0ttcUpwRU5DNGF0?=
 =?utf-8?B?ZmFubzJRYVVnVWJjYVd0ZEJsQVpnaEp6cTY1Zy9XZVVVVmgzT0V6ZDV6dUs1?=
 =?utf-8?B?LzJpVXB6NjJOcE4wb1kyMHRGUkVzYzVZa2hZRXo2eHVJUGpOUjF3SzBSNDJy?=
 =?utf-8?B?RVArN1YzNm9ONGFPVkp0MmVuQnZwZm1VRStlbUNXcmEzVmdaUHBDMERMOUpG?=
 =?utf-8?B?Yk1LY2tQSHFvVnlqclpHcDgxc3l6NlpRZFlXQU9VMkFhMEZLSlVJNEtQS3ls?=
 =?utf-8?B?bzBBbzJDa2RuUnhhSnZWWEwwQnJCTUM3UUtIRWtPZWRaVUdoOUJNVGs4VjBa?=
 =?utf-8?B?TTZEWGo5VE12UUZnQXA2YzlEc3cyVlRJbk1BbERVRWdscXA3a1lXQ3BibVdB?=
 =?utf-8?B?R01yOENiRVA4MUp3ck9EaXVpWXFuY3Q0VnFCL0RoRGFDZThSYlNKS0g5WTJO?=
 =?utf-8?B?dHVtbDlORVRqMzh3TkNseDBubFRlQkJ1VUpZeFZ2MlIwSTViaGE0TUp3c3d2?=
 =?utf-8?B?Sis2N2V0UEpKTTFOS2NZY1o1UGZYd2xObVpBTzZzR1JRUVNsUys2RHkzZ0Np?=
 =?utf-8?B?L0s2YmlldmdqL1lweWVsbUllaWV0R2dzaHZMSVZ4bFhmOEU2ZnZLYTEycC8r?=
 =?utf-8?B?Uk5sSkkzNkJZendKVXJqb1VNQkw3dGw2cHRvYXh5NnVnbTFQS3lRRWtkRlRh?=
 =?utf-8?B?Vm1hcGZjTlAySWoyazVVMjJTc0lPSWVrWWU2dWlkVzQvQzltRFh0NDUxUE1z?=
 =?utf-8?B?SHlZZUNRNUU4TTFkK1Y4NFJJd2FwL0ZxbXFMTjN0Mk10VVVPQ3NkNXNlNzFz?=
 =?utf-8?B?amhIbWhJcFVDVGxKeTlmb0E3bkZySitPeXY3TEx1Slk4K2VlckFhSnVGVzBE?=
 =?utf-8?B?aWlZeTlSeWdLbkFuS1Avc2xIUk5pMjl6a2dZOFVJWVMzR2hJN1RGNjRNNmpS?=
 =?utf-8?B?cGFKRjhpWHUxNmZrR1h1VTdUSmFFSjRJeEtCOUphZWc2QnFPTkhwZWd5Nmxj?=
 =?utf-8?B?WElJa2FmYTNNaDBSWmxxMzBaQVlEQWp3WHhxTDZzK0JpaG5DdTkwYlJxRXF4?=
 =?utf-8?B?Nnh1aSthNUwzSHB6UTd0OFdaY1dWcjNnSXNmUmIrbFV2a3oyd1IyUzlkQkRS?=
 =?utf-8?B?USs1ZVRPakdtdHVFU0p6ZC9HdUd1KzcwekorWmg3SU01TEROS2dZV1VTUUhF?=
 =?utf-8?B?Y1drdlJkOW9CR2xaak14V1U3bC94eUVxWndldlljY04zTVMxOWI2cDUyWm9V?=
 =?utf-8?B?WWQ2c2pzVmtUUjF6aktVLzhVdVJabndSQmV4ZHAyTC9aYkpWbDNnSGVMckJt?=
 =?utf-8?B?algyUzlHd01RV0tUM3NpdkdjSTc4alQyN2JEQ0JpZXFQVzJjQVZuVUdLSGRG?=
 =?utf-8?Q?iM2kOAJ/28cnp+8V1ejR8bc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUtXL0pxZnoxUVEzWjdRTVlmN1g1cjRzZlk4eC9NSnRORlhnd1JMK3pmUk5O?=
 =?utf-8?B?N2VIUEtoZjkxWThtNkR6MVh4TnR2dlZidko3NE1ZOGpOOVE5SXMrSUhxNDNQ?=
 =?utf-8?B?NGVxKzY3RVd2eFNuU05BT3VXVVVZakNQMjBZcEFhRlJ1L3MwNjE3V3lVYzJq?=
 =?utf-8?B?SFY5TDhYOUJGOUtBb0hYQ2lIY1QweG9HamlCZ2p0UWh4cG41QkFPUE8zYXJY?=
 =?utf-8?B?eGF6OHNSbFRPWFpzTmZkK3FMeXNLZVRVMmJuR3VtUHVaK2lyZjgwTFlMcEdo?=
 =?utf-8?B?RnZKT2hCRmozRENzbmxXNHlremp0QmpFMlNkRVcxSDl4TzIzbTFXTEVxVk8r?=
 =?utf-8?B?UjlrSGZtTFhNKzlFSEFUeXM3TlFjMmYwRXZlWDFMd25iNk9lQWYvby9Lakg4?=
 =?utf-8?B?SGNmQmZIS3hPMENSNy9ZWS9VeW9JbjJjRi82bDYrOGdaQmluS2RtMWV1OHA1?=
 =?utf-8?B?MnBWUCtxZnhnSGdQRWV0RXZmZ2l4cElvTm5rSnJFa0tNYzZJemdkL1hwdmJ2?=
 =?utf-8?B?SVNyVVFQSklySEMvak1xdUcwRklHUk95MnljZlBRUmdhRnJha0h4UTNIYTdH?=
 =?utf-8?B?bWlKclpTWDh3L0hxeW81bFZSZ1lpMGpNdkttWEdwenBxa1dNK21haVlKd3ZZ?=
 =?utf-8?B?cXBtTUpid1BBbnpWeER6dXNNQndoTHkrWWRyS2xNQXVXamxYSXpXRU1sbE1x?=
 =?utf-8?B?bndrL0lzZlhXb2hJb1dVZWpYd2xwWFJTbzlUTTBGZ01lNGVQREQxbTdMRlp1?=
 =?utf-8?B?b2ZVSDNMQ0pHTDY2ZlRINWlHM3FsMG1jWGtLZndlQ2kzcFN6SnR6b1JkbzJa?=
 =?utf-8?B?RHJiT3JiM1RJbTduVUhFS3c2b3pGQ29jVzdLZnF0a04yUGdJNU5CY0RYVmZ0?=
 =?utf-8?B?Q09RVU85ZzcxUkpVenl1QVJpMmozSEpyQVV6VDJFUmJ4dE5ZM3hyVjZGcFJO?=
 =?utf-8?B?WkdFR0dvU21pK3phYTJwOTlLYm5XeGppUVlxVEl4a3RLOXk3RVR5S1BOcmFy?=
 =?utf-8?B?S2piTC82M09kczU0TjA4cXdJL3RqVFFGdXc3QVc0WVFUaTMvQWc3ZHRCck4w?=
 =?utf-8?B?SzlwdmVPelExRldqekVEVGg1NnlQckhmRjY2T0dvcjdvTGdUTGM4M2xYKzFZ?=
 =?utf-8?B?VXdUb3laZm1QeWE1YzAzOTVnMEhJOVRKQ0U4NEl3QUFlU1VZb3d2Yjh1cUtx?=
 =?utf-8?B?K05SNlJYaWh4Ykc3bXAvbDd3OWw5TU8zQkdFL0ZjUG9yclYxT0h5bzk3MHd6?=
 =?utf-8?B?VVF0SDR6ZTEyOXhueTJUQWYxR01hdnJDdjE1cFZXYXlWN3NuM08rdnNMZ1hB?=
 =?utf-8?B?Y0p1TnFKZlREYjQ3R2RDdlB1VzJqM3Y2WU1BWmQ1Y1RSR1VhaUg5RWY4NjBI?=
 =?utf-8?B?OHZzRDlCVVNxQXhJVUIza0tHaEk3MUJURHJTMlpiVG02OFBPZzdHRDE1NzRT?=
 =?utf-8?B?TFRIZzU0Z2wvaHpjMXlIdHYrdTFkc1lFUUVhcGQvUU9oU1krMFJhck0zSWYr?=
 =?utf-8?B?MVpFY3VDdW55N0ZkVkJIM0RoVzNXaTYvbTU2WVowazZTNjdSVjl3SlYrQjB6?=
 =?utf-8?B?bjE0VXBLU1BOTG95aFBDSEJGc05BSFBHaTMxanBaM09TTndLRDc0MHdpandS?=
 =?utf-8?B?RGFlQnArbEllbUpQOENyRUV3K0NSMDhBRGo1WVRNV0U0VVQrbTZZZ1Zxc1Np?=
 =?utf-8?B?OGxkS25SNkpoeFBjTmtPN3JPc3FtR0VKS2swMzN4bmtCUFAra3R6QU9LTlg1?=
 =?utf-8?B?V09ZZ1BHVExld0lLcERFUGduMk01WHA5MTNFQ0htYVAzcDJGYmMyNWZ4dHU0?=
 =?utf-8?B?eWM4SUFucmRXdFlRL25pUzVYRWNjTE44ZnNXSHMzUFRBYnJIVjNnWHJrajhK?=
 =?utf-8?B?UnhhVDlWZDVGRGxUbjhFYUtwOFlLSC9uVEtHOFUxVVhrMzA1QW54N243TE9J?=
 =?utf-8?B?R2l2Tk5HN3FyczR2RXc3S25CQ1ZHYk9xYWVyUCsxZis3VE9BUjBqWitCYUlL?=
 =?utf-8?B?RVFKVzQrTkpnOXhUVFNDNjQwUVdHZ3VtVWNhS1MzYUtyZmJrMFNJSGVWN2VC?=
 =?utf-8?B?K056Y1ZVTCt1eGZtbG11U0pyYWxUY3JLM0dFKzB0QUhTQUxCYnp6d2xiY2xG?=
 =?utf-8?B?Vzh3cC9IOEZqRmlNUDdrUGdqVzd3NSsxTHdqYVVkRHlFVTM0U0VkeUoyQmg3?=
 =?utf-8?B?d09TcnFLMDZIVFRMc0xZekpHOTNnL3JMeFRMVEZHdWc4K2ozSmduOEhHeXlk?=
 =?utf-8?B?TjhNYjEyV3lrYlFmdzR5UktyN29lSXZqbndaTTJ2dzNVcUNBOERJZHhDcDFj?=
 =?utf-8?B?MEhwNUpRZGkyUEFzbzJ2OHJZOHRHLzhJT010MmRmcDkwdjRia3dJZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2a84ef-fff2-464d-9bda-08de7325fc80
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 21:53:31.9826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D66OgBvA2nFeMCwxWTQ95SHj42XGrKIUf3T8kVogJuiN5PYvRI/1QsdqbaXFGQZuztgkLTyrkmm74ibACfZuqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6672
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

T24gRnJpLCBGZWIgMjAsIDIwMjYgOToyOCBBTSBNYXR0IFJvcGVyIHdyb3RlOg0KPiBXYV8xMzAx
MjYxNTg2NCBhcHBsaWVzIHRvIGFsbCBncmFwaGljcyB2ZXJzaW9ucyBmcm9tIDIwLjAxIHRocm91
Z2ggMzAuMDUNCj4gKGluY2x1c2l2ZSkuICBDb25zb2xpZGF0ZSB0aGUgUlRQIGVudHJpZXMgaW50
byBhIHNpbmdsZSByYW5nZS1iYXNlZCBlbnRyeS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHQg
Um9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQoNCkxHVE0uDQpSZXZpZXdlZC1ieTog
U2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+DQoNCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfd2EuYyB8IDIxICsrKysrLS0tLS0tLS0tLS0tLS0tLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfd2EuYyBpbmRleA0KPiA1ZDcxY2I5ZGNhNTEzODAzMjc0ZWMxZDViNzY2YzJjYmIwYzMxOTg3
Li4xOTBiMzFhOWQ0OWQzM2U3ZmI4MA0KPiAxNzRiZTdiYTljYmY3MjZhODIyNCAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3dhLmMNCj4gQEAgLTM4MCw2ICszODAsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4
ZV9ydHBfZW50cnlfc3IgZW5naW5lX3dhc1tdID0gew0KPiAgCSAgWEVfUlRQX1JVTEVTKEdSQVBI
SUNTX1ZFUlNJT05fUkFOR0UoMjAwMSwgMzAwNSksDQo+IEVOR0lORV9DTEFTUyhSRU5ERVIpKSwN
Cj4gIAkgIFhFX1JUUF9BQ1RJT05TKFNFVChIQUxGX1NMSUNFX0NISUNLRU43LA0KPiBDTEVBUl9P
UFRJTUlaQVRJT05fRElTQUJMRSkpDQo+ICAJfSwNCj4gKwl7IFhFX1JUUF9OQU1FKCIxMzAxMjYx
NTg2NCIpLA0KPiArCSAgWEVfUlRQX1JVTEVTKEdSQVBISUNTX1ZFUlNJT05fUkFOR0UoMjAwMSwg
MzAwNSksDQo+ICsJCSAgICAgICBGVU5DKHhlX3J0cF9tYXRjaF9maXJzdF9yZW5kZXJfb3JfY29t
cHV0ZSkpLA0KPiArCSAgWEVfUlRQX0FDVElPTlMoU0VUKFRETF9UU0xfQ0hJQ0tFTiwgUkVTX0NI
S19TUFJfRElTKSkNCj4gKwl9LA0KPiANCj4gIAkvKiBUR0wgKi8NCj4gDQo+IEBAIC01MjYsMTEg
KzUzMSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGVfcnRwX2VudHJ5X3NyIGVuZ2luZV93YXNb
XSA9IHsNCj4gIAkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19WRVJTSU9OKDIwMDQpLA0KPiBGVU5D
KHhlX3J0cF9tYXRjaF9maXJzdF9yZW5kZXJfb3JfY29tcHV0ZSkpLA0KPiAgCSAgWEVfUlRQX0FD
VElPTlMoU0VUKFRETF9UU0xfQ0hJQ0tFTiwgU0xNX1dNVFBfUkVTVE9SRSkpDQo+ICAJfSwNCj4g
LQl7IFhFX1JUUF9OQU1FKCIxMzAxMjYxNTg2NCIpLA0KPiAtCSAgWEVfUlRQX1JVTEVTKEdSQVBI
SUNTX1ZFUlNJT04oMjAwNCksDQo+IC0JCSAgICAgICBGVU5DKHhlX3J0cF9tYXRjaF9maXJzdF9y
ZW5kZXJfb3JfY29tcHV0ZSkpLA0KPiAtCSAgWEVfUlRQX0FDVElPTlMoU0VUKFRETF9UU0xfQ0hJ
Q0tFTiwgUkVTX0NIS19TUFJfRElTKSkNCj4gLQl9LA0KPiAgCXsgWEVfUlRQX05BTUUoIjE4MDQx
MzQ0MjIyIiksDQo+ICAJICBYRV9SVFBfUlVMRVMoR1JBUEhJQ1NfVkVSU0lPTigyMDA0KSwNCj4g
IAkJICAgICAgIEZVTkMoeGVfcnRwX21hdGNoX2ZpcnN0X3JlbmRlcl9vcl9jb21wdXRlKSwNCj4g
QEAgLTU1NSwxMSArNTU1LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9ydHBfZW50cnlfc3Ig
ZW5naW5lX3dhc1tdID0gew0KPiAgCQkgICAgICAgRlVOQyh4ZV9ydHBfbWF0Y2hfZmlyc3RfcmVu
ZGVyX29yX2NvbXB1dGUpKSwNCj4gIAkgIFhFX1JUUF9BQ1RJT05TKFNFVChURExfVFNMX0NISUNL
RU4sIFNUS19JRF9SRVNUUklDVCkpDQo+ICAJfSwNCj4gLQl7IFhFX1JUUF9OQU1FKCIxMzAxMjYx
NTg2NCIpLA0KPiAtCSAgWEVfUlRQX1JVTEVTKEdSQVBISUNTX1ZFUlNJT05fUkFOR0UoMjAwMSwg
MjAwMiksDQo+IC0JCSAgICAgICBGVU5DKHhlX3J0cF9tYXRjaF9maXJzdF9yZW5kZXJfb3JfY29t
cHV0ZSkpLA0KPiAtCSAgWEVfUlRQX0FDVElPTlMoU0VUKFRETF9UU0xfQ0hJQ0tFTiwgUkVTX0NI
S19TUFJfRElTKSkNCj4gLQl9LA0KPiAgCXsgWEVfUlRQX05BTUUoIjE4MDQxMzQ0MjIyIiksDQo+
ICAJICBYRV9SVFBfUlVMRVMoR1JBUEhJQ1NfVkVSU0lPTl9SQU5HRSgyMDAxLCAyMDAyKSwNCj4g
IAkJICAgICAgIEZVTkMoeGVfcnRwX21hdGNoX2ZpcnN0X3JlbmRlcl9vcl9jb21wdXRlKSwNCj4g
QEAgLTU4NywxMiArNTgyLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9ydHBfZW50cnlfc3Ig
ZW5naW5lX3dhc1tdID0gew0KPiAgCQkgICAgICAgRlVOQyh4ZV9ydHBfbWF0Y2hfZmlyc3RfcmVu
ZGVyX29yX2NvbXB1dGUpKSwNCj4gIAkgIFhFX1JUUF9BQ1RJT05TKFNFVChURExfQ0hJQ0tFTiwN
Cj4gUUlEX1dBSVRfRk9SX1RIUkVBRF9OT1RfUlVOX0RJU0FCTEUpKQ0KPiAgCX0sDQo+IC0JeyBY
RV9SVFBfTkFNRSgiMTMwMTI2MTU4NjQiKSwNCj4gLQkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19W
RVJTSU9OX1JBTkdFKDMwMDAsIDMwMDEpLCBPUiwNCj4gLQkJICAgICAgIEdSQVBISUNTX1ZFUlNJ
T05fUkFOR0UoMzAwMywgMzAwNSksDQo+IC0JCSAgICAgICBGVU5DKHhlX3J0cF9tYXRjaF9maXJz
dF9yZW5kZXJfb3JfY29tcHV0ZSkpLA0KPiAtCSAgWEVfUlRQX0FDVElPTlMoU0VUKFRETF9UU0xf
Q0hJQ0tFTiwgUkVTX0NIS19TUFJfRElTKSkNCj4gLQl9LA0KPiAgCXsgWEVfUlRQX05BTUUoIjE2
MDIzMTA1MjMyIiksDQo+ICAJICBYRV9SVFBfUlVMRVMoTUVESUFfVkVSU0lPTl9SQU5HRSgxMzAx
LCAzMDAwKSwgT1IsDQo+ICAJCSAgICAgICBHUkFQSElDU19WRVJTSU9OX1JBTkdFKDIwMDEsIDMw
MDEpKSwNCj4gDQo+IC0tDQo+IDIuNTMuMA0KDQo=
