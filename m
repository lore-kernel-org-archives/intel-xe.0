Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18389C87FCF
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 18:53:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75D810E13E;
	Thu,  7 Aug 2025 18:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0+irX7z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE0D10E13E
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 18:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754592827; x=1786128827;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NLISqAO8IIOt/5EODjsqEOoCjQbsDQ2D/SFlOeHLMa4=;
 b=n0+irX7z8hpcCOpfnwXwFkgMY4ZDVL1JHEqlWxlsuym42NOIovUaaGM/
 wraiEnStKo9qucOQIc7HI81R/Ot0BYpwihU2evxMigux6EZPkKu1I+xte
 l9RMgcYSfDrIUXFK1UZ1F8bki+edGRgvOPkAeORAMX3+zpZa1k+4AZdKO
 /oFLFrPrQhMZlXkgzZsWU744FFl6WD8Ti0m1iR1lMiILt1mJEEVw5vzlb
 ZClhZ0DzxB9HkOIzJ9ibo1zZA+rS1v/cZWaSoiXc/taqplXiLUGTJbc2L
 MGpFe4LhfFx52Pq5mVOUF6JCMXh4Tc7o98M+qp7sxUu9CSsNy3AR39jUL w==;
X-CSE-ConnectionGUID: Y6pS5hK6SmyaRdBhRqdWfQ==
X-CSE-MsgGUID: 9C71Ly4sRiWATSud/ynn3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67207548"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="67207548"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 11:53:46 -0700
X-CSE-ConnectionGUID: UKbjT10vSJCbO/q0BCp73w==
X-CSE-MsgGUID: ftDIc+32RmSMB+JN9CleSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="169347050"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 11:53:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 11:53:45 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 11:53:45 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.62)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 11:53:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggGKFDEUgkF/YtujxNgh1DMtCFUpf//xfH81lyD0y5t7otoZ/BB7T9C3gKy4uzhQYrnAPQeWCO/MZAwBbvzYw2qmUY+dvIEMpzzgO3iFidMIFVzEKrwM6BJAM1HudTzDVv9nQ5dKLIcUxQqHfZo0wpiCCwF+4TghLisBnxz6viE4RKDJu98nsOTLJd8UGBOXDKboW7WI1DhUbnxeUi/8LpQ4+jDSEkKdOckYzDrtdH+09bmepZ016wxaXNr4kCKj3jhgOl00KDknkZXZPRj03FWG2Pir2/nhnyBVvpqnQHddZPC1ogPjz3Cup3zMMI5Qux+ffcIiaRxT75MxX85ytQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLISqAO8IIOt/5EODjsqEOoCjQbsDQ2D/SFlOeHLMa4=;
 b=rCB+XX6g1AdJSCNV6E5vPoCZIIZ7cWIbWeNsuTnPhc5sdaaJkMDYk0MwSen6qTK3W3KAWP1Q0n+iY8/UUvKKZdZ3OywFNRowlR/syqeanvxliwAFQHqpqCR7BrS63YsSjtxopvxKhKWk3NBGUEJwyZ1pC0fc0I1sloAD1PAoo44DsqdFHu0D79BucR+VK2Q6c/qZku0Uwz/xGgGgWCsP8f9J5cPnQFITV9unYtvI01QIXqORgMbSRIE/syG+dTXU2TVFgWtxc4GUJmkC1mfUzuEj6N/bo1gtmIPqe+jop3eFRkmtI30QXtk1ikbesvcXx+0di5xR2UUbpVDmDl5E3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA1PR11MB6346.namprd11.prod.outlook.com (2603:10b6:208:38a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Thu, 7 Aug
 2025 18:53:43 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9009.016; Thu, 7 Aug 2025
 18:53:43 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kassabri, Farah" <farah.kassabri@intel.com>
Subject: Re: [PATCH 1/8] drm/xe: Move explicit CT lock in TLB invalidation
 sequence
Thread-Topic: [PATCH 1/8] drm/xe: Move explicit CT lock in TLB invalidation
 sequence
Thread-Index: AQHcByDZyg4p3pt2fkmT43OPgucOt7RXbiGAgAAIeACAABRUgA==
Date: Thu, 7 Aug 2025 18:53:42 +0000
Message-ID: <ef0c58ed59e10916f06b7b5f54bec5bf73c73adb.camel@intel.com>
References: <20250806222404.30333-1-stuart.summers@intel.com>
 <20250806222404.30333-2-stuart.summers@intel.com>
 <eacb4ffdb6b18bf912d6101496c8da156b6c139f.camel@intel.com>
 <aJTlKKvEimK2N48x@lstrano-desk.jf.intel.com>
In-Reply-To: <aJTlKKvEimK2N48x@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA1PR11MB6346:EE_
x-ms-office365-filtering-correlation-id: a0d4cad1-fa90-4fc2-b28e-08ddd5e3bb20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MUROWDZCaEllb2szVXdQZlcyb0dEWGJOYmZtcnVHNFl5d1lXTjYxMGVIamdz?=
 =?utf-8?B?WkpUdWtmb3Q4VWx4NFJUL1Fyc3ZSYVpYSmpmd0JqcHlJelhBRmxKOWNnNkI1?=
 =?utf-8?B?N3VGOGM4anlUQWMvQUdvQlU1b3pFelQvd2dWN09UdHJCVnlPcmplcnlZeTYy?=
 =?utf-8?B?dlV6cUFjSWloSXFEYnA3Yzl2YW96L1ppVTRkVjdjSlVvTHlIN1lPZHZzcTVZ?=
 =?utf-8?B?V204MzhIbDdCM1Z0UmhsR0VuN0xDRHRkZ2FUVUoxcVhlWmx4QiticDZtSk1P?=
 =?utf-8?B?bFdhZzVLcWthTVZjRHIwaG9YTmdraFpLRUU0NmZXZFVyYVRuWHJrRXpxVzFH?=
 =?utf-8?B?UmdzQzVWNWNMRDdrUHhVem9CQmt0QTU2eGM4b1NpRGlOaW0xTDdsN2g1L0ZV?=
 =?utf-8?B?ZTUrdURBWVdNNzR3c2w3M1JKcWlRaThTbnJJVU5zanJ5N1NJRVc0aXhibENS?=
 =?utf-8?B?Rk1PVUFvYk04RWp6RmlISHE3VFlpTForRVpSNXFDRFgvRVo3MUh2Q0hyc0NG?=
 =?utf-8?B?eGFGSTFMVU10V3d1aGRIUHRoZlRTUUhrdE9ndU14cnlTc3g4OXhrNHFFL0xC?=
 =?utf-8?B?MDI3aEFqOHFKNWwyMDFEYzRLbjNETVFVTFBCVVhoaTNtZDlXRWJpMFp3SW5s?=
 =?utf-8?B?ekNuYWY3Ri9EWXplOENFRlY1Zm1SOGhyUHFQZTRSK25WV0laQk56aXBwZFNT?=
 =?utf-8?B?b1BvSVM1NGhnMW1Jbkxoc204NXlla3FLWUtDcVlwWmRwTmwxNGYxaDVNRXJh?=
 =?utf-8?B?SmlIYnhCSDdwcktLTE12eVdQT2hxb29rbDg3andXMENIQW5LRzNQR3hGV3RH?=
 =?utf-8?B?TERPZnd2MTd1ZUZJbGwyL3lMQTVnem5talo0RDVZLytLTHdidXVZd1JxTlE5?=
 =?utf-8?B?NW40bkl1emhGZjhoK1hyQ1FpUWYrZUh4eG8rUXVFWStKK1JvZzJ5bTBSelo3?=
 =?utf-8?B?Zis3ZHRERTVkSlFhUG1lc25DQ2Q4RzYyeEg5QThrZEE4cytDc3p6QWxnaGkz?=
 =?utf-8?B?WkF6S09lQ2RNOUxTenJpTmxHdVJNOW1OVkErS1JoTXQ5Vmx1Y243WnlmU1dw?=
 =?utf-8?B?bmhIL3BwZXFEUm9HYVNxL0wzTVh0VUQ1YVRNSWZiNUpmaWM5MnhybDd2UlRB?=
 =?utf-8?B?Q0RZQUxOcWgxRU1PQWFaNzNUVkVLKzc1bUZxbE5yRjcxMHdmNWhJcFlsd1B6?=
 =?utf-8?B?c0s0Zkp2MWpFd3ErZVE2emJIZDZqNjhPQ0l4Rk56dlc4S09WYzQ2SnM5ZWZR?=
 =?utf-8?B?bDBsb1BGVVh2NjlzV2V6U3QzNHJyWEZXclFpNXNVNFg0N1hoRzk2R29QeHgr?=
 =?utf-8?B?SE4rSm8vVWIzMW1ocWRZd1F4Q2pLM0JJa1dybEtHTkM4Y2h4V3RDazFNQm5K?=
 =?utf-8?B?dGpDSDhZck10U2hUY2pGdGo5ZktSdkttU21ZOGRFTm94VnF5UmgyTnlPS29O?=
 =?utf-8?B?bjFpNGQ2akpweVI1Sk5jYVBiOEc1dkUvZC9nRURCc2xVa2ZwVi9ieWpCdXRT?=
 =?utf-8?B?dXRGSkUzVUxvcHY3eFdZQ3JSS2xVbjVPTzFsVzZMVUNaTmQxTUdOUGdFMUY2?=
 =?utf-8?B?RjRISGJqajBwRXVPTHRycW5NMjBFUzFmdEw2L1ZGbmRlQlZPbHMzMXVpUnYw?=
 =?utf-8?B?TGlsb2VrdmdkaDRNWWpYTXJBeDN2YU9zUjZsME9mMFhBMDFWaWFvVHNIL2Ur?=
 =?utf-8?B?K1g4UUZTbm54Q0llL0FISW1lRHc2aFlmQU1RUm1QZFVtNE8ySVlvWGJ5SHFC?=
 =?utf-8?B?TmdHZVk1VTFnazZqYzNHY1pxUTl0azBFMUhORHhvaTR4QTVzaDBNL0I3a0hZ?=
 =?utf-8?B?RHFrK1pTZVQ5QlIxZ0hVc0ticktMdWtGOTg0Q3A3czZ3L2hWbEd4aXhDMVJh?=
 =?utf-8?B?aW5HRUl1TC9iZmRnelJKMHJyc3dxVGRMRkR1Z3BrTDlORFphUHlNNHd1MWt2?=
 =?utf-8?B?cHBZUVRzdmdTckV0STRJNUlKWW9aRUZoVkdFMHQrcWp5cVVvZjJTNDNtTEFM?=
 =?utf-8?Q?dy7ii7YfjRMZ6355zjP2NNmLkbD+i4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXhOVkNaUkRib2pRZlZISnBOK0xkcExmcVZCQXVhLytUQTJWMGdMcXEvYXN1?=
 =?utf-8?B?YXRmcUpCVm00dkJ0djBCRzBvem8wRFpyeUNPWWZ3NDlma0FkWTgrYzJOeG9l?=
 =?utf-8?B?VG00U2xOMFh1NjhqQnVQM3doQUp6SExiQllFdW9Oem1oNkJxRHYyVTRCQ0Zz?=
 =?utf-8?B?L1htZ3RxZUpZSUJTNlhZbzdMSlJrL2ZQVE9KK0Zyb0NVeVdRVGtwOHhReVc2?=
 =?utf-8?B?eEduZDhySGJmaUtqT1kyN0VSNDAxcVdNN041T2hNcHdCQ0NXaTIvNGlEMGNv?=
 =?utf-8?B?NGE4L2dWRlR0VXZPbW5STDJGV1gzUlJRWVoxKzNKNTg2bDIxYTNnamJQdUZn?=
 =?utf-8?B?RHVxaFlBWmxYZ0pnU3NlWE5pWEFVaDVQME9GaUdxNFNMbXJaZjFKQTllZFpO?=
 =?utf-8?B?SGI4ZnZYZjZKR1JDakNSTmloSzFXNld4OFpYQ3ZUU1ZPSGRETm1EdlIvM3BI?=
 =?utf-8?B?aGRLMWNJVldzQlR6RVVoL0tVUWJ1MmcvVEZqdGowWXhVTjFjMERQd1Y3Rk5s?=
 =?utf-8?B?OTNYRy9wbzEwNlpWVktFVWFsbS8wMFhPdU9iY2ZlSWVkWXUwVzRhald0ZWor?=
 =?utf-8?B?SG4wVGw4NmM5L0ZxLytNbnkrNGxYUUFVQzdnNjBYblpHM08vSC9sc0gycnlI?=
 =?utf-8?B?UlVheElBNEp2TGtndnNCMTU4dDVMVng2K3RMZHZJRjZUOTNrWWJEa1dCdTFF?=
 =?utf-8?B?QWhTMWhDWmVCNWE2a00vczg5SGZjSEQ0ZHdiZlNqSkx1d2N5eFhHSFE4WXQ1?=
 =?utf-8?B?V3ZyaXI4Mmg2T1plUFI3QVVTdTA5Yit1N01nd2s4SVZvemU0NUtEWEJRNHlj?=
 =?utf-8?B?c2Q3dkwxZ2UwQ1lHSEhRTjhZV1hndFJiVXF5eGtRSnhCeEdOUUxrRldGb2Z0?=
 =?utf-8?B?M3AwS0tjSmNaZXV0TFdqaUxwamF1VU9kT29OWkZGbWRlT0M3eDFiUEVyYjZv?=
 =?utf-8?B?NS85K2J5OUMyNEpLNTVOQXhwdmdjblhEZExEK0MrbVAvM252cURkemNVODZW?=
 =?utf-8?B?S1p5eEVUVzhydjdlYk5wZjhjNFFrbGN2MjcvOVQ1VXphMlR6VlZQT0l5TXV1?=
 =?utf-8?B?cmJMMHh1N28wZCtHNDBMeGRscXhVZnl5SWQvT2t5Y2JiSEJvdEljM1hMM2VV?=
 =?utf-8?B?WjBRNWV4M0xnWm96MENlN25FTXo1NEt3UldGeXRvS1hDT3pXRTRkOVpNeDcv?=
 =?utf-8?B?dHhmbklubXlHMWdBamlBWnZDUUNFR1JUbnp5SXZ1NGlBWitMV1M2TGFVRDN3?=
 =?utf-8?B?bE51MW5tZHdQT2VzOG41YzN6bzFjUDNyK1F0ZWJUbklFOWd4UHpvQkFLRVYz?=
 =?utf-8?B?UEJpMzB0TzB4SFBkaUUrN1ZDV05Sb1lnNDVmVytlaXVQMjdUZ2NSRmxSV1c5?=
 =?utf-8?B?QnFxazhuMUNob0o1OEkxRnhLS0xseTJja1pKZm8xNndZbTY2cEZFOTlycWY3?=
 =?utf-8?B?eUE0RHJ1R2M0azB5N0x5UEJzTHBkTkRGelg5dkRXV09xMVpSTHkyWUszckJq?=
 =?utf-8?B?d3BiNGhmUHdRaGVDaVlkYkZjODZSVXVITkwxdm9YY1kzWFBTSE9LK2RCSXA4?=
 =?utf-8?B?M2s3dGgzZkZ4REJLTCtQRGV0aWQySXFYcWptbFR4cUZkZHlMbnpKMEZsOTBu?=
 =?utf-8?B?ZEFpeENSaks1blljVkY4cjFKSFpqUXBETFczS3FPa2JyM3BLZlJUN3VIYmor?=
 =?utf-8?B?eWRaRitWSEZUclN4eGVIV0xYQlIyci9Ua3QvMEJQTlJOSUZtbFNUT3NaRVN4?=
 =?utf-8?B?YmI3S1VkKzk5bVIwdnhLWUtGY211eVB2WUFnUUZjUURHMTFkeFVEeklPZlFm?=
 =?utf-8?B?REhEdC81d3NZSy9mVlp5S3RjeHdMMWpleDg0OUNPd2NzQjRkT1JUd3UzbXlm?=
 =?utf-8?B?eFFQQThnY3l4Ui83WDlwL01GSTBwN08wcUI4UERtTkI3SWEvbXYxM1dOWWo3?=
 =?utf-8?B?NENKL0R6RjhHdTJEOHNrZFhnT0I5ZFNKamU3RzFjT1lsNFliZGJRNEthRUFY?=
 =?utf-8?B?ZlFDOVhYUm93M3M2eTVqYmI3ZGlEYlIvc085LzExdkx5YkJocERTZ0t3YVcw?=
 =?utf-8?B?bzFJWnlDZEdDZmMxSG40SGg0WFpzcVVyNHJPRjBodjNrSkdxS0dZcHdQeHZ3?=
 =?utf-8?B?SHk0TUtDY1h4ZTJrNUdQK01KclRtcjVjd2lvUlJUc2tYQXkwK2N4U1pwTEFp?=
 =?utf-8?B?SWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <82D7C4B745DD734A8E95B87D165259A1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d4cad1-fa90-4fc2-b28e-08ddd5e3bb20
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 18:53:43.0201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JDsDmnX/Pj0G2pK1iwCrHac/HCZeQQX4DT345x8E3yJY8jWJjSgtdBR+WJy5211uWUKGfTu4ML+o8b1BUO4TRKocYCLbbJVltvMqRNCfDS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6346
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

T24gVGh1LCAyMDI1LTA4LTA3IGF0IDEwOjQwIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IE9uIFRodSwgQXVnIDA3LCAyMDI1IGF0IDExOjEwOjM4QU0gLTA2MDAsIFN1bW1lcnMsIFN0dWFy
dCB3cm90ZToKPiA+IE1pIE1hdHQsCj4gPiAKPiA+IEFueSB0aG91Z2h0cyBoZXJlPwo+ID4gCj4g
Cj4gQSBsb2NrIHRvIHByb3RlY3QgdGhlIHNlcW5vIGFzc2lnbm1lbnQgYW5kIGNhbGxpbmcgeGVf
Z3VjX2N0X3NlbmQgb3IKPiBpbgo+IHRoZSBmaW5hbCByZXN1bHQgYSBiYWNrZW5kIG9wIGlzIG5l
ZWRlZC4gRnJvbSBzZXFubyBhc3NpZ25tZW50LCBpc3N1ZQo+IG5lZWRzIHRvIGJlIGF0b21pYyBv
ciBpc3N1ZXMgY291bGQgZ2V0IHJlb3JkZXJlZCBicmVha2luZyBob3cgd2UKPiBzaWduYWwKPiBm
ZW5jZXMuIG9mYyB3ZSBjb3VsZCBmaXggdGhhdCBwYXJ0IGEgSSB0aGluayBhIG11dGV4IGhlcmUg
aXMgZWFzaWVzdAo+IHdheQo+IHRvIGdvLgoKTm8gbm8geW91J3JlIHJpZ2h0IGhlcmUsIHNvcnJ5
LiBMZXQgbWUgcmV3b3JrIHRoaXMgYW5kIEknbGwgcmVwb3N0LgoKVGhhbmtzLApTdHVhcnQKCj4g
Cj4gTWF0dCAKPiAKPiA+IFRoYW5rcywKPiA+IFN0dWFydAo+ID4gCj4gPiBPbiBXZWQsIDIwMjUt
MDgtMDYgYXQgMjI6MjMgKzAwMDAsIHN0dWFydHN1bW1lcnMgd3JvdGU6Cj4gPiA+IFdlIGFscmVh
ZHkgaGF2ZSBhIGxvY2sgdHJhY2tpbmcgdGhlIGZlbmNlcy9zZXF1ZW5jZSBudW1iZXJzCj4gPiA+
IGhlcmUgKHBlbmRpbmdfbG9jaykuIEFuZCB0aGUgR3VDIENUIGNvZGUgYWxyZWFkeSBoYXMgYW4K
PiA+ID4gaW1wbGljaXQgdmVyc2lvbiBvZiB0aGlzIGxvY2sgaW4gdGhlIGN0X3NlbmQgcm91dGlu
ZS4KPiA+ID4gUHJlcGFyZSB0aGUgd2F5IGZvciBmdXR1cmUgb3B0aW1pemF0aW9ucyBpbiBUTEIg
aW52YWxpZGF0aW9uCj4gPiA+IGZsb3cgYnkgbW92aW5nIHRoZSBtdXRleCBsb2NrIGRvd24gaW50
byB0aGUgR3VDIENUIHNlbmQKPiA+ID4gcm91dGluZSByYXRoZXIgdGhhbiBpbiB0aGUgdXBwZXIg
VExCIGludmFsaWRhdGlvbiBsYXllci4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IHN0dWFy
dHN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4KPiA+ID4gLS0tCj4gPiA+IMKgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb24uYyB8IDggKystLS0tLS0KPiA+
ID4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+ID4g
PiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxp
ZGF0aW9uLmMKPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdGxiX2ludmFsaWRhdGlv
bi5jCj4gPiA+IGluZGV4IDAyZjBiYjkyZDZlMC4uMjMwZjMwMTYxMzk1IDEwMDY0NAo+ID4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdGxiX2ludmFsaWRhdGlvbi5jCj4gPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9uLmMKPiA+ID4gQEAg
LTE1OCw3ICsxNTgsNiBAQCB2b2lkIHhlX2d0X3RsYl9pbnZhbGlkYXRpb25fcmVzZXQoc3RydWN0
Cj4gPiA+IHhlX2d0Cj4gPiA+ICpndCkKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCAqIGFwcGVhci4K
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoCAqLwo+ID4gPiDCoAo+ID4gPiAtwqDCoMKgwqDCoMKgwqBt
dXRleF9sb2NrKCZndC0+dWMuZ3VjLmN0LmxvY2spOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgc3Bp
bl9sb2NrX2lycSgmZ3QtPnRsYl9pbnZhbGlkYXRpb24ucGVuZGluZ19sb2NrKTsKPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoGNhbmNlbF9kZWxheWVkX3dvcmsoJmd0LT50bGJfaW52YWxpZGF0aW9uLmZl
bmNlX3Rkcik7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqAvKgo+ID4gPiBAQCAtMTc4LDcgKzE3Nyw2
IEBAIHZvaWQgeGVfZ3RfdGxiX2ludmFsaWRhdGlvbl9yZXNldChzdHJ1Y3QKPiA+ID4geGVfZ3QK
PiA+ID4gKmd0KQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZndC0KPiA+ID4gPiB0bGJfaW52YWxpZGF0aW9uLnBl
bmRpbmdfZmVuY2VzLCBsaW5rKQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGludmFsaWRhdGlvbl9mZW5jZV9zaWduYWwoZ3RfdG9feGUoZ3QpLCBmZW5jZSk7Cj4gPiA+IMKg
wqDCoMKgwqDCoMKgwqBzcGluX3VubG9ja19pcnEoJmd0LT50bGJfaW52YWxpZGF0aW9uLnBlbmRp
bmdfbG9jayk7Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoG11dGV4X3VubG9jaygmZ3QtPnVjLmd1Yy5j
dC5sb2NrKTsKPiA+ID4gwqB9Cj4gPiA+IMKgCj4gPiA+IMKgc3RhdGljIGJvb2wgdGxiX2ludmFs
aWRhdGlvbl9zZXFub19wYXN0KHN0cnVjdCB4ZV9ndCAqZ3QsIGludAo+ID4gPiBzZXFubykKPiA+
ID4gQEAgLTIxMSwxMyArMjA5LDEyIEBAIHN0YXRpYyBpbnQgc2VuZF90bGJfaW52YWxpZGF0aW9u
KHN0cnVjdAo+ID4gPiB4ZV9ndWMKPiA+ID4gKmd1YywKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCAq
IG5lZWQgdG8gYmUgdXBkYXRlZC4KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCAqLwo+ID4gPiDCoAo+
ID4gPiAtwqDCoMKgwqDCoMKgwqBtdXRleF9sb2NrKCZndWMtPmN0LmxvY2spOwo+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgc2Vxbm8gPSBndC0+dGxiX2ludmFsaWRhdGlvbi5zZXFubzsKPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoGZlbmNlLT5zZXFubyA9IHNlcW5vOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
dHJhY2VfeGVfZ3RfdGxiX2ludmFsaWRhdGlvbl9mZW5jZV9zZW5kKHhlLCBmZW5jZSk7Cj4gPiA+
IMKgwqDCoMKgwqDCoMKgwqBhY3Rpb25bMV0gPSBzZXFubzsKPiA+ID4gLcKgwqDCoMKgwqDCoMKg
cmV0ID0geGVfZ3VjX2N0X3NlbmRfbG9ja2VkKCZndWMtPmN0LCBhY3Rpb24sIGxlbiwKPiA+ID4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIEcySF9MRU5fRFdfVExCX0lOVkFMSURBVEUsCj4gPiA+IDEpOwo+ID4gPiAr
wqDCoMKgwqDCoMKgwqByZXQgPSB4ZV9ndWNfY3Rfc2VuZCgmZ3VjLT5jdCwgYWN0aW9uLCBsZW4s
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgRzJIX0xFTl9EV19UTEJfSU5WQUxJREFURSwgMSk7Cj4gPiA+IMKgwqDCoMKgwqDCoMKg
wqBpZiAoIXJldCkgewo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNwaW5f
bG9ja19pcnEoJmd0LQo+ID4gPiA+dGxiX2ludmFsaWRhdGlvbi5wZW5kaW5nX2xvY2spOwo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qCj4gPiA+IEBAIC0yNDgsNyArMjQ1
LDYgQEAgc3RhdGljIGludCBzZW5kX3RsYl9pbnZhbGlkYXRpb24oc3RydWN0Cj4gPiA+IHhlX2d1
Ywo+ID4gPiAqZ3VjLAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICgh
Z3QtPnRsYl9pbnZhbGlkYXRpb24uc2Vxbm8pCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGd0LT50bGJfaW52YWxpZGF0aW9uLnNlcW5vID0gMTsK
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoH0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgbXV0ZXhfdW5sb2Nr
KCZndWMtPmN0LmxvY2spOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgeGVfZ3Rfc3RhdHNfaW5jcihn
dCwgWEVfR1RfU1RBVFNfSURfVExCX0lOVkFMLCAxKTsKPiA+ID4gwqAKPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoHJldHVybiByZXQ7Cj4gPiAKCg==
