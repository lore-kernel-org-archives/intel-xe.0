Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E323CCA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 21:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA2A10E07B;
	Thu, 28 Aug 2025 21:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="co/1i965";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E2510E07B
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 21:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756416908; x=1787952908;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=vUyJn4QpMt/S9Md3Ts4Zv0H9bscgojrtlRcKipR8U5k=;
 b=co/1i965J6f3RNKj37nb4SSHU6ydzcTEKIEGjjfa3Q1nRWtYQY0/sWqD
 cY/mXwWsWujm/TjZS6rE+5AzQqoaU8kqk4vADlFiowlHSr9qnJbRa3cYY
 t391smuHbSp6TcaDeTsjbwYYH0nlK8NjHS//s0/QmHx9Or0GMrSjZMLWH
 vRhUgFQrYiEq6OtF5l7rpYLHHI1AITlcNARURB9eCXHr0lJgGk3eBnQWS
 QMEDZQZfz1FsHTYUOrURjE1KdKgIxy3YaiwuJ8Hhv+zIlqIx5Kf/TW1RC
 Rq2fliHFUrYCIRSPHY/SjDetz2HKDcs1ccsCJ9GtkzVsepQ44KtHVYvBo w==;
X-CSE-ConnectionGUID: JokSIWpnRAiyqNxo4l14eA==
X-CSE-MsgGUID: 0vz7/euESUKbSxbLE3s+5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58846601"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58846601"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 14:35:08 -0700
X-CSE-ConnectionGUID: QXzfcTjAT/6+4KJiYadLhQ==
X-CSE-MsgGUID: BxIGYYSUT2GCrJD7adC9/w==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 14:35:07 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 14:35:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 14:35:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.63)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 14:35:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=beTLA/WlC+zjVHmYoG7upYySXao+Gj2coDwNbfhu5f/5Am3B9Pd1H2kEgzwL7wbiiPPDjWqwVGm96T9s/Ht7jhZQHa2GqFSXXsV5XbkCZCS1do7YUspSfppa6HDD8sa1QxrkQnYNSaox+jBCwdW4yLa7P82peE22ZOS5cR8Aog2yCWsDXRCr23C+y3SjxrWmv4f4x79srkWzYZtxH5TmND7akbh50kFvY9CciMcAPxA0MAG1QReyzhXd+5LPu5+jzBukvFpTOoyG5E2ylQ90213hNQdkdV/c9GtDWiPni32jmrpePJm9ZMpJK9HiFe/enig+NA4heaQqjwp2e8jQHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUyJn4QpMt/S9Md3Ts4Zv0H9bscgojrtlRcKipR8U5k=;
 b=FgWTy+HUuX7s1HKZStycAWPVQyjwS0RJYCMSjsdhP27aEuV/Q0Z044ao/eRUuuQJmc086Q004oZv7P+JR18kP9RcasWH6EtKzHyJmnbuZ+hn7+SVDMLT5TGqAiiXEHM/sWmbEtETh9cJD8FPM8p7u4jaaS0+J9srT8pmBw0OpImiyvGFxM/MBgADUKu88/q9R5QHxGZphwOP3dWhvupgDNxqC2b45jQU4v+Z8kQ+a7OzOL/5Csl/QdfjeCLrIU7pUtAbl25QX1wpvmKEb/fzl7yeMWCS8va4WHOiST3W1PzeXWxUcfQCl2RzktOKjAUubjYpkXHHmAjKoJPnxiUlpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA1PR11MB9494.namprd11.prod.outlook.com (2603:10b6:208:59c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 28 Aug
 2025 21:34:59 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9052.021; Thu, 28 Aug 2025
 21:34:59 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Increase GuC crash dump buffer size
Thread-Topic: [PATCH] drm/xe/guc: Increase GuC crash dump buffer size
Thread-Index: AQHcF5iPEMdgzmQfPkaXyGhbqHvueLR4YWCAgAA2MgCAAABxAA==
Date: Thu, 28 Aug 2025 21:34:59 +0000
Message-ID: <bef15d3e44b3b292968002230f539eb3c23ea2a2.camel@intel.com>
References: <20250827212110.1024961-1-zhanjun.dong@intel.com>
 <39b6759c8ada538ba44e375c7cb4e38ef824fa79.camel@intel.com>
 <7cca975b-c27d-4c6f-a70e-c6316bbe3e1d@intel.com>
In-Reply-To: <7cca975b-c27d-4c6f-a70e-c6316bbe3e1d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA1PR11MB9494:EE_
x-ms-office365-filtering-correlation-id: 0c9b92f3-6165-4ed9-6a4c-08dde67abd8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?anNoVCtOaEgyK1N5SG8xOGtjZTE1YXRRTk91c3ExWEZjdHZXeDMveTNGeThG?=
 =?utf-8?B?bzdCTFlnWk5DOHV2b1kwL0tVZTNDNnNvOS84R0puNjA1VVR3RzFoRUZqbHV0?=
 =?utf-8?B?c0VReUlpcjB4ekNYZjdxMFRETGZrcXpxNDNMamhBMENTd0RNUUdJWWhvMFN2?=
 =?utf-8?B?bWE0c0VzMDcwVGtpVDV5eEZGSFJTUGEvVUg2UzU2WmJjK0E1dkIrTXBwMG9S?=
 =?utf-8?B?cFpwRSsrTGF3LzlmUnZNbWFVRmlLT0hHTU1Kdm5qRXRUK0hPYWk5VlBHRDRK?=
 =?utf-8?B?VysvT0tSeUhGQTZhNzUzMFIxbXlJZU83dDZqVHpHUkZ0Tkl5cVJFNktYa1I4?=
 =?utf-8?B?ZkdwZWdaT3hKT1NWTFJRNzBFeWtCd3d1LytXNXFCV0M4UURHMXBqZ1lhT3RY?=
 =?utf-8?B?VldoOHlEajBXb1VlM2Y4SldQclZJaUhBY0NnTUZoYkFEN2I1QTBsdTB1Zjhu?=
 =?utf-8?B?VXo1ejVHL0k5ZG1nQldxQko0T0wvQnZDWGMwUkplNGpzY0tLTjZsdEt4SW03?=
 =?utf-8?B?QkFiSmZHZFFESkNuTTduQ1pneTAyem9VWjZ1eFczbE9XdFRidXpKdGY5eVpj?=
 =?utf-8?B?OHZ1d0RpU1JpR3I2UGJHODR2dkxLaVg3NTg3UzBlN1RjblBnY1k1aXMyYmRm?=
 =?utf-8?B?c2NpdEJqbXVGdWIrZDZBWThWVXpZOWpITjFNQ0xpM1U1cGQrN0ZiNUNObTNH?=
 =?utf-8?B?VHZFWDRBVkpib3pXOHBlY0dEd0RZcXQwNUJRaU5PYWNPdW5Zd2c1QldKSCtM?=
 =?utf-8?B?QzVsZHB1dXJkajYvUDVvNzJrdWwxRm1Bayt2bVZMVjdaQkV3Y1dNQXptTVA3?=
 =?utf-8?B?Tlp6em1aYjhaZ1FxdTRQTXZQZzhFSDNkUDBqenozUUN4Q2Uva1l2R1JlWEFm?=
 =?utf-8?B?Nyt1MVNDbkp3bnJMekVqQ1lqcTllTXNjekQ5YklMOHpBbHdMSmR5MEsvVU9R?=
 =?utf-8?B?U3owd3h4WEx0Y2paVEdqNzIwS1Q5NGFUT3ExRFZsQitPcXZUVTV3RFQyRDJx?=
 =?utf-8?B?Vis4Ky81OUY5b29QMlA2QnQ3UUxvbVJSN1U2aC8vaDhQc3ZiM1VXOTh4NEdZ?=
 =?utf-8?B?QkNVbEZNaFk1bFlqc3BaS0szSmZhTXhLWndoOEp2L3d2d2x2bmJiQnpwcjRn?=
 =?utf-8?B?U21hVGhGTGtKazErYjhRVFlYdktiQmN2STNVQ1o1UXY2aGRNUnJSZVVjWVRh?=
 =?utf-8?B?NTZhbyszNDRLcTZlK0Z4TU9zQllJZjAvRkVaUjBQT0pvNVhSSk5TYWdmU2tq?=
 =?utf-8?B?M01hWlFqRUJINVBWbTczcVBERlBKdzhwSzFwZ3I2L1U4ODl2MWNIZ0lRS2Rv?=
 =?utf-8?B?dzFVOWZvKy84N1J5bElUUDFjblVXVUxrc1BraWVpTGJzTkh6Y0NFc1JGVE9E?=
 =?utf-8?B?VURSWks2WUN3SG1XU2hwVEF5dWZ5NTRYVEEzclpyVHNPb1dzK1Z6WFJVYlpL?=
 =?utf-8?B?WTVORU15VThYd3VwZmR1SzdMVk9DWERoSHlJaHUwbjhML1RPcXlYbXdyVVQ1?=
 =?utf-8?B?VFArandJeHlsMjdIbWNwWE5lQjBCN2FydmMvSGRNdE1nMFNkaWJXc083VFVr?=
 =?utf-8?B?dW9qdkpuWEQ3ZFl0MnlVSkw2ZkhxdDRQdUlpcGRwOTlhOTNiV2xBZ0JjeHVX?=
 =?utf-8?B?aG9COTNUc0VwS2lQa1hwNnhoRklNTTMvOXg1MXY4d1l2RThEQ1lJbzZNcVk5?=
 =?utf-8?B?WjljU3FTSjR4N1UxVDJzbWdTYkx5b2pwMnJnK3A5Z1JCa3BOUEI3cThQUmVn?=
 =?utf-8?B?UDkvdmZPbCsyS2Fkcis1SUc2SVJXSXpsSEM3L24vY0hhb1NFT2l0dHRkclVF?=
 =?utf-8?B?WURyUkdQZEw3Q0V1SGovditITEIxUGozK2t3ZGdOd0QzQU9UaGR5YXRZRVdq?=
 =?utf-8?B?c1E1SGJMNkZMMk1laEpTRXl0SnNJa3ViaUxVRzQzUTYrVWZLbVBON09TQWY2?=
 =?utf-8?B?S1dQd09NQ3NBL0hHQnBaN3hVME5pSFhEbFFGeVo5a1I0RnN5Slp5R1NNQk5R?=
 =?utf-8?Q?zth+dDeiR2kf9P2YdMwA848ollx87c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnFSUXA1TFVkSmU0SXFIR1ZDbEI2LzhzZlpVd2hGWjJDUXl3d1VGQ09lbHRD?=
 =?utf-8?B?UmdtMUtsWkZOZHpXTFVSV0JuT2swK3JyYUt4SXhTODR2MW95eHd3YjdXbVpL?=
 =?utf-8?B?NENjdFBJdy8wc3VacDJHUXRwMVF3bjV0UmxlMVdhYXB4ZjZzUGtWeEVwN0JZ?=
 =?utf-8?B?V3lUdGFoM3grRVgveXFzbzhRQ2dqZk9JNGV4TUN5MithdXkwd2ZpSEQvY3hV?=
 =?utf-8?B?Y1NMNE9hZnltNHVLMjVIK3I4M1ZORnI2K25UV3F3VjlKaVhzcm8zUWdpbGFF?=
 =?utf-8?B?eTNGMnljaVpZOGpDaHNOYm0vc1VrNU40L25GOTlQbVFJS0VhdVVoOUdFWC9Q?=
 =?utf-8?B?UGkvSFd4Y2lDYXUwVFA1ak1XL0p6SktpazEvQUZORWdvYjYrWVVWbnlTbDZp?=
 =?utf-8?B?LzJTYlQzUFNDK0N6U2kzMWM4OTNzTUNsb09JMEVQM1E5ZGZ5dmpPNkR4alJS?=
 =?utf-8?B?bG1CVnkzS0E2aDUxR2t4blo1dGpKb01RRnNaYllmSW94d0lZcmMvZXc5KzBT?=
 =?utf-8?B?R2VWWlZSTUVURCt3dHpnYUV2cWlaanVXL0xKNENzS3FFR1k1dk5NL1N5NEZj?=
 =?utf-8?B?bUxFUVM4dDBxeXJQWlBQem5WL0FrY1dubmVxYnRzem43RVNUam5iYjFHNlV0?=
 =?utf-8?B?ekp4SkdVWVhsbnBoQThBZ3A3L2VTNGxqZE5hdU5vTkFNMHl4UGdEQWlPdVNN?=
 =?utf-8?B?WjkzdllNcE0yWEFnUGMwd1pWYldhWERRb1FPNGp1ZWY4eTZOaTIvU05Rc2t1?=
 =?utf-8?B?OXJDdlN5THpZUjJvTExLN2lVeTJHM0xnRUhLUlFlYUk0aTlRTW5SZ2NkTmJx?=
 =?utf-8?B?WnNMWVRvT3NGS2tXUVhVekNLYXBFeklvRmlDRTV0TlhjVmFFR2pHQmJlYXFV?=
 =?utf-8?B?a1phdVAzMlo3VXFxcyt4bjFucmdVenBXYnI4ejBGYWFMaUMxN0F5aFUrcDFy?=
 =?utf-8?B?cWpBLzYrQ21GSGdGNnduaG5sNmplWG5sV251Ly9oeXpmN3cxMDdybjZZeXFv?=
 =?utf-8?B?bzNESXRhK1hTYlM4S1BsUHlwNjJqR0FoRCt2cm45R0srVlhOdFJhYitrejl6?=
 =?utf-8?B?TEY1b2Vid3lEYlZNa0IzTENoQ0g3SGE3TUpRb2VEUFovVVpwZStLNm5TdGhx?=
 =?utf-8?B?dkc2QjVNdU9yRGxvbkY1WWJoRndnWjhZOS9ROUFaQ1RPYklJdWZ3bFFoMVFX?=
 =?utf-8?B?clpTUmNONUpiUDhkdmI1SGJyVVJ2eHB2NHlSaWUzVmQvc0xXVkJ5ZitiMitt?=
 =?utf-8?B?UjB2Q01CU0kreTN4SEE5QTZuZ2hKV1ZQdmZ4YU9xY1lwTkN3OW1hZjZvUDl3?=
 =?utf-8?B?TmQ3cTR4S1VCT0pMZSswcGRBK1V0OTNhTUp0dEMva1dPbktiTkx1cTk2WVc1?=
 =?utf-8?B?MWNjQWVaWTA3b0pZNnY4WDJUMUg3eUFHc3FocXdNcm9sS1VBQjRxWTdwRFds?=
 =?utf-8?B?NTNJa3hlUFJGaXY1MDlCbkluSzJhbW9ycXJ4QXRZMnY0b1liaUNzV3crR1BO?=
 =?utf-8?B?STBhNUM2OE9MTmJKUVhMbzBSTS9jSUE0dXc0ODhTK21TUVNheEozSTM1Rnd2?=
 =?utf-8?B?S3NDTkttMDFrcERKVXV0OGhyT1oxaUN1aW9VdUJsbmJwSnMwREU3Z2sxMVNG?=
 =?utf-8?B?T2tYSmRubDFYWjllRmpxM1RuekdtSVFwbzJmMkRFazFheUZ3SlphSGxob2pG?=
 =?utf-8?B?SmdIdWFCMDRORDBJbkVLMHpnSnBvRFpsVzBoNmVzNFM2UytJUU5pOXV3aERY?=
 =?utf-8?B?SjFsQkZ1SzhhWExTczdOb0RaV2pmOEVpdUphOFNlaEV4R1hBRWlnN1hCR2hR?=
 =?utf-8?B?VkNPR0pIQ1ZzeHd4OXh5Sks3dHM5bmd4aEg1Q0RhcWhkUnVPcHNmN3ZQOXVY?=
 =?utf-8?B?S0h4TE5QVFhoaXdrczJQamozNnlQSmRpTERjSjVGR3B2TkM1TGN1MUw4d3hS?=
 =?utf-8?B?b21QaTVrK0x4enhZR09hcmhCRVVKMEhiN04rdmRzS3VoRUk5SGxoK2xPVW9y?=
 =?utf-8?B?Y1IrTjVLYjIvcUFzKy9IaWRCRzdnNlQrejlNRFRVWTg2S2lHb0ZNMnhwcktJ?=
 =?utf-8?B?UXg1eXNsTDEzVC91YVNMelZyaWE1ZWlRV2RCSkVQRW5YOHlVUGdtSE5WNk5o?=
 =?utf-8?B?bTVNd2o4NXBUZEt4WnU4YUV1MVh0Y1ZQbjVNR2ZIVmpxTVJyd1k3Ni9GaHpD?=
 =?utf-8?B?OUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <231BFAF86A85274A8EB72BBF9437AB15@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9b92f3-6165-4ed9-6a4c-08dde67abd8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 21:34:59.6765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 458VBvZAQzPqViChSGLv7vhrzgGK3l3y7b6AZHQzYYfVicyuijGmgZc2Uhu3ZufTT6NyQjRwn2FDLzAlQGGvHoVKwhfwC/W5p5HLQpfzuAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9494
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

T24gVGh1LCAyMDI1LTA4LTI4IGF0IDE0OjMzIC0wNzAwLCBKb2huIEhhcnJpc29uIHdyb3RlOg0K
PiBPbiA4LzI4LzIwMjUgMTE6MTkgQU0sIFN1bW1lcnMsIFN0dWFydCB3cm90ZToNCj4gPiBPbiBX
ZWQsIDIwMjUtMDgtMjcgYXQgMTc6MjEgLTA0MDAsIFpoYW5qdW4gRG9uZyB3cm90ZToNCj4gPiA+
IEluY3JlYXNlIEd1QyBjcmFzaCBkdW1wIGJ1ZmZlciBzaXplIHRvIHN1cHBvcnQgdXAgdG8gMTZL
IGR1bXANCj4gPiA+IHNpemUuDQo+ID4gQnV0IHdoeSBkbyB3ZSBuZWVkIHRvIGRvIHRoaXM/DQo+
IEJlY2F1c2Ugc29tZSBjdXJyZW50IHBsYXRmb3JtcyBhbHJlYWR5IGhhdmUgYSBtYXhpbXVtIGR1
bXAgc2l6ZSBvZg0KPiAxMktCLiANCj4gU28gaWYgdGhpbmdzIGdvIHRydWx5IHBlYXIgc2hhcGVk
LCB3ZSBhcmUgYWxyZWFkeSB0cnVuY2F0aW5nIHRoZQ0KPiBjcmFzaCANCj4gZHVtcC4gVGhhdCBz
aG91bGQgaGF2ZSBiZWVuIG1lbnRpb25lZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuDQoNClllYWgg
d2l0aCB0aGUgYWJvdmUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIEknbSBnb29kIHdpdGggdGhlIGNo
YW5nZQ0KaGVyZS4gSnVzdCB3YW50ZWQgdG8gbWFrZSBzdXJlIHdlIGhhZCBhIHZhbGlkIHJlYXNv
biB0byBjaGFuZ2UgaXQNCmJhc2ljYWxseS4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gDQo+IEpv
aG4uDQo+IA0KPiA+IA0KPiA+IC1TdHVhcnQNCj4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFpo
YW5qdW4gRG9uZyA8emhhbmp1bi5kb25nQGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gwqDC
oGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfbG9nLmggfCAyICstDQo+ID4gPiDCoMKgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPiANCj4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2xvZy5oDQo+ID4gPiBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWNfbG9nLmgNCj4gPiA+IGluZGV4IGYxZTJiMGJlOTBhOS4uOThh
NDdhYzQyYjA4IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19s
b2cuaA0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19sb2cuaA0KPiA+ID4g
QEAgLTE3LDcgKzE3LDcgQEAgc3RydWN0IHhlX2RldmljZTsNCj4gPiA+IMKgwqAjZGVmaW5lIERF
QlVHX0JVRkZFUl9TSVpFwqDCoMKgwqDCoMKgIFNaXzhNDQo+ID4gPiDCoMKgI2RlZmluZSBDQVBU
VVJFX0JVRkZFUl9TSVpFwqDCoMKgwqAgU1pfMk0NCj4gPiA+IMKgwqAjZWxzZQ0KPiA+ID4gLSNk
ZWZpbmUgQ1JBU0hfQlVGRkVSX1NJWkXCoMKgwqDCoMKgwqBTWl84Sw0KPiA+ID4gKyNkZWZpbmUg
Q1JBU0hfQlVGRkVSX1NJWkXCoMKgwqDCoMKgwqBTWl8xNksNCj4gPiA+IMKgwqAjZGVmaW5lIERF
QlVHX0JVRkZFUl9TSVpFwqDCoMKgwqDCoMKgU1pfNjRLDQo+ID4gPiDCoMKgI2RlZmluZSBDQVBU
VVJFX0JVRkZFUl9TSVpFwqDCoMKgwqBTWl8xTQ0KPiA+ID4gwqDCoCNlbmRpZg0KPiANCg0K
