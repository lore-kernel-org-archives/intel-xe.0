Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37892C5473A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 22:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9BE10E426;
	Tue, 27 Aug 2024 22:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2yZfKG1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9967C10E426
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 22:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724797936; x=1756333936;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=mMdo0l+opA+7PbNntea7939ebvqYDuPkSuQ7r0G9vkk=;
 b=B2yZfKG12H+SmftgVK4ySbP5KDlxCqRFVp7rZo9YaCecaOOc4t/mWLHO
 aBcyx2C2+Cp4Aeklk24XzZB8GRa2ulADJKWbylKZXDZVR6kpKQX3L8hBi
 E6ftT0nIflWjRYvogPimyjRG4VpYasA9a2/FuBfsu7cg1mfYCGdMLZ4sG
 LR7F1JKQF8RrAhXbimVb2Jxz2qxJTVhFzK0VdxiU5YQSzFv79J9RxzDyq
 QdbkYyfl6SRPk7Ik1ol7MuEaa3hcK7L/PLI7O2eWAbYHKnTS9tmdPTyyc
 UleyxJ88hATB8Lhuj6aeFq6Y4N94tFnjQ3Hmvymlf61dphs91+/YG+aih Q==;
X-CSE-ConnectionGUID: W17kDxYJS6uUAn3LDnTaGw==
X-CSE-MsgGUID: Va2uNTatRo+ZpVPHBG61aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23179546"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="23179546"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 15:32:16 -0700
X-CSE-ConnectionGUID: 9ffwFP7jTce+Mh8evbHxbg==
X-CSE-MsgGUID: XMPsMNRzQda8tlP/BIsZXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67720710"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 15:32:16 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 15:32:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 15:32:15 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 15:32:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8Vt+JT6VvO+WBNQn/kSxI0hI1zJQk+gDnJ/CnyJBPoxAODCExfziXfgbrhKXazAiPDkQepNxxXnf7+HarV3APRPbPDz2XwEWwzLBfx6sHd2F5yyQojxP4dZAvw3gtn29ful4R+6SX2ozi7fkR+gR+v8Azrp4iLSpEyrkCdVM7RRJmCXEy47VnXf0QwKnOn+Zfqe35U+eSaTrt+IvStcrYc5MwauOtjbbUqLcQsw3HokN69ikOBXdAtCcsiy0n4InSIvBBF0JEEcCrkZmblJcQJo6s2wTilsb3r3IIprHN8mWA2vCKzFUcLionVQfbK61AXyzqSt9MgENY4ZfZZ0dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMdo0l+opA+7PbNntea7939ebvqYDuPkSuQ7r0G9vkk=;
 b=IRKAAAFYHAZxUfeCGDHHC8UKt6OndiMnzTz83qBfQAPR5my21XuoPkiDDqTd0wCzU6uP76Sx3h7bVjownldwIo5OmA1mR+9JhxxCdY0CyI5jmqMIoY7RwPuzfmpWKhOO5YmCKLaYmXu07GDfdbB56QPwgX3dkCfuYgLneLAfzOz1DX1C+OFGL2P8s130V8nckck+Uz7IGj+38qIGPO4k2p4zibL7jO0ICcw0F4/iB2WWl+1A0M6SL8z8UXb+r308oRKXOrCY0Ylz4KnKy3+RefEVuX12U2glzr7IfpTLeeiVgRAIcQ/oOcjUNrsfwZPJmI3EcK2nlSML/v3CC5YGGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM4PR11MB7256.namprd11.prod.outlook.com (2603:10b6:8:10c::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.26; Tue, 27 Aug 2024 22:32:11 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%4]) with mapi id 15.20.7875.019; Tue, 27 Aug 2024
 22:32:11 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v17 5/7] drm/xe/guc: Move xe_lrc_snapshot to header file
Thread-Topic: [PATCH v17 5/7] drm/xe/guc: Move xe_lrc_snapshot to header file
Thread-Index: AQHa+Mq8s0EzaqV88ECKx+tEZdZdPrI7sFKA
Date: Tue, 27 Aug 2024 22:32:11 +0000
Message-ID: <321e29dbe8dce2cc6f7d79a84c9850ba24e8e62c.camel@intel.com>
References: <20240827214726.1183935-1-zhanjun.dong@intel.com>
 <20240827214726.1183935-6-zhanjun.dong@intel.com>
In-Reply-To: <20240827214726.1183935-6-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DM4PR11MB7256:EE_
x-ms-office365-filtering-correlation-id: 99e7b817-88f8-4121-3d01-08dcc6e817cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Q1VhOFZ2MjYxaHV2QjRnbFlacGRQbGl4TWdZYW0vTnF0dTBIVk5MQ3J3bFpL?=
 =?utf-8?B?ZWxPejFTcUpLazh0NXNiWGJndnVlWklYTHFWNitFcWtkZHIrdk1zSzh4a2Ny?=
 =?utf-8?B?c09CMkJKRGpJcC8zY0o0L05lQ0diMVpUZGdYMEtSdjMyNDZpc2U2THQ2Rlhx?=
 =?utf-8?B?cnJLeHBuVG5EQm1UWE5NMlJqTmVWZnJYRjYydzE2NGY4cDVzVDZZLzNBN1pZ?=
 =?utf-8?B?c0tVQWYwMlNoVGgzc3BPeEk1ZTk3OXpLR0NKNWVNV3RicHY0K1doNDR0czFT?=
 =?utf-8?B?MHB0NHJTTUdMc3BobWZlUG5LNEM5S2E3TWdseHQ1NUNCdjhnQjBITjRlcS9j?=
 =?utf-8?B?VzhGTjkrZGtaY1RBVG16c1JndGhqRFJCQ21UL282N1ZJaCt6VFBKUEZxQTdV?=
 =?utf-8?B?bVpMQjJNTExWa1RyRUg5cWVQU2oyaE1KWUhyQjBiNzhQSDZWNjdZN3Q3VUJU?=
 =?utf-8?B?TGhoMFBnbEYyY2l4eWJJRzVIdldhTWZNZC9mSXlXYVdraHMvWmVBL1dOUXlJ?=
 =?utf-8?B?c3RKMlJ3Z2dlU21uVUhjY3ZKRVNVZjhoazBTQkMrZ2d0TFk5MkwwaTgyNXYz?=
 =?utf-8?B?NEVpRU5Vc2RIWS83aFJFdFBjQ2RXenpTSzNoajZsaVY2M1pJQXVlTHpRNzAr?=
 =?utf-8?B?WFlEOUZZMjU5YVQya3BiR0IwTXQ1SDRMUzQ4UFdFSXIyNjdHbmlvaGZaVUdS?=
 =?utf-8?B?bWU1QnQzOHg5cjNvRmd6cFV4b2xJb0VDUlRHVEhKS3pSRnZRYmVoRndENFRi?=
 =?utf-8?B?YnVLWlhIK2FvL0xwajBZUnJFdUpydVNtNU01TGFmV1lXTjBWb3Rndk42cVJU?=
 =?utf-8?B?eFJXeHpUWC9hWTZZMytTVktBd1ZHOFUxRUc2c1Zuc3hHMVJqR045UjQ2VWo4?=
 =?utf-8?B?a3Yvd04wY2lnRmJUbjVFVk5ITHRzeHgxbHRtVXJmRFRyajRUN3Z5YkdYT0Np?=
 =?utf-8?B?Y3lqa0N4UEZ1TWJIelNsbXM0RjJ6NDJJODRPd2F4eFR6TlFmZzYxOTA0bmhZ?=
 =?utf-8?B?dFh6WVBrbmZIeEpOTVB5YVpNT2FkRFRnKzEwdWg0TmJGYWJhMHFWTEVoWDNO?=
 =?utf-8?B?WGZsQzA2eXZHaDdXb3Nrd01uaDg0TTJSS1h1cEJhbG1OVmJadmxRTkJCSGh0?=
 =?utf-8?B?V0Q2U0llZ0RjWGIrc3RVNC9WK3oxR0Ixek1ocXNXdHFlYWFtMHYxK1RjWVNl?=
 =?utf-8?B?VER2b09pUnFpZ2ljTDdtdVBOS3NoYjNGL3k1aURCVUp3Tmw5cFI0ZHFLNy8r?=
 =?utf-8?B?QndRYkFHRFdYWnZWV2M0bUhHU1RmcTRka01QTEpIUDZxblN4MHFaNGFHT2FZ?=
 =?utf-8?B?dzNVdWs3c0hCWXRhMWhYOGhxYkJBVjZVcFIwV3NjTklPMkNLa0ZjRUU3Ukx4?=
 =?utf-8?B?MXBBNnBTUTEwYTlYLytEL3kxN2F3Yy9pRXhXRVdLVjN3T3BLK241ZjRaTUkr?=
 =?utf-8?B?aGZmVEEzbmFPN1BGWWlVSFlQZ0xlTGNUUGZhNHV2emtFUCt6ZVlJY1N0R0Ex?=
 =?utf-8?B?eXdUd21zL09zb0lac28wRURVSURCT3ltajI0WDNHZEdMVTBWK2hlcHQyU05w?=
 =?utf-8?B?K0s2UVI3UCtBdDFhRkczamJ6NUpEcUZvTXE5RWFrSFNWWnNPbkFINEdNdXUr?=
 =?utf-8?B?clZkMVA1UnkzU083ZUVHMWYzdDFJZjNqYXlOK2k1NmdsdmIzcExEK3JFMkJz?=
 =?utf-8?B?K0d5MzRNc0pGS2tMS21nTmhSSWZYc3Q4OEZXNHNtdkJqaVhiMHB4RVYvcDkr?=
 =?utf-8?B?SStnY25xQm8rS3NGVUlBMEZyYzlLMWZnaWpRT2g4bWRXVXBkZTRBTWVmazRP?=
 =?utf-8?B?VGhKTzJ2QjNwVVlrVEV1R0ViaWJXKzdLMkJpMTB0MFBXWko3STFsZGlwQXFI?=
 =?utf-8?B?eFZ3dWJyamluS0FjUldQT3ZBOHpycWdBdkloNG5XRVNGS3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dG4zczB4Qk5kWUpmallpd2lSOWl1ZkJyUmVkTjZFSDd1d2JHc1RiTWJaa2la?=
 =?utf-8?B?bnU2T0IvY2VMd25BZUxlQ0huWXFnT3QrUXpQNnZ4TDhlZnhraGk2dVF4clg2?=
 =?utf-8?B?MTBCWkFlZ0VXS1hMVVJVbTQwRlo5c29DVWdVMnIyMlQvVlZTK253Q1lFYTYw?=
 =?utf-8?B?U2VyTnorbzNJaml6Yk12R0hOVFRML01GbzVweGdTS1ZwOER5Q1REbVlPZm5O?=
 =?utf-8?B?cS9Vd21UNG96czVVYnVUcUd4QXA4N3Y4bVYzMU1DQ3NJTTB5cnQvVkc0bFpi?=
 =?utf-8?B?dFAxUGNRREdYQy94U3d3dmN6Y0dGUWlSTUYvV3lGM0Y1VWtYa2htZmtxMjE1?=
 =?utf-8?B?ay9aQ0VTd09xUER4YW9nMnhqazhOVUZWUmR6Q1B5d0RpN3J2R2ZKeE0zMjRC?=
 =?utf-8?B?VmhSQThrVnpVa2Q5bUhIMW1GcFZMUDRlaWYzZmpXSEVKdjVTa2hwSDJUOVVN?=
 =?utf-8?B?YUY4VWF6ME1qK01IUjlSMDVOcmpEUHJKbjc3UkN4SzNZL0hQZVU3RVEwZ1Rs?=
 =?utf-8?B?UGduWE9FVnZJN05mRWFMOXJ1N3VqcFV0REgyeVdNVWJiU0tSM1h0TWI3Uk1t?=
 =?utf-8?B?bDZId1VGSVYwbnFUNVo4MndBQS9MQmQveG9oVEwxc1RrbE80N2FMZ01NcTZN?=
 =?utf-8?B?QnYzVTNUNkNvOVZIaEprLzYyenFMNXNKaDI3YzNZSmZlS1ZrWWhFTlNlL2tq?=
 =?utf-8?B?V09TY1dnT3BkNHRsRXNscnU1QWVJTnJmaXdKTFJyK09OZklQdzVPMXM5QUVN?=
 =?utf-8?B?NEZZSS9meVFWR0U0dzBIaDYvL0IwSEtBN1pGNHR6VmhGZ2hvWm1tLzlLUFBu?=
 =?utf-8?B?SllrMTlJZnFMdml3TGo4TjYzekpKd3J6Vk81OUNCMVdoK0c0d01yV3VGVytP?=
 =?utf-8?B?Q0NxTTQ3KzJ4UG0xeGE5WHpWSzQvQzE2aThXcmt6ZzJPLzVnOEVWeDMvQ1dF?=
 =?utf-8?B?UTZ2d1pFNlJSMzhxODdZWGgxdXg4VHNsdEdZR2FtckloekZhS1hGdzlYUGFS?=
 =?utf-8?B?eHJEczZORUFNeHpROGE1cDMwdlA4dlQ1WXRFOS9DK3F0d3Z3eXVYRTdWRDV4?=
 =?utf-8?B?UmR4eHNZNW5BUEwwbVEraUxsbGRkUlc2ejF1a0htbytuNXBRV2J4aFFDSCtJ?=
 =?utf-8?B?YzVtdUh6WFNSYWNJTzN4MFF5emZhYUZjdHBCMm1hSWJhVVpJSWlTZzRWMjI4?=
 =?utf-8?B?djBOYVJPUkhKZEFYOUpud1pwRHZYeXgyY2l4b1hNRnNXTUJzVjh6S3hXUHoy?=
 =?utf-8?B?MzNZUU14OFJGdHppcmV0cHl4TXRWWk5ZSWE1K2d0UlhMM2ZiV2dicWVJdE1I?=
 =?utf-8?B?RW9KS0Q3cUc4QndJT0FCbEl5QSt6RHN2amVaTlcxbzVvZnhBMUNmZmx0VVYx?=
 =?utf-8?B?K1V1SnBvR2FFd1dWU0FGUENBVFc2M1U0TXNOcTFYaEVyS1l6WkpQNFdZeGQw?=
 =?utf-8?B?Uk9jSHJnQ25WTHNGdVJDK3ZEa0ZqSGgrV0pCODJya0pHVVdrYWI4bDExSTAr?=
 =?utf-8?B?STZjbTA5QVhJWnBPMnVEajVUTEp0Qm85MGlZSStTL29FVUEzNVdzNWtIdk5m?=
 =?utf-8?B?KzNQT1E2QmZjTFYvRXczaE1RRURUdHJveUFrN2tmUmhrSUVTb0JzdXluYWZO?=
 =?utf-8?B?T1lQdlZKNU1HNFlWYkI5UmUyMHRxR01FOWxHUTViQUNmMDJ6SHBBbjZXM2hN?=
 =?utf-8?B?dFE2M0FnbnVjVm9keHpERTU3UVZzZXVoNDhITng5TFlNaElTS0JFd29nazZ4?=
 =?utf-8?B?ODVnbTN1SUtLdkhZMVpiTFlLKzlYQUNNUjIrSlpyTGcrdVIzT1QyL2QyQm5n?=
 =?utf-8?B?ZHRJSlhILy9Ea0UwWXlqMTZsazFoZ0ltNENJeUJuTmhLQzZqOHVqcGErdzY2?=
 =?utf-8?B?ZjM4RHVYVFA4MkdEKzMvTzBLSU1TRHdiQmFhd2dzZHo5MG9WcUQ2QUFKWUk2?=
 =?utf-8?B?SFhEalFRSkJmM09ERW5MNFc1ZmhYWFFZQW8xcDJ0UDVPSnJQR0pYYVRuaVdV?=
 =?utf-8?B?RENTeEFqbWV0VXhhOGs5VEZ0SDQ1RXo1MlJqOGZlQXZDcnhuRWZSakROU2JJ?=
 =?utf-8?B?SlgvWE5lSzNUTy9ZVU9MYTlIZ2c3cVowSGFJdWhnYSszMGdvQmVLaklsT0NP?=
 =?utf-8?B?T00vVFBDdWppZjhDQUJ0RjVFQ01VY0xIcjNCZ3h4UTFJbjVpOFdNTjF1dVo4?=
 =?utf-8?Q?BzgpkpEVPcDkMUZdi+rSQPo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB31B45FCE21DD4CA2A3D1B122CADA3F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e7b817-88f8-4121-3d01-08dcc6e817cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 22:32:11.3475 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0iR+RyDkLCnlchRPc2G4fhP+ohhKIGZobqZgQSjGqri3Ls1Ci89YhkLqZOhbw9W8yPO2ZHt5dYTsYnTwMC5q9kUExigfMnsLOqsob40qz8gN7VU330vpYcqoJHVa/HNY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7256
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

T24gVHVlLCAyMDI0LTA4LTI3IGF0IDE0OjQ3IC0wNzAwLCBaaGFuanVuIERvbmcgd3JvdGU6Cj4g
TW92ZSB4ZV9scmNfc25hcHNob3Qgc3RydWN0dXJlIGRlZmluZSB0byBoZWFkZXIgZmlsZSwgR3VD
IGNhcHR1cmUKPiBmZWF0dXJlCj4gbmVlZCB0byBhY2Nlc3Mgc3RydWN0dXJlIGZpZWxkcy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBaaGFuanVuIERvbmcgPHpoYW5qdW4uZG9uZ0BpbnRlbC5jb20+Cj4g
LS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmPCoMKgwqDCoMKgwqAgfCAxOCAtLS0t
LS0tLS0tLS0tLS0tLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmNfdHlwZXMuaCB8IDE4
ICsrKysrKysrKysrKysrKysrLQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCsp
LCAxOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2xyYy5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmMKPiBpbmRleCBhZWM3ZGIzOWMw
NjEuLjUyZjhkMjAyZTI2MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbHJj
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmMKPiBAQCAtMzgsMjQgKzM4LDYg
QEAKPiDCoAo+IMKgI2RlZmluZSBMUkNfSU5ESVJFQ1RfUklOR19TVEFURV9TSVpFwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoFNaXzRLCj4gwqAKPiAtc3RydWN0IHhlX2xyY19zbmFwc2hvdCB7Cj4gLcKg
wqDCoMKgwqDCoMKgc3RydWN0IHhlX2JvICpscmNfYm87Cj4gLcKgwqDCoMKgwqDCoMKgdm9pZCAq
bHJjX3NuYXBzaG90Owo+IC3CoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcgbHJjX3NpemUsIGxy
Y19vZmZzZXQ7Cj4gLQo+IC3CoMKgwqDCoMKgwqDCoHUzMiBjb250ZXh0X2Rlc2M7Cj4gLcKgwqDC
oMKgwqDCoMKgdTMyIGluZGlyZWN0X2NvbnRleHRfZGVzYzsKPiAtwqDCoMKgwqDCoMKgwqB1MzIg
aGVhZDsKPiAtwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqB1MzIgaW50ZXJuYWw7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHUz
MiBtZW1vcnk7Cj4gLcKgwqDCoMKgwqDCoMKgfSB0YWlsOwo+IC3CoMKgwqDCoMKgwqDCoHUzMiBz
dGFydF9zZXFubzsKPiAtwqDCoMKgwqDCoMKgwqB1MzIgc2Vxbm87Cj4gLcKgwqDCoMKgwqDCoMKg
dTMyIGN0eF90aW1lc3RhbXA7Cj4gLcKgwqDCoMKgwqDCoMKgdTMyIGN0eF9qb2JfdGltZXN0YW1w
Owo+IC19Owo+IC0KPiDCoHN0YXRpYyBzdHJ1Y3QgeGVfZGV2aWNlICoKPiDCoGxyY190b194ZShz
dHJ1Y3QgeGVfbHJjICpscmMpCj4gwqB7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9scmNfdHlwZXMuaAo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyY190eXBlcy5oCj4g
aW5kZXggNzFlY2I0NTNmODExLi4wMTFkNDYwN2U1ODUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2xyY190eXBlcy5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xy
Y190eXBlcy5oCj4gQEAgLTU1LDYgKzU1LDIyIEBAIHN0cnVjdCB4ZV9scmMgewo+IMKgwqDCoMKg
wqDCoMKgwqB1MzIgY3R4X3RpbWVzdGFtcDsKPiDCoH07Cj4gwqAKPiAtc3RydWN0IHhlX2xyY19z
bmFwc2hvdDsKPiArc3RydWN0IHhlX2xyY19zbmFwc2hvdCB7Cj4gK8KgwqDCoMKgwqDCoMKgc3Ry
dWN0IHhlX2JvICpscmNfYm87Cj4gK8KgwqDCoMKgwqDCoMKgdm9pZCAqbHJjX3NuYXBzaG90Owo+
ICvCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcgbHJjX3NpemUsIGxyY19vZmZzZXQ7Cj4gKwo+
ICvCoMKgwqDCoMKgwqDCoHUzMiBjb250ZXh0X2Rlc2M7Cj4gK8KgwqDCoMKgwqDCoMKgdTMyIGlu
ZGlyZWN0X2NvbnRleHRfZGVzYzsKPiArwqDCoMKgwqDCoMKgwqB1MzIgaGVhZDsKPiArwqDCoMKg
wqDCoMKgwqBzdHJ1Y3Qgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1MzIgaW50
ZXJuYWw7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHUzMiBtZW1vcnk7Cj4gK8Kg
wqDCoMKgwqDCoMKgfSB0YWlsOwo+ICvCoMKgwqDCoMKgwqDCoHUzMiBzdGFydF9zZXFubzsKPiAr
wqDCoMKgwqDCoMKgwqB1MzIgc2Vxbm87Cj4gK8KgwqDCoMKgwqDCoMKgdTMyIGN0eF90aW1lc3Rh
bXA7Cj4gK8KgwqDCoMKgwqDCoMKgdTMyIGN0eF9qb2JfdGltZXN0YW1wOwo+ICt9Owo+IMKgCj4g
wqAjZW5kaWYKYWxhbjogcmVwZWF0aW5nIGZyb20gdjE2OiBhbGFuOiBpIGJlbGlldmUgaXQncyBu
b3QgYWNjZXB0YWJsZSB0byBtYWtlCnRoaXMgcGF0Y2ggY2hhbmdlcyBpbmRlcGVuZGFudCBvZiB3
aGVyZSB0aGUgY2hhbmdlcyBpcyBiZWluZyB1c2VkLgpGcm9tIHdoYXQgaSByZWNhbGwgZnJvbSBv
dXIgY29uZi1jYWxsIHJldmlldyBsYXN0IHdlZWssIHRoaXMgY2hhbmdlIGlzCm5lZWRlZCBieSBw
YXRjaCAjNy4gVGhhdCBzYWlkLCBpIGFtIHByb3ZpZGluZyBhIGNvbmRpdGlvbmFsIHJiIHdpdGgg
dGhlCmNvbmRpdGlvbiB0aGF0IHRoaXMgcGF0Y2ggbmVlZHMgdG8gYmUgc3F1YXNoZWQgd2l0aCBw
YXRjaCAjNyAoaS5lLiB0aGUKcGF0Y2ggdGl0bGVkICJkcm0veGUvZ3VjOiBQbHVtYiBHdUMtY2Fw
dHVyZSBpbnRvIGRldiBjb3JlZHVtcCIpOgoKUmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFu
LnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPgo=
