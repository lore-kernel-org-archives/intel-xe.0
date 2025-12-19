Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B95D7879F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 16:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CEA110EE85;
	Fri, 19 Dec 2025 16:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QSM3SPlG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FA410F040
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 16:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766162901; x=1797698901;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=8MAtKwxWrGREF0v/pn16d3cYZiIgNsjVqv4Lg3xR6i0=;
 b=QSM3SPlGaI/uUv3/yQbYhLv4hAHoq/FEtRZPzRfwkJjzRUKUybGoMlPO
 iTwMFqzFPlhoScM8ZTBnlckX3DuxGvFLygBYDBeLSJg3dZfvgi2kY4Yi/
 hCACGoByl6XAAEHh0flVDLgmHvwjbrmDZy256EGuz7JJWshA8CofaKX1X
 PIpXYsqlstmM/61/Gv/vfeTsMp1exf6176Oc53CcY/eMSiKzz9htbeYCF
 JBt6lEuPiogvMj467G9RKbfabCtgzWyz34hJVC8wKOA6JBNewh2rOi+9x
 cBBy1KEBSb0tervPE3t9GvbAAzJp0WoBBZb2tWZlPitsE3QFBJssGEySt g==;
X-CSE-ConnectionGUID: XjA9DavRTXuuthazbeHI/g==
X-CSE-MsgGUID: rstcVAfDQcCx4rAERYjAgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="67121485"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="67121485"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 08:48:21 -0800
X-CSE-ConnectionGUID: NQ6eHQ3lTzOj5fPcLkq9CA==
X-CSE-MsgGUID: oEImr5gnS92NiLP7LbAEKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="198055327"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 08:48:21 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 08:48:19 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 08:48:19 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 08:48:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ByD68veyVXWVayQIsBM19yD3/nrvvEn35fH3iPQLkxkGtrgTWrwKE2/vlkDn+gX0oryDyKxo+VmOn95+7vW8DkjiczR2bIxhaR3S+F/VFdLcru7vs8Pu1A8pZaH8vl1JT/MoUIHAwfNP7doH0YKJYkBCXsTzSK84LjXwEuOF7uIRt6AOG8quvixC12wFPTrryOLT3/QU5gwKVG/rvruTqmqoXlPwVH1d6+EVW6TApXl2icRq5+BxfnbR/nc0aJMIYai4229TLXHqwx3TFh1FfEDjfy1ShQAO3IJoJ/ECdJAVBF/Sq+hiHWx6FfykpgIwrPm4MEeZSreFRCJXW4m8LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMR4H56eAmTjzSXJTKmEGXusORRiGAXhXAmUmcvYnGE=;
 b=fN4n7RX2CSKIuPPDJZb8GvAiQc5Ji/piFaHASGQ8OrP2oZliSOBrSX2rOkVEbzyYmb7qVAHOc002i+t77uHvkBMdr5IEqZuk8GrUdFS0JTJzCdYk7uNuJorCv4PQGZJ9qogNr7oGEjT2IP9qIPeee6WYCp2GwFIYBoRqjmSJEPz5u3jCz+BsoDECqQW917fNorq4VIi27+nTdz7t5OkLOa1FkK+eYrDAQS3VfQ61tY7ddhWjYm5qVS/DwsuoTPXw8m/GLGqb1aatx+mEfv9dNp8EZu9vbbb/ltsEPhOGD6KPJwtzhr4N/9Wq1kqsRb4wdjQb9fK+hieWvtxaJhhhqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SN7PR11MB6601.namprd11.prod.outlook.com (2603:10b6:806:273::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Fri, 19 Dec
 2025 16:48:14 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%3]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 16:48:14 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <176601598324.97606.13650201692253611277@a3b018990fe9>
References: <20251216-wa_14026084006-c10-hdmi-toggle-powerdown-v1-0-08677b03e2f1@intel.com>
 <176601598324.97606.13650201692253611277@a3b018990fe9>
Subject: Re: =?utf-8?b?4pyX?= Xe.CI.Full: failure for Toggle powerdown states
 for C10 on HDMI
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: Patchwork <patchwork@emeril.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Date: Fri, 19 Dec 2025 13:48:08 -0300
Message-ID: <176616288833.9461.13744021603313905102@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR06CA0010.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::23) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SN7PR11MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: 67c4fa05-2d77-4175-5a48-08de3f1e6734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3p0RForNXI3UTJka2tWMVcwaENIcVEycXpDSXZoaDhjQ3VlaXI3elhIQVRM?=
 =?utf-8?B?ZXIyeVVyS29lY3o0QTliZno3RndobEIyZnRqV1lBM2Y2NDVjR2ZJcVl1c0Zv?=
 =?utf-8?B?UEtXQWVHdk1JZTJaV2N6RlhtazlGUFlSQmhQZkhsY3Fib3lLUVl5L1A4bTFj?=
 =?utf-8?B?bWVOZHY1TmJTN0Z5QytHTzZiTHdxZTBJbTJXUHpVUnJJLytXVFgrNXAwamZL?=
 =?utf-8?B?cjFHOEgvUEpBYmV3aUVSZnNTdzBHQVMzNU0rWmZuWWp2ZlBoUDlwYWx1SjNQ?=
 =?utf-8?B?YTQ4Wm1NVHpGemxpRXhPQVgyUVAvM3dKUGl1SHZMaS9oL25vdHdrdHFmcnZp?=
 =?utf-8?B?a3Y5YkFRb1N0cW1YSHZLRll3TDFGZnZPTzA1T2xzRzVvOVZpZzdDcUp6ZitQ?=
 =?utf-8?B?TElGMjZmc0RXMWlDZHlHUHhycE9sdlJwQkk3SXowT280U0FjaTVQKzFicVEz?=
 =?utf-8?B?TWJnZXl1a2xvYVVHNmE3WkpINjdvbTNMVXk4b2xMK09QaFhYcVloWWdyYnlP?=
 =?utf-8?B?N29mVXBmZ042eGIvZjVYQWUzMkNrQkhOendoRnF3Q01ZTWRMaXpNemh2SmtV?=
 =?utf-8?B?U2t6OUM2Q3dvdUUzY0hMZ3BLclgyUWRXTlZTSlJJaDJ1dGhSRFR0d3ZaYVJO?=
 =?utf-8?B?T3JpeHErSlFyTTkwVlNwTXN6UmRyYTJUc2VrekVRdkF1Q01jL0lFMzVCRlYv?=
 =?utf-8?B?azBmU2UxMEZHWVc0YUVpYlEyQVBFUlg1VWVXdHpLdTFoQnJUc2FSR0NTZm5y?=
 =?utf-8?B?d3IxZXREVWk4Tm9jWXB1Ykc4cEcybjlpbmJyRHd0UGpZZ2NxcE41S2FDa3kz?=
 =?utf-8?B?NVF4TlpKckxBZ21pUTkrOWI0SHVGKys4clRtZjBTTDEwQ0ZKZ1ZsdS81d25D?=
 =?utf-8?B?QnNXQnZUVTlOZDdNakc5YmUzYXE1amNUTk9ubHliLytJekxGZXNockdidzZs?=
 =?utf-8?B?QXhjbzZjVW41SWNyaFpmZ28vbWJNRmZ0Q01NOG51QW8vQ3FUNERNWGpsRklS?=
 =?utf-8?B?bjRzd1ZmTHRHWkJrREVlUklvSTNUOWVWQmJNNmNUenV3N1ZVODlabGt2QUNZ?=
 =?utf-8?B?WklvS1BRZVZ2WlkzTXM3T2lpNzE1TWhnUmh5WjhRTWM0enltNnVpUHFXbFF1?=
 =?utf-8?B?eHova2U4SHdWcEovWnhSK2ZtTTd0dFJRdlEvL3IxZkI0SGV0ODZBM2UwYzk2?=
 =?utf-8?B?MWUxWUpicndkYnVRZmxUa0NPSFpmSG1IWUt1clVDMjJWaERES1F1KzdWQktS?=
 =?utf-8?B?QmFSZmxXUXllTEFpa3dnZEE3UGg4ZnhNVTFQa3lyNnpFeWI5TkJXakgzYkVl?=
 =?utf-8?B?L2Rtb3RyVkNYWUYzMHZXdEVGd0JMSi85dkZ4dEhtdGpkdllQNEttdnJUSFRv?=
 =?utf-8?B?T0tHekk3THFLYk1lTlZwNHpZM2t1ZEFxZGNqUHM2SFdWZ2RGYWhITEx1d0gz?=
 =?utf-8?B?bkpVQ3hmVnUrM3RNbUU5QSsybGhhMERJdEI4UHVMN0c4Q1c0dU9IT2pMaENs?=
 =?utf-8?B?aTJHK3lRY1g0MVJBRE5ZRk95QjVtZktlZzdUNmVrQmtzUFRWME1iVjJKRTFK?=
 =?utf-8?B?Unp1cHdsREk3bmN1aHRUWktRUlF3ZGdhSUJob1VqamNybFhHdFpFcGxBWW5u?=
 =?utf-8?B?Tk02czJYY2JFYlNXd0VxTHhpRVhMTTVsU3dnMDRBOXd5bEVoU1BwRkFrdUQ5?=
 =?utf-8?B?K0ZQYTlyZGxaeXJCOFM5RVpzY0tOL3BTSHMyTFBMOXduK2FsTFUwRDBmN3la?=
 =?utf-8?B?MTliWHdVaFVIQXM0L1hJL3ZZc0lSRFZqdFlwcmRZUFhVOXUyaG0xaUF0c3d1?=
 =?utf-8?B?aTZ0QjhweGlGdzEvejZaOXNnbXFicStJY0l0blZSaDFuTGZCM1F6VUFnVFJ2?=
 =?utf-8?B?RFNqRWh4TTRJVXhGV3MzZ05tL3FTdW1mNHF5NUJRa2NHWUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzZEQmhScVRsYXlYbkY0c09vdlY4d2VVdlVFOExpQVpTVE43VStvZmdpLzJT?=
 =?utf-8?B?b0RjYVNsQjFtNjlucWl3cUNwUTVrYUtRbzJjdnZDSys3WGhYSHlWd29oZE1O?=
 =?utf-8?B?S2ZNWWZkaWh1VldrOW1vT1k5dzJrcTBNRElQTDdvNnFTcFhZcVoyS2poU0xs?=
 =?utf-8?B?T0hUNDNlQUhCbjVpaUZ6SElGTDV6U0phTHFrZ2VCb1ZMQnU5YU9QOE5jQ1ZL?=
 =?utf-8?B?Mms4L3l4TkZVZFAyY1V6SXN6bjhVdlRLSE9BTVNrNlRLKzduTUtwczZiYmtI?=
 =?utf-8?B?Z1VYOVhWMkZIY0sxYXF3Wm1EWnAvbWhGaDJ1MHFRY093UjRDWEEwdm5iRGFY?=
 =?utf-8?B?c1dsdENzajREWUY0cHdKM24vRHk2Y2lJNzF1N01Bcnp5TDVUVm9nR1E5REow?=
 =?utf-8?B?UHAvL1R3SUZmcEtMa3RKWElkdFRNM25jZkJaSm1ZVzVuQnhQdDdHRUkwMExH?=
 =?utf-8?B?U28ybG5CZk9tU01nL3AwYUdFanZrbWZDTjR0dnFRWDVKR0J4ZHozUzhiRFJR?=
 =?utf-8?B?cjQ5ZDN0bHJaUjdmN2tMaG00dFA2cGNaY09DYXk0RitHZCtrSzU0eW5iU09N?=
 =?utf-8?B?c2RnN0NSQmlrODgwMytNMzBSTys4enBVS3VpaFdjeTNFTGp3UGwxMGU0RjR0?=
 =?utf-8?B?V3ZBd29pNGZHbWMrM0dSOEp0bmNseitNLzNYdkticVFnWXNWaElhN2plN2Ez?=
 =?utf-8?B?S2Ivd3pIVk1wVjUxUi9KUVd3eFZOWm56Wmk5M2lIejNueXQvVk5qNGc0MTdU?=
 =?utf-8?B?cnNyL3RmbHBpN0JadkZjSDFqMXpiNisvRG1rS2Z3ejBFMmpLcUpEaG5icmVD?=
 =?utf-8?B?OENSb2ZiTUczNlBUV01qaWo2TTY3ak1ZRUFpcnFJazhlRUdLbCt3SThIWFpw?=
 =?utf-8?B?dFlEOXk2S2xKUmMybjA4emJGT3lUMGY3cWUyZ05MN2N6UzNLUDk1OVl2SVEz?=
 =?utf-8?B?NTlpaG5uZ2EzeU5vL3FhdDZJL2N6eUZPR2xYYjJqbThTamZHaXVsejZPTEVS?=
 =?utf-8?B?Um9lL0NuQmd0bW13THRLYmtOdXR1d2Y2bW5RK1puMzRYcmFkRmh6YkVNYkdo?=
 =?utf-8?B?elNBTmZzUCtyRG1paTZpdDFVY1owSUtCNSttRXhkcTRGSm9Ib3VJTDlmVmxm?=
 =?utf-8?B?dHhpU1NCODhZQ1JUeUdrMzBEbEVqUjhsVWo5TDZqYmlrcUxtNUk5Y3ZsVkJR?=
 =?utf-8?B?ajUvTGdmTndONlpLL1NReU9uMkQ4NWlGZlJGQ1hvTlBJdkJsK0dBNEdtNHMv?=
 =?utf-8?B?RzRFS05UZkpEdzQyV2dWbEFrdnN1c0kxS2tlSktPa2NOTDlLNk5yOExPaXEv?=
 =?utf-8?B?STZZOFVrSmJuWGpvNlJnMnZFb2E4SUd4UzJKNDdkdUNiVk55SGxMN0xRaEkz?=
 =?utf-8?B?YUNTdkdHTFpqdUN4ZDRQTkdRc3ZVZERkWXkyR2lyTkwwc1d4V3hDeGJhUXlX?=
 =?utf-8?B?OEpUVStIcHlFd3VUSk9ZZ3pPSFljcVNNSkpsZkl6TUtKTTh0RkhiTFNuajN4?=
 =?utf-8?B?M3V4NEFiMTVMUksrMGNBR0ZJOTAwS2owMFovS2V0Q2FtQWFkdTJNeWtyaEdF?=
 =?utf-8?B?QTdCaXlvOWxJVCtVWmtHR2trWHZhWHkvTkJyUkxRTE5vbmZuTjdBSmdkZHFt?=
 =?utf-8?B?U2liN0pNcFNWMnY5aXlpdXZFRXhRM2RnWUNaaXhpOS9MMVU5ZC85emxtU3RR?=
 =?utf-8?B?dkF3WFd6K281cFB4aWp6MEhMQThWQStNSzFmbDlCVzBuMXFsZXlDWkgxWHZG?=
 =?utf-8?B?T3RzNlRYTTFIdkh5ZENIVUpVcUN3SjYyc2lJYXFhMFdZaW1UUEhjRW5scnpV?=
 =?utf-8?B?VVNwRUsrZTA0NGV1L3QrVExkbWVGSlhoNVEwTVJrcitkaFVtdTVxZkdyRzBq?=
 =?utf-8?B?cnVFM0xOYkZsd1Bod0lRRm9sSWxhaWsxRmNQMk1jdnBJTE11NW1lbzV0eXpp?=
 =?utf-8?B?cVlnc0o1aWJ6d2hIR28xeEFsSGRsRkxNUmhYb3l0RnZqUHBiZHU4bnduKzlm?=
 =?utf-8?B?Uk1vRkNBZkROVnlSN3JWNWdmSkp3QkYzdmNSWUtrVE0wYUY4bk5taXZkR3VQ?=
 =?utf-8?B?ZjhJQ3U1eDc5Q2ROVEhxSnBPZFpjV0F0MUhSeVU0WWxoNFdnQ1dmaDZncEtE?=
 =?utf-8?B?WmVRaTlVRHBSR09XZjZoZHhobENTMkNabktoM0g1RG5jaXQ2M2dXOVV6eVpi?=
 =?utf-8?B?eTJ0WHJJU2VzRWdXYVowdlJXWDF5TG1wTDBLVlpSVTBXK0ZXdTY3Z2xPQnhI?=
 =?utf-8?B?OExPWFRFdkxwODQxbG9ldzlhcjR3QURJR1RqdkNiQnUrRTd1K1k1WVg1b2Ex?=
 =?utf-8?B?ckZBOHpMaXY1WHVISFQ1R1JCZEFZUUo0bzNBVEZTRys4RStzMVhJUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c4fa05-2d77-4175-5a48-08de3f1e6734
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:48:14.7888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WHxQs3lJV93qPpLrkYuuvc2KR0wLdLuv/BccWCee0wxeeBh3DyhYIvqtyDZocfgF31g9+6OCRA4UZBllu85EZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6601
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

Quoting Patchwork (2025-12-17 20:59:43-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: Toggle powerdown states for C10 on HDMI
>URL   : https://patchwork.freedesktop.org/series/159124/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41=
_FULL -> xe-pw-159124v1_FULL
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-159124v1_FULL absolutely need =
to be
>  verified manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-159124v1_FULL, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (2 -> 2)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-1591=
24v1_FULL:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@core_setmaster@master-drop-set-shared-fd:
>    - shard-bmg:          [PASS][1] -> [SKIP][2]
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86b=
eaeddb9d69bf698d0697aa41/shard-bmg-7/igt@core_setmaster@master-drop-set-sha=
red-fd.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159124v1/shard-bmg=
-5/igt@core_setmaster@master-drop-set-shared-fd.html

This skip is unrelated: nothing in the patches would affect the logic
for opening the device fd.

--
Gustavo Sousa
