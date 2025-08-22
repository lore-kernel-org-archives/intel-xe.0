Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3F4CA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 18:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A7410E155;
	Fri, 22 Aug 2025 18:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mlm8RhJ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89D410E155
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 18:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755889017; x=1787425017;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=067o+VzTPqV05swyr6y/dDofP/dKn7jP9PFwJMIot04=;
 b=Mlm8RhJ3qHdpEMmkwriaX7hGb7LgPF8krtYNBvgTV7U8SEmSDVyxkBiy
 ErhPOBOUs70R8+D6LhfRfUA2H/72JR07h0iC5agdOVoOSdlGkcLOlnG/0
 1/EpKNUlVa6YeZvprL1i3j478Zv1SoS3VfDZ2BU3ye0h8O5hM+nqMXH49
 ej68yAs1ujE4u3b7K/Ek3+Buci+LKzK2P02oOxvw5Z9S+7Y0LSoFRGH8r
 YT3Wb3tThsS0zTVbbbVKk7Jf9JZ56Bj8j2XiyW/P+44nwYYTYxZJXJ5Fu
 laXyus8BIdHW1E1MlNH0xHhgXWgaZmRMjgLGnpQ462BJs8ZqcsOPilhwz g==;
X-CSE-ConnectionGUID: z8ttlx3OSJeyyGDYDlOg5g==
X-CSE-MsgGUID: xIMe+wtwQOiUCfvdThKB2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57400252"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="57400252"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 11:56:56 -0700
X-CSE-ConnectionGUID: QdoUL4EMTOa9QpXM+EUBFQ==
X-CSE-MsgGUID: 8VS6+8ycSAO3JsmcrDI51w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168676096"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 11:56:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 11:56:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 11:56:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.80)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 11:56:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFUU5e2Iapcg9IrDvO/Slg3SiT8f0xmTWc5dPaEbIHjlTPxh7hod3KOVGku8xhvxMkj3nGe53l+H1c/B4eZXdgyfuSAv0ig6pXmqI2VGrTM7R+8KP856siICM6av4soHr22O3F36/xmqW8+ub+pLwmwMx+OjG3SqM4EOHPIfe2w4xeO2hlvVuCGIwb7dnp+eFof/k8jK7f8fVqIQGui6Zg7Gjdv59MpeZlZ+tbAEOB/TEBp6PVjqVkZ8XyBsk9VLFp6BInIgOVbaWTzemMbQr4h1Cgxg7P1x99tP5iuSSx0H0EEdvjmyq7JIZhNrcLq0EYyProB34xhhJV94+W7QpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=067o+VzTPqV05swyr6y/dDofP/dKn7jP9PFwJMIot04=;
 b=qADxGiqCEJYej7dyu2LBl503uGe0iuNLbKROOMJCAcNSpfbb1kPCtoFLKls5ElnreKzrlp5R62LJuJEcYwFcSQ6jvyIHDM6TvnHaJQO3eOQnG9r48mpCPYOin/iN7T7e1jLA0Wmmx8L0ClOuQa/3+pXuIek2ELQcHpQk3kgmjnIMz7bcE9ZtD20COhoQnvfW73/qMonRwbsuhayJL24Dja0L8kGXtS3dYRDkwi5bhAZh7+rus9oMtPmDXaaAXjWlfxwieRk27Hxg78OE4OrcibhDUROEysvR8ViUFhmLRlCnHJe5jUsR+MSeWSbHXZX4fRPY+k9mNRXaEzx+JXyD3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SN7PR11MB7565.namprd11.prod.outlook.com (2603:10b6:806:344::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 18:56:53 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9052.017; Fri, 22 Aug 2025
 18:56:53 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Move device sysfs init to before GT init
Thread-Topic: [PATCH] drm/xe: Move device sysfs init to before GT init
Thread-Index: AQHcE5KUeIurE3nCI0q8+Z8PqVbEZLRvBeSA
Date: Fri, 22 Aug 2025 18:56:53 +0000
Message-ID: <e84715afbb2a388756ffaf650129e578890658cb.camel@intel.com>
References: <20250822182828.107965-1-stuart.summers@intel.com>
In-Reply-To: <20250822182828.107965-1-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SN7PR11MB7565:EE_
x-ms-office365-filtering-correlation-id: 1f85e7d9-0215-4abb-1574-08dde1ada8b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UnVQU1RlY2kyLzF0Zzg5V21XanpuU2p6SmNWNHpFOXFVT0x3NXFxcE9vZUNn?=
 =?utf-8?B?MVFrWE1ZRzZNU2UwWDZRZ2Q5Ykpjbktyanl3MDhsZDJmSlpxQzhHdmJEQW10?=
 =?utf-8?B?My83Z1AwSEZWemk0N2ZEUnZISHpUblN0M05USVI4a2QvdHcrazlBM09zbVcz?=
 =?utf-8?B?YXZ0VVhjZVhHdHJ2Q2VUZGNFa3pUcDl5U3dJUFJsZWpXeW5zcGxPTkhDSlY3?=
 =?utf-8?B?TzBZbzRLWDZORHErc0VUeDZhN2N6NTlraGNHUFVmZTUyanVkYW1YOCt2eWJT?=
 =?utf-8?B?MGNmbnZ3djI1NVdmWWxHUlFkMHQyRWdEMHkwKy9OcnlwZ1JRNXNFcXRDRlFv?=
 =?utf-8?B?bC9WaHpPNG51Z0hXZnNYelhCYjcrL2VMV0RvU3h4MlhzbU9XQTRyMFJvelJ3?=
 =?utf-8?B?QkxJZWw3cEF3aDlQUVlaamltVXovZzBuSDdoTjdIVThmM0thWTkrN2c4YXdz?=
 =?utf-8?B?bFVPRHBPeVFENzVpV3FHdU96bjV6bVJnSjc0c2JSTUM1c0Z0KzJHdDlZYlFG?=
 =?utf-8?B?NG4rMFpqNVRyN2ZheVFkUUZzSTI5T3M5VUpJUGdqSWNSSGhFRmVmK3hZSDVh?=
 =?utf-8?B?c09yRGNzMVRHQzZjQXFRVk5JSUdOTkVkWDlCenhRRVFFSkZQSnIzSEtaRTdG?=
 =?utf-8?B?VHhjT3U1allDV3JTV1BMZFB3SzMxQnZKNnNBc1M1T0QxbWczNSt0alJQNzM0?=
 =?utf-8?B?Q0t6dm9tK1ZrOWVDNDU2ZHc0NUVFK3VvcUM3STZodjJxVzZ5WkxBRmNXSHY0?=
 =?utf-8?B?M1hiY2dMdi8vcldpL3pTdmdnV3VaL3lnNXVMYzBVeEpMR3BBL2tKS2RqbFh2?=
 =?utf-8?B?Szhhcm5pMXRtbUtYTXRneEtXYVVDNU81U1dkbUNQRmZaY0VTcCs4bFZpL25Y?=
 =?utf-8?B?S2R4M1k3TDA3Uk1QSjFFZmJJR21qUzlDUExma2JFWEdPV1pkRGtYRnV6Q0Na?=
 =?utf-8?B?Y2NVY3MwL2JqRlhnclhJUFBtVVZPdmh3cGtITHgyMlVMd2xHYWhaa3hmQ1ln?=
 =?utf-8?B?TnhPcHBXWkdzM01GSC9aZFRoOE5JUkJtTjVJdlV1bHJNMVZzTmcxQmVqaUVh?=
 =?utf-8?B?WlpSUXNsWEdsUVdMaWZvREVIUDdzZHMvSGd0VjlKbHBIcGxISjZzdlBKS0FZ?=
 =?utf-8?B?T1RoVzg1WFYzdTVJbFVIMS9iNkNFRE5FVTRwWW55bjNCWlBxYXEyclloVVF1?=
 =?utf-8?B?WE9lcytsVmFnNXBHNlp3V3p1Q01HNWk5WENaWXJ2d0ltZXdxZG1YS0ZHcGto?=
 =?utf-8?B?Mm56SVlDRUNrVTFINThNTE41MkFCbWlpeSttRGJIbERYbHRjWWo5d1FqRDVB?=
 =?utf-8?B?VkFQNm1NT1hyOEVsRU9UMS9LZDdJYUxVamY5b2c3WjNNb3dHdW1mSFJwd3hq?=
 =?utf-8?B?eU9UTFFxVVFTVk4vdURUbVlpNzNkWml4WXBuTGQ4blRkWUFOM0JhRkJ5NEVm?=
 =?utf-8?B?bkgzQ0h1SlRtcjJaZHh5TXJkSEw3cWQ4M2dZZTZ6L1JVMThHUHJsRUwzaVZu?=
 =?utf-8?B?ZVgxSlZUVGowQmIrMW1XM2RBWGN5RVJPSld4YUk5em9tSlBYRzhleFY2QmNZ?=
 =?utf-8?B?ZUV6czhndU5UUU1tUjE3eUo0Q29oYXpic0wyTVNiUU5KdW5EdGx5NkdRbDZ4?=
 =?utf-8?B?bTNDQU9iYkFlM3dJSHIzZStqT2RLL1NoTUg4cFJJRlNiV1ptOThZZEQ2aFNS?=
 =?utf-8?B?c2ZmZXBEdzdWb2JYV0NpdFFPU0ErT2FrbnArZ3F0L1JFN1VRMHhkYjRwT1Q5?=
 =?utf-8?B?MDlIaDNRUGFXZEU5akpsN1F6VXNmUURyMktJNDNXR1VRSG9INi9FQUN1MllW?=
 =?utf-8?B?WmZLRFJaNkRneXUzVWFWNTg1VnNDY3hCNmRjYXhaa1IzMldHT3ZkcHRySC8y?=
 =?utf-8?B?RDJRUTBjM3U1SzZqSHdMbDZtOThiVTJZT0xLcDFSYml1OCtoN0p1S3ovY2g5?=
 =?utf-8?B?dWk2c3VHTGlzTVpnRUNpQ0ZtajljbGpSQmNVWjhWQUdPelBMSVJiTllZelp0?=
 =?utf-8?Q?WgWMxBeL0GOY079p+GEPNr4dj3evH8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3ZIeCt3NkNxMDhXTDFvdWdzbkRUalN1blVXV0ZuWEhrWm1yV3hJczZvWW5Y?=
 =?utf-8?B?RjBBQlV4M2NBNkhxb1pUMFpJbms2TndURVRhbkNjd0Jqd09PZnQvV0RWUDZP?=
 =?utf-8?B?ZWIzdlc2T1daOVE4OWY5TDlweWxDNFl0Uk5SMEJzcFZuM0dINXdHT0JUSTQ5?=
 =?utf-8?B?Y3hDVWpEQXl2eDVFeTB6OCsveS9rcTRQaEdzdUtDaHdsSGUrOUdlUjRCcm00?=
 =?utf-8?B?TVlJYUFJdlN4N1NQazh3ZnUwMzZIdlpQaThnZm5FQXVPTWw1YndTQWxqM3Ft?=
 =?utf-8?B?S3BOd21jSXVobEl6L2lTTXRkZkVpajl1SERFb1ByNHh1cldMSVBxSjZpV0dM?=
 =?utf-8?B?bGlJTDVHRC9BS25ORWNoUU5hM2dOV0V4bjB2eHQwODhnUllJb1kvV3Zud1Fx?=
 =?utf-8?B?T1prWi9YY1ZaQlFEdXcwTzd3N1RQQ3hZOWtrMlFod0lIblVCSnZQdldXUlUz?=
 =?utf-8?B?WmFMM24zMERRTVd6K0pGZTc4dFFIRGQySHNXbGwyeXFiejlmY2NHSGRNVUlU?=
 =?utf-8?B?K3RlaTNwc1YxSXJEaHZLZVduWVM4RlRsQzBwd1ZwU3dtMTFQQjJ0WS9RYUZQ?=
 =?utf-8?B?SXkxVVBORWVVMjM0dDdVWXlZcTRUdHg2SDVSOHFWZkxSMHNTZXE5Y1ZXcllI?=
 =?utf-8?B?a3hFYU1RcFdGSG5MaGNVbGIrdWx6SHZGc2tWRThZYVhwUjRGTmFBVFZRNkxi?=
 =?utf-8?B?Vkh0S3hCbDdlVzl6c1doSjBtVHNGUGdvNzJWbVlzajhEcXF5UGgxVUdwQnJh?=
 =?utf-8?B?aUtHRnRYZDQwZ0krT1Y4WUQwNXNNcko0VU1OdUlMNlpNR3Z4bmZydUhPTmNs?=
 =?utf-8?B?cFczMWV3bWNBcmxwaTAvRHhnZGlERlZMWDByaHpRbE5mQk5vYnNRQXppb2Z6?=
 =?utf-8?B?amx6cTlGWUtqYjFUUU1nTGZJd1RFWWcrK0pXcENJUS9BOGJGdk1lajVLSFA2?=
 =?utf-8?B?cmFTQVlEelZpR3VKV2NsbmNqMEZEMEpFRHFJUVR3elRoUFRsSlJ6eE1sZFhM?=
 =?utf-8?B?WlN1REtkTFM3bTM5YTV0aVpMakRmcDRMelJiTVloK1hWVk5jSWNHNEdRM1Jk?=
 =?utf-8?B?bTFmdlhPMnAxUDlOTUQ5REhDdFIyOW9mN0JpUEkzdnk3K2NXZjd6Z0RabHhi?=
 =?utf-8?B?SFlkeWxGTVdwNitzcFRMSHBLSHhxV1hiRDdnbjJkeXdYWlV2a1ZCNE5kTzRF?=
 =?utf-8?B?MldhdGY0NTJQdHZueG5JZGljYzFrRzRxNmxhSjR2T2p3MHFzRGxNcUFkWThB?=
 =?utf-8?B?aUxIaGNBemxVbXlKM0VFSTVrWXhHQzk3UVVZdEttNkVpb2Q2Nk96TVU5U1hJ?=
 =?utf-8?B?bHhhdlUyOFZ5YjhQZDFjYWRBS2ZJRnljV2l5YWVPc2lRRWJjTno1S2FwNnVj?=
 =?utf-8?B?dmJaZ2pWQjFVQ0FQM1dOMG5laVQ2OWp6MG9DSTBTcmNWVXZ6R0tCRmtFTGVO?=
 =?utf-8?B?ZjMyM0hVUTNnd3EzUnVOSnFnUW9BZlhndkE4Z24vei9SekxKLzZYYmd3RE5V?=
 =?utf-8?B?dUh5SXdIT3FsU2wyRURDT2VlNHlGcElPRDkxS21MRlUyZ3Jwc1VnNHN1b0tJ?=
 =?utf-8?B?NE4xYkNvR1dkSCtxSnlMUUdqZmp3NnZhK1BZRHVrK3pHQTYzT2gvQks4NWUx?=
 =?utf-8?B?QWFxVXRkdHFPTUM2bkJPaC9oZmpybnNKRDZzWVlEdk9ickhGVGw2dC9BZ3Qy?=
 =?utf-8?B?MUo3cmhWRjgwYS9xTTlHVC9Sd2NSWDUvT1UwelBna3JGcmtGbGlPekZIbGp4?=
 =?utf-8?B?K2RCb2lMT1JaZ1NFbEVuTzA5UlZXWG0wWk15SjM3ZnlMQ2JNTWlzMkhoRTlu?=
 =?utf-8?B?VjJkbDV6M21EdTlmUXlQbHNzY1BKWW5rcXd0N2hKemQxQjd4R0ptUVpIZ084?=
 =?utf-8?B?bHhIRFp2azhtRDc5NmRUeDFNd2F6WFNpdlpIWEJUa2xOaFZXQm1pRm12MjNF?=
 =?utf-8?B?T3dEYWNNRGV3UnIxcCtMTVVKVmFnbDFhdDVEK2ZYNG5KWUJ0VHIyNlBOOHdI?=
 =?utf-8?B?UDU4R3VMczZleDkvWVYwWmZQdnYwZ0E3cGxGYVZyb0hFSTFSbE4rWTE3VDNY?=
 =?utf-8?B?QjBkcjlrTGU5c3M0R3dIMGR2dmdoZk1VeXNVQzZNMjEvemszWDQ3dzVITCtz?=
 =?utf-8?B?MGdUdUNpaXJkMmk1NnMxdEU4Z3dUL051OXcrZlBCQ2tZeHo5RmVHTW1WdkZW?=
 =?utf-8?B?anc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6E87A66052A544CB3BA9D4751C0613D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f85e7d9-0215-4abb-1574-08dde1ada8b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 18:56:53.1900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FUf9joRhiGhvClcjrKZHotb9IqtvEfUDY+azQ4C2dmX4y5n7EWjt2xTlCVLt5zhAoYRbUNOqaxfKbDpEc6Berdvt6K7XFfR0ciY7KjIqYkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7565
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

SSBhcG9sb2dpemUgZm9yIHRoZSBub2lzZSBoZXJlLi4uIHBsZWFzZSBpZ25vcmUgdGhpcyByZXZp
ZXcuIEkgdGhpbmsNCnRoaXMgd2FzIGFuIGlzc3VlIG9mIG9yZGVyaW5nIGluIGFub3RoZXIgc2Vy
aWVzIEknbSBkZWJ1Z2dpbmcuIEknbGwNCnJlcG9ydCBiYWNrIGlmIGl0IHNlZW1zIGxpa2Ugc29t
ZXRoaW5nIHdlIHdhbnQgdG8gcHVyc3VlLg0KDQpUaGFua3MsDQpTdHVhcnQNCg0KT24gRnJpLCAy
MDI1LTA4LTIyIGF0IDE4OjI4ICswMDAwLCBTdHVhcnQgU3VtbWVycyB3cm90ZToNCj4gSSdtIHNl
ZWluZyB0aGUgZm9sbG93aW5nIHNwbGF0IGlmIHJ1bm5pbmcgb25lIG9mIHRoZSBmYXVsdA0KPiBp
bmplY3Rpb24gdGVzdHMgaW4gYSBsb29wIGZvciBsb25nIGVub3VnaDoNCj4gW8KgIDU5MS44NTMy
MzRdIHN5c2ZzOiBjYW5ub3QgY3JlYXRlIGR1cGxpY2F0ZSBmaWxlbmFtZQ0KPiAnL2RldmljZXMv
cGNpMDAwMDowMC8wMDAwOjAwOjAxLjAvMDAwMDowMTowMC4wLzAwMDA6MDI6MDEuMC8wMDAwOjAz
OjANCj4gMC4wL2xiX2Zhbl9jb250cm9sX3ZlcnNpb24nDQo+IFvCoCA1OTEuODUzMjQxXSBDUFU6
IDYgVUlEOiAwIFBJRDogMTA4MDAgQ29tbTogeGVfZmF1bHRfaW5qZWN0IEtkdW1wOg0KPiBsb2Fk
ZWQgTm90IHRhaW50ZWQgNi4xNy4wLXJjMisgIzc0IFBSRUVNUFQodm9sdW50YXJ5KQ0KPiBbwqAg
NTkxLjg1MzI0NV0gSGFyZHdhcmUgbmFtZTogSW50ZWwgQ29ycG9yYXRpb24gUmFwdG9yIExha2Ug
Q2xpZW50DQo+IFBsYXRmb3JtL1JQTC1TIEFEUC1TIEREUjUgVURJTU0gQ1JCLCBCSU9TDQo+IFJQ
TFNGV0kxLlIwMC40MDY0LkEwMi4yMzAyMDkxMTQzIDAyLzA5LzIwMjMNCj4gW8KgIDU5MS44NTMy
NDZdIENhbGwgVHJhY2U6DQo+IFvCoCA1OTEuODUzMjQ3XcKgIDxUQVNLPg0KPiBbwqAgNTkxLjg1
MzI0OV3CoCBkdW1wX3N0YWNrX2x2bCsweGMyLzB4ZjANCj4gW8KgIDU5MS44NTMyNTZdwqAgZHVt
cF9zdGFjaysweDEwLzB4MjANCj4gW8KgIDU5MS44NTMyNThdwqAgc3lzZnNfd2Fybl9kdXArMHhk
OS8weDEyMA0KPiBbwqAgNTkxLjg1MzI2NF3CoCBzeXNmc19hZGRfZmlsZV9tb2RlX25zKzB4Mjk2
LzB4M2UwDQo+IFvCoCA1OTEuODUzMjY5XcKgIHN5c2ZzX2NyZWF0ZV9maWxlX25zKzB4MTJkLzB4
MWUwDQo+IFvCoCA1OTEuODUzMjczXcKgID8gX19wZnhfc3lzZnNfY3JlYXRlX2ZpbGVfbnMrMHgx
MC8weDEwDQo+IFvCoCA1OTEuODUzMjc2XcKgID8gcGNvZGVfbWFpbGJveF9ydysweGNlLzB4MTgw
IFt4ZV0NCj4gW8KgIDU5MS44NTM0MTRdwqAgPyBtdXRleF91bmxvY2srMHgxMi8weDIwDQo+IFvC
oCA1OTEuODUzNDE3XcKgID8geGVfcGNvZGVfcmVhZCsweDU5LzB4ODAgW3hlXQ0KPiBbwqAgNTkx
Ljg1MzU0Ml3CoCB4ZV9kZXZpY2Vfc3lzZnNfaW5pdCsweDJjZC8weDM1MCBbeGVdDQo+IFvCoCA1
OTEuODUzNjQ2XcKgID8gX19wZnhfeGVfZGV2aWNlX3N5c2ZzX2luaXQrMHgxMC8weDEwIFt4ZV0N
Cj4gW8KgIDU5MS44NTM3NTBdwqAgPyBfX2Rldm1fYWRkX2FjdGlvbisweGE2LzB4ZTANCj4gW8Kg
IDU5MS44NTM3NTddwqAgeGVfZGV2aWNlX3Byb2JlKzB4YjA5LzB4MWJmMCBbeGVdDQo+IFvCoCA1
OTEuODUzODcxXcKgID8gYWRkX2RyKzB4MTgwLzB4MjMwDQo+IFvCoCA1OTEuODUzODc5XcKgID8g
X19wZnhfeGVfZGV2aWNlX3Byb2JlKzB4MTAvMHgxMCBbeGVdDQo+IFvCoCA1OTEuODUzOTk0XcKg
ID8geGVfcG1faW5pdF9lYXJseSsweDM0NS8weDQyMCBbeGVdDQo+IFvCoCA1OTEuODU0MTI0XcKg
IHhlX3BjaV9wcm9iZSsweDhmOC8weDExZjAgW3hlXQ0KPiBbwqAgNTkxLjg1NDI1N13CoCA/IF9f
cGZ4X3hlX3BjaV9wcm9iZSsweDEwLzB4MTAgW3hlXQ0KPiBbwqAgNTkxLjg1NDM4M13CoCBsb2Nh
bF9wY2lfcHJvYmUrMHhlNC8weDFiMA0KPiBbwqAgNTkxLjg1NDM4OV3CoCBwY2lfZGV2aWNlX3By
b2JlKzB4NWI0LzB4ODcwDQo+IFvCoCA1OTEuODU0MzkzXcKgID8gX19wZnhfcGNpX2RldmljZV9w
cm9iZSsweDEwLzB4MTANCj4gW8KgIDU5MS44NTQzOTVdwqAgPyBrZXJuZnNfcHV0KzB4MWQvMHg2
MA0KPiBbwqAgNTkxLjg1NDM5OF3CoCA/IHN5c2ZzX2RvX2NyZWF0ZV9saW5rX3NkKzB4OTEvMHgx
MjANCj4gW8KgIDU5MS44NTQ0MDJdwqAgPyBzeXNmc19jcmVhdGVfbGluaysweDQ0LzB4YzANCj4g
W8KgIDU5MS44NTQ0MDhdwqAgcmVhbGx5X3Byb2JlKzB4MWZhLzB4OTUwDQo+IFvCoCA1OTEuODU0
NDE0XcKgIF9fZHJpdmVyX3Byb2JlX2RldmljZSsweDMwNy8weDQxMA0KPiBbwqAgNTkxLjg1NDQx
OF3CoCBkZXZpY2VfZHJpdmVyX2F0dGFjaCsweGM5LzB4MjAwDQo+IFvCoCA1OTEuODU0NDIzXcKg
IGJpbmRfc3RvcmUrMHhkNC8weDE1MA0KPiBbwqAgNTkxLjg1NDQyNV3CoCA/IF9fcGZ4X2JpbmRf
c3RvcmUrMHgxMC8weDEwDQo+IFvCoCA1OTEuODU0NDI5XcKgIGRydl9hdHRyX3N0b3JlKzB4NmEv
MHhjMA0KPiBbwqAgNTkxLjg1NDQzMV3CoCA/IF9fcGZ4X3N5c2ZzX2tmX3dyaXRlKzB4MTAvMHgx
MA0KPiBbwqAgNTkxLjg1NDQzNV3CoCA/IF9fcGZ4X2Rydl9hdHRyX3N0b3JlKzB4MTAvMHgxMA0K
PiBbwqAgNTkxLjg1NDQzN13CoCBzeXNmc19rZl93cml0ZSsweGRjLzB4MTMwDQo+IFvCoCA1OTEu
ODU0NDQxXcKgID8gX19wZnhfc3lzZnNfa2Zfd3JpdGUrMHgxMC8weDEwDQo+IFvCoCA1OTEuODU0
NDQ0XcKgIGtlcm5mc19mb3Bfd3JpdGVfaXRlcisweDM3My8weDU1MA0KPiBbwqAgNTkxLjg1NDQ0
OV3CoCB2ZnNfd3JpdGUrMHhhNWYvMHgxMzgwDQo+IFvCoCA1OTEuODU0NDU2XcKgID8gX19wZnhf
dmZzX3dyaXRlKzB4MTAvMHgxMA0KPiBbwqAgNTkxLjg1NDQ2NF3CoCA/IGxvY2tfYWNxdWlyZSsw
eDE3Mi8weDMwMA0KPiBbwqAgNTkxLjg1NDQ2OF3CoCA/IF9fa2FzYW5fY2hlY2tfcmVhZCsweDEx
LzB4MjANCj4gW8KgIDU5MS44NTQ0NzRdwqAga3N5c193cml0ZSsweDExNS8weDIyMA0KPiBbwqAg
NTkxLjg1NDQ3OF3CoCA/IF9fcGZ4X2tzeXNfd3JpdGUrMHgxMC8weDEwDQo+IFvCoCA1OTEuODU0
NDgyXcKgID8gX19yc2VxX2hhbmRsZV9ub3RpZnlfcmVzdW1lKzB4NTZlLzB4ZGEwDQo+IFvCoCA1
OTEuODU0NDg4XcKgIF9feDY0X3N5c193cml0ZSsweDcyLzB4YzANCj4gW8KgIDU5MS44NTQ0OTJd
wqAgeDY0X3N5c19jYWxsKzB4MThlYy8weDI3NDANCj4gW8KgIDU5MS44NTQ0OTZdwqAgZG9fc3lz
Y2FsbF82NCsweDhmLzB4ZjcwDQo+IFvCoCA1OTEuODU0NTAxXcKgID8gdHJhY2VfaXJxX2Rpc2Fi
bGUrMHhkOS8weDEyMA0KPiBbwqAgNTkxLjg1NDUwNl3CoCA/IHRyYWNlX2lycV9lbmFibGUrMHhk
OS8weDEyMA0KPiBbwqAgNTkxLjg1NDUxMF3CoCA/IGRvX3N5c2NhbGxfNjQrMHgxYzAvMHhmNzAN
Cj4gW8KgIDU5MS44NTQ1MTNdwqAgPyBkb19zeXNjYWxsXzY0KzB4MWMwLzB4ZjcwDQo+IFvCoCA1
OTEuODU0NTE2XcKgID8gaXJxZW50cnlfZXhpdCsweDc3LzB4YjANCj4gW8KgIDU5MS44NTQ1MTld
wqAgPyBleGNfcGFnZV9mYXVsdCsweDk1LzB4MTMwDQo+IFvCoCA1OTEuODU0NTIzXcKgIGVudHJ5
X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc2LzB4N2UNCj4gW8KgIDU5MS44NTQ1MjVdIFJJ
UDogMDAzMzoweDc5ZDhiOGIxYzU3NA0KPiBbwqAgNTkxLjg1NDUyOV0gQ29kZTogYzcgMDAgMTYg
MDAgMDAgMDAgYjggZmYgZmYgZmYgZmYgYzMgNjYgMmUgMGYgMWYNCj4gODQgMDAgMDAgMDAgMDAg
MDAgZjMgMGYgMWUgZmEgODAgM2QgZDUgZWEgMGUgMDAgMDAgNzQgMTMgYjggMDEgMDAgMDANCj4g
MDAgMGYgMDUgPDQ4PiAzZCAwMCBmMCBmZiBmZiA3NyA1NCBjMyAwZiAxZiAwMCA1NSA0OCA4OSBl
NSA0OCA4MyBlYw0KPiAyMCA0OCA4OQ0KPiBbwqAgNTkxLjg1NDUzMV0gUlNQOiAwMDJiOjAwMDA3
ZmZlYjRhOWJiNDggRUZMQUdTOiAwMDAwMDIwMiBPUklHX1JBWDoNCj4gMDAwMDAwMDAwMDAwMDAw
MQ0KPiBbwqAgNTkxLjg1NDUzNF0gUkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAwMDAwMDAw
MDAwMDAwMCBSQ1g6DQo+IDAwMDA3OWQ4YjhiMWM1NzQNCj4gW8KgIDU5MS44NTQ1MzZdIFJEWDog
MDAwMDAwMDAwMDAwMDAwYyBSU0k6IDAwMDA3ZmZlYjRhOWNmZDAgUkRJOg0KPiAwMDAwMDAwMDAw
MDAwMDA1DQo+IFvCoCA1OTEuODU0NTM3XSBSQlA6IDAwMDAwMDAwMDAwMDAwMGMgUjA4OiAwMDAw
MDAwMDAwMDAwMDczIFIwOToNCj4gMDAwMDAwMDAwMDAwMDAwMA0KPiBbwqAgNTkxLjg1NDUzOF0g
UjEwOiAwMDAwMDAwMDAwMDAwMDAwIFIxMTogMDAwMDAwMDAwMDAwMDIwMiBSMTI6DQo+IDAwMDA3
ZmZlYjRhOWNmZDANCj4gW8KgIDU5MS44NTQ1NDBdIFIxMzogMDAwMDAwMDAwMDAwMDAwNSBSMTQ6
IDAwMDA1ZDE0NGNkMmZjMDAgUjE1Og0KPiAwMDAwNzlkOGI4ZmY3MDAwDQo+IFvCoCA1OTEuODU0
NTQ5XcKgIDwvVEFTSz4NCj4gDQo+IEl0IGxvb2tzIGxpa2UgZm9yIHNvbWUgcmVhc29uIHRoZXJl
IGlzIGEgY2hhbmNlIHRoaXMgY2FuIHJhY2Ugd2l0aA0KPiB0aGUgR1QgdGVhcmRvd24gKGJhc2Vk
IG9uIHdoZW4gZWFjaCBvZiB0aGVpciByZXNwZWN0aXZlIGRybW0gZmluaQ0KPiBoYW5kbGVycyBh
cmUgY2FsbGVkKS4gSWYgd2Ugc3RhcnQgdGhlIG5ldyBkcml2ZXIgcXVpY2sgZW5vdWdoIChqdXN0
DQo+IGEgd2hpbGUgbG9vcCB3aXRoIG5vIGRlbGF5KSwgaXQgc2VlbXMgbGlrZSB3ZSB0cnkgdG8g
Y3JlYXRlIGEgc3lzZnMNCj4gZW50cnkgYmVmb3JlIHRoZSBvbmUgZnJvbSB0aGUgcHJpb3IgZHJp
dmVyIGxvYWQgaGFzIGNvbXBsZXRlZCBiZWluZw0KPiByZW1vdmVkLg0KPiANCj4gQWRkIHN0cmlj
dGVyIGluaXRpYWxpemF0aW9uIG9yZGVyaW5nIGJldHdlZW4gdGhlIHN5c2ZzIGZpbGVzIGFuZCB0
aGUNCj4gR1Qgc3Vic3lzdGVtIGJ5IG1vdmluZyB0aGUgc3lzZnMgaW5pdGlhbGl6YXRpb24gZWFy
bGllciBpbiB0aGUgcHJvYmUNCj4gc2VxdWVuY2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTdHVh
cnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZGV2aWNlLmMgfCA4ICsrKystLS0tDQo+IMKgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2
aWNlLmMNCj4gaW5kZXggM2UwNDAyZGZmNDIzLi5mNTcwMDdmYWEwMjQgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZGV2aWNlLmMNCj4gQEAgLTg3Niw2ICs4NzYsMTAgQEAgaW50IHhlX2RldmljZV9wcm9i
ZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChlcnIpDQo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGVycjsNCj4gwqANCj4gK8KgwqDC
oMKgwqDCoMKgZXJyID0geGVfZGV2aWNlX3N5c2ZzX2luaXQoeGUpOw0KPiArwqDCoMKgwqDCoMKg
wqBpZiAoZXJyKQ0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBlcnJfdW5y
ZWdpc3Rlcl9kaXNwbGF5Ow0KPiArDQo+IMKgwqDCoMKgwqDCoMKgwqBmb3JfZWFjaF9ndChndCwg
eGUsIGlkKSB7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZXJyID0geGVfZ3Rf
aW5pdChndCk7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGVycikNCj4g
QEAgLTkyMiwxMCArOTI2LDYgQEAgaW50IHhlX2RldmljZV9wcm9iZShzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSkNCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChlcnIpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgZ290byBlcnJfdW5yZWdpc3Rlcl9kaXNwbGF5Ow0KPiDCoA0KPiAtwqDCoMKg
wqDCoMKgwqBlcnIgPSB4ZV9kZXZpY2Vfc3lzZnNfaW5pdCh4ZSk7DQo+IC3CoMKgwqDCoMKgwqDC
oGlmIChlcnIpDQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGVycl91bnJl
Z2lzdGVyX2Rpc3BsYXk7DQo+IC0NCj4gwqDCoMKgwqDCoMKgwqDCoHhlX2RlYnVnZnNfcmVnaXN0
ZXIoeGUpOw0KPiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKgZXJyID0geGVfaHdtb25fcmVnaXN0ZXIo
eGUpOw0KDQo=
