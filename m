Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E37E6BF30
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 18:20:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F5D10E16B;
	Fri, 30 Jan 2026 18:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dix/wm/Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1C310E16B
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 18:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769797214; x=1801333214;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P82jYsuXGvl3Ui5MUgVrBo92M0bk7vJXc96my+PmhSc=;
 b=Dix/wm/QI244qxz1w/pamq2BCXdZJjIkuJfsqKv8K3Jm9t7kfwqUdFcS
 fkjnbB3sp+AAvsl9IXIXVOaQ7+0AeL1gxbhCZptsfF9AcWi+QkQs4ts5V
 Leic8adUP7SZNWCc3f7yOQQI6u4jCBL5i8EOIUXYiFIUy/hjg+GoDKeDp
 zAo0pcuwybCb7jFaTnXp1LXkiryIg0WtgYa2JCF2Jja1mgHBjAswOE760
 +W7InFYwGExbXTZvkfpf1U8Ix2kj/PNI261LXkGexLv0KKfFajQZBob+p
 PMKaC4prVYpikfDX7hU7RKBYEkux3T7/Noul4D1pkRZZIS7I8DDFsbi2x Q==;
X-CSE-ConnectionGUID: TSZyutkAQxiRhNiBg6UNWg==
X-CSE-MsgGUID: rRuWXw2XRwi4c5ksMd589A==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70949696"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="70949696"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 10:20:14 -0800
X-CSE-ConnectionGUID: vW1eipxlSgqmHQ4R/YX/bg==
X-CSE-MsgGUID: sv+0G3O+RKuzEs3uCXTUaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="209267176"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 10:20:13 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 10:20:12 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 10:20:12 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 10:20:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M29WIsRiSiSpjXcsG5mMTKgW73vFsqVTMW4V0Ppvo8oMQ+FM215RzwnLbhhmXP1aYMWT1TnM0bmXqBUZACCaXyYt5OYtpTIll5ZriBoFNKuXm+G11qkiQy9UoRnxAmQ6amzD/tJwCwD8Cwyt0jMMjkp3FEBS917SNbhjuxjvR8vlN2Ru181CIcSjJx94UuT1ZiQHLzwAIoHAxCQz7lBPr6K2URy0l8nqTmMZ2YF/tuLC/ar28vHwd64kjjRsjgBR3I1k0AGjK9oPePVbjQpkPR0iGMYwUwhrJvyRlO5q5XpBgzX6XSEJuHaadHMq169gaCSDqaJV6n+OmjE4SFV6kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P82jYsuXGvl3Ui5MUgVrBo92M0bk7vJXc96my+PmhSc=;
 b=NW9vnr7cKYmwCWbl2IfF3OFjcUu11SJ9xBAlnokgbHtpe2r8qbvQuzDl1GwW0N7gZVeLScAEMbTd7C6aQe2140HehFwdu6Nk/1QHw6RG1Z+Oluwxxi0BBNy9spnXFP4guFPrspEbrV+H80zIdKsrXCuM94Xedqz7RRfZxr9gKRVgH65nvUWG+xn+CvyuyiOtArbtF2AdDDPvdkHMAds82BEPkpkkESGsOzn88+dYGBdR+gG7fTfd2f1Vps0EE3RF/m8PcxppyQ2b6GCFEy5pHbNKd+QYwrjt9yOCz3HHBDYcyYnpOHg9sp40k88mVDOI3jFgoq/m2S9imcKSrrTI6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DS0PR11MB6351.namprd11.prod.outlook.com (2603:10b6:8:cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 18:20:08 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 18:20:08 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Piorkowski, Piotr"
 <piotr.piorkowski@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH v1] drm/xe/vf: Avoid reading media version when media GT
 is disabled
Thread-Topic: [PATCH v1] drm/xe/vf: Avoid reading media version when media GT
 is disabled
Thread-Index: AQHckgD3++o9hlVMi02ew0ACiD5r7bVq/4MQgAAEq0A=
Date: Fri, 30 Jan 2026 18:20:08 +0000
Message-ID: <DM4PR11MB54566BB2DC2FE8DB2BE2609CEA9FA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260130155522.2738547-1-piotr.piorkowski@intel.com>
 <DM4PR11MB5456EABC995F7621BE2AEB76EA9FA@DM4PR11MB5456.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB5456EABC995F7621BE2AEB76EA9FA@DM4PR11MB5456.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DS0PR11MB6351:EE_
x-ms-office365-filtering-correlation-id: d81ba3f6-dfa4-4d31-69f6-08de602c32f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?YnBhc0JNazNTTjBjZ1VIVG1lNTlRWWYrdXduRHZpcFZYNnRKR3RZVm1wYjkz?=
 =?utf-8?B?T0ZtY3hFU083dUdCS3dYT0JCc2xGcVk0NGE2RGZoLzZyVnJyTVZwTzNka0NY?=
 =?utf-8?B?Z2NtdDU3a0V6RTZJbnVyV1ZkbktCd2hOM29UeDU5V0Zmd1dxUFQ1Ui96ZkJy?=
 =?utf-8?B?M0dZTVdIZ2F5SWRQK1IyNUdJVDc2V2hJK21adlZOcHBCOEloYWJiTHZFTWhG?=
 =?utf-8?B?M3pTSWVvbXpFVW1UT1M2NnNxdXRTbUV6ZXN0R2p5MnpDOCtHaW1LY09iNkU0?=
 =?utf-8?B?K0FodHJPS3NRemtBUjVNZ2I1alpNUURyTXRPOGtyeDJvcGdwL1haN2NtYmo5?=
 =?utf-8?B?ZEErTi9ZMS9nQm9NRW9JdWplaGVWTzU0YUQvbWozenk2MG5peStEcVJGcWFV?=
 =?utf-8?B?bWxhSlY3bHlyekxLRlNiWXJiUlA2UTNPK0FvL0FQejJSY2tVTTFQNXBCV01L?=
 =?utf-8?B?bXJEL294alNkb1g2QmZjcFR6aDkybldUeUxHMFhtUTAvZHVIZ0lRTnNXNDF1?=
 =?utf-8?B?SkYwS1o4NGl5MUFMOTN2SUh1UkhaQ0J0V04ybHJGTCtaNzdCYkZDZ0NBYXdG?=
 =?utf-8?B?d0RsNUNoUjRyTzJ4eWQzZm8yQ2dTTlcrRHhSQ1BhWHZLZXYxcm1VcFozT1li?=
 =?utf-8?B?c1dpc3NFV243bzlNTUJ3MmlNaFErOFRIT3lSajJQSFlleVFhQnI1WEFSUE5V?=
 =?utf-8?B?RUQrRkswM1UrSVJqSzEySkxkZlJKZEtGRHdNZHo4czRQWGZmOTU1TXBoMDA1?=
 =?utf-8?B?M3liOVQ5akdDNk1hSUFGdGEvcGQxZDVkeHJVaEZXMmlzMWZscXFBek9WcHNu?=
 =?utf-8?B?ejl6WFN0eDFpd0lldXlHakg2anVobkFtVU96bXJSRXZ6N1lQYmdZN1JxSmdV?=
 =?utf-8?B?dENyekhGU0MrS2NrT3U1Y0FQNEs0VWxsYnVabWlpZGk0RUtRaDZtd096WkZ2?=
 =?utf-8?B?SDNqNndMU0pQT05TTVNDNWRCRkFkZVhsa0RlUHVtdDZKVlg3RWhyMm9FbGJu?=
 =?utf-8?B?Qm9rWnlURXFWaTcvOWpqV3IvVnI5bWRkSzU1ZURHRzlqWGRURGdYdWFRMDhy?=
 =?utf-8?B?aG1PdmdXRnYwWEhja3d5bnN3UG5zSHRscXo0S1RHODVNdzBXQXBteVVLUlVC?=
 =?utf-8?B?N3BydkpmcXQzcG91Mkd0TURtUU1VQStOZlpKNG5Pb3dqWkZoM1dJSFBreWJO?=
 =?utf-8?B?cjVSUmVVcy8xandtd2RCdERXL3g1alZuMnp2SGoxWTlPR0dvY0dneWJyRXdK?=
 =?utf-8?B?SmlzaWkvcE5SZ1JvYUlWYjlPT2hjdmpMMzA2RjNmbzZZb0RCOGFiYk9uSWlL?=
 =?utf-8?B?WTF3bU1zbHJSdnBremcvN1I4ZnI2d3ovaXZBRUpubmZvVE9rVGIvbWJ2bUpQ?=
 =?utf-8?B?NlhSTTBZbFlFOHVmSFFLdHdORFFSU1Npek1SdGNxa0c4ZjV0dHpYbEYrY3Y5?=
 =?utf-8?B?VFdGSEJ2YUZCOE15Q0QrZzEzSG1ORkM3ZkV4Z3pXbk5mNERqdHRXUzUwS0kz?=
 =?utf-8?B?NmpqVUxsSzI5cHdPYzQyRWVwWms5WEkrZU5iVXAxRWtCN3ErczNFUzlQcldJ?=
 =?utf-8?B?UWFCRlc1aklvbGVCUnhxcFdSQXQzRFlIb3BEeTFFMDA4L25ZUWp3U2dScXNX?=
 =?utf-8?B?a201N0lqZWhFLzJKSkFwcVRnL0xndEJ0MjNRcWtKclEyM3paVGZIak5YNWFG?=
 =?utf-8?B?MXNBSVZrVDJYVW5TUTJJTERuTmFZR3cvZHNGZ0VoTUpma1EwNzZpSnpNS3BC?=
 =?utf-8?B?VjlPTmlJMlE5NkJRdTc4RGdZRE5MSlpkM2M5MW0rNWFQcDRMSXh3UGhGM0lj?=
 =?utf-8?B?amd1dk41b0ZTbDBxL0tKdFhDWC9NQzIwNUxDSm9BR2M2d0RwR1JveE1MSnB6?=
 =?utf-8?B?ZUxCWjd2d215ZUlqM3pjdGJhbzNTdG9TM2tzdW1oekZtZ3NtN1c0YWN3UHBX?=
 =?utf-8?B?T2pkSkVCb2kvVEdDeWFyUlJNeis1VmJwY1JrUW1JQUlKRzlJNFBuL2toTlZm?=
 =?utf-8?B?S2c5bVg5Z1lpRktEeHVEVkRtcjJYemZXblk4aEJRbjVJZlN6M1hHdlFmYlJI?=
 =?utf-8?B?UkV6Rmo3V3N4MmtFak9nOTIyTFphdHV5Qm9PRTVxL0J4Uk5Fd3dwRFdzYWk5?=
 =?utf-8?B?RGVOTHg4aVY2SE5mNFp5TTMrcm1GRGhsNWRvaFV2ODhqbTZ5aTZZUldIeDJp?=
 =?utf-8?Q?XYdm7k3q8WX63TLrc9vuZR8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3JvOER6UnIzRSt1Y2kwenN6bHpidlA5OExQb2RJUXoxOWlnODNPZHBjZy9i?=
 =?utf-8?B?WmRCMm9oVnRSTG9YRVNKTlJGNkFTZzBSWWl2WCtWQlNGWkFvR29heXBHSzBR?=
 =?utf-8?B?RGlzVmI2dVJFazZya3NhRG1PNVBVdTZrN1dzUTdPcnRDUHdvMjc5MkJSOUE0?=
 =?utf-8?B?bVlLOUZ0aytVMC9xaFhSNlA3M0YwRlNSR3I0SHdUalR5Z1huL250b1dBUnpU?=
 =?utf-8?B?ZjN1dnI5VnNjOFNSWGVXby9qb1lwMzhxbFYxMTBpNlczaXd3V3pNc0RHNExR?=
 =?utf-8?B?RjlUVk8yZkVIUGR0bzl0VzdkUjMzUEs1VnRmWnJBREFSc3dsTG5aSlkrbmhE?=
 =?utf-8?B?eDhsY2oyYXNPbmFqZ0phcWcxYUFPb0tIbUg0S3l2aSs4L3VCWEhBNlg4eDlO?=
 =?utf-8?B?ckEreU9oSU1zdTZpaXFXMlBHaVpVcWw5NWRIanRnT2dKa0tveDhCdTdueE1Z?=
 =?utf-8?B?amg4VTZVSEVjenErSWRGRUpoeDNUS2lCVXV2cDN3ZzhabnVtcWEyQzdaMTRh?=
 =?utf-8?B?Z2YvTThLdGhURTF5YmVRRXRuc3h5elAweC9YejJjUCtHUjZlWlNaSFowaDl2?=
 =?utf-8?B?d09VZ2J5c1lET1krMUpzS0wzQ3RYMEgxaDFPVG5yeU94emZBSGNWUlBRKzhW?=
 =?utf-8?B?SDdCVXBVNlNIbUI5VnE3L3RjaUlleTZCQ2p5UTN1djNSemJabWR6YUh5di9w?=
 =?utf-8?B?SHQ2S2V0eGV4UkhlZlgxdnZ0SW5TeXViNFFoNVdsVUg5UTZGUTBjV09NWXJE?=
 =?utf-8?B?QmNnRXlVdEhOT2w2YVhDTmM0MUR0amlxL1M0NHg3di96MFFSY3lseGVkblpZ?=
 =?utf-8?B?aXk0VGJMcENWbkV0ZDFCb2pqZWpKV3AwbnlpbEcxY2pwcGdPTFBqemJQV3lw?=
 =?utf-8?B?VlQ0a0M3WEtOZUMyaHZGME5za0FSRGxDbmowQXNYOXJDem01a2hOTE8vUGQ4?=
 =?utf-8?B?K3BNcTZxMkFTS3NGOUhCakxKSDZ3K2NjODJmWTJreCtFaUFHaU0vaW10MEx6?=
 =?utf-8?B?K01VRzU2TDZjTHhoTERCYnEyTEEvUVZZdDNPaks5YzZJZEI5YjhwbFJlcTlz?=
 =?utf-8?B?eVFqMmc4MXdXMjRqSDMxQ0p4R2VOSVkyZVArWFI5TStFMDdTRXVOckwxSkdh?=
 =?utf-8?B?Yk85Q0tzOGF6bGpUbmV1WHloeDJXdzF1cVR4TmEwcFJQSVZjUUMvclg0dmQr?=
 =?utf-8?B?K0hUNVNmLzZHN3N2TkovZ0kweHFTRXczWWRUTFI0YVdPWExidWNITnAwTC9o?=
 =?utf-8?B?cHVJcUdma1pJaGlPek1Id0ZSNlI2c29KZjc5MytEWXVBZnhpZFdjQ3hLVWxp?=
 =?utf-8?B?ajVUYlU5YmlTL2hRaVpoRlJ6a05qb04zWkRnV3ZrS2d1d3BKdUt5OVlFRnMz?=
 =?utf-8?B?WWNBQmlnVzZHaFZqRFFCNzY3amdoTEtPMFNXSnoyandkd3hlQzh1WHZIRDJS?=
 =?utf-8?B?dmpNY1A3eFFvNXBISEQ0dkY2dzRDcTQyamU3TmxqenFUenlkUzFWL0lWLzNO?=
 =?utf-8?B?VnZnUFplVmdwajA3MlNlWG1JUWwxcEVBUHhLZEVMc3k1WVhDUHZBYnJoZU5l?=
 =?utf-8?B?bFVGNDdtRjVxWmYvdS9VZnFXUUxFMFhUMkNmVDdEZC9BTVhjZEVWZUE1cm96?=
 =?utf-8?B?K0htZFZuVGJraTBGVSs2QWErTzcxVk5kbTZsajJiZ0labkNqTWxnM0dOYXI5?=
 =?utf-8?B?TGgxelhwdXBNWHFvUUlqbUd4NFZyTEEzT1BQWTF6K3poVUtxaXdsZXMyY1Qv?=
 =?utf-8?B?bGxnSGJoWTFYY2QxV1lLVXE1TmxJWlJWeVNnVjVCS3ppZ1BEL3dzZEErUjNI?=
 =?utf-8?B?RWFUQlEwVkpuaVorSERuclJMSHJYenVsbGNDZ0pEUVJWR2hLbURmblBFK3FS?=
 =?utf-8?B?b3U0Vnczb1RzK1M4Z1hBOExpbmZQYlBMcGYvdzZ0YkpDeDFkblkxMUJXbUs5?=
 =?utf-8?B?aXlXN25BNVFwMzBGZG9YWjFmL2ZCelRNaGw3aVo2Z1FWQlpzdkdIQkMyUzJY?=
 =?utf-8?B?NXBTNVFTd01nOStpZmFkcXBFb2pGQzlkRUVHd3F3TDcwVWRDVTJTcGZQVGoz?=
 =?utf-8?B?REJBVk9sRjZPTFhNL3NuaUlrTjhXcXhUUGQvRHFyTWdWN0piYXhac0syUW4z?=
 =?utf-8?B?MU4ra2NFdmRpanVtbTdzVHM5d0pBMHdUWGhaUlVSbmFKa1NCb2RESGFGNkRl?=
 =?utf-8?B?N0hoZHRJa05abVJlY1NBTG43OXc5Ylk3T1FTZDBGMlhJOGdlZ3N4V3ZKSTd6?=
 =?utf-8?B?UUFnR2dIL2NJTGVVN29jUXB6QjlnVU5SMHBvUU1lRlN6NWgvLzZBWHpTWXBE?=
 =?utf-8?B?NnJwdUxNdWJMNFlyUUU2bnkzMlU2aDVEbUFTeWpsSWRHS2VNN01MWmpFUHU2?=
 =?utf-8?Q?GjqPc2VZ8vdr1Qnom/03A+A8a3CGJsGCmnav5Pennyc1t?=
x-ms-exchange-antispam-messagedata-1: 9TBaCr8RStmdlg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d81ba3f6-dfa4-4d31-69f6-08de602c32f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 18:20:08.2224 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O+oEgcbi95/BPAjrZlxZaiTSO1Yhs+kwcmRdq7b0KssPXC0XwZ/rMBGcoj6gYGcpx+tHcZp4DWJCshCOoPJdrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6351
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

T24gRnJpLCBKYW4gMzAsIDIwMjYgMTA6MDkgQU0gU2h1aWNoZW5nIExpbiB3cm90ZToNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVsLXhlLWJvdW5j
ZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTGluLA0KPiBTaHVpY2hlbmcN
Cj4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDMwLCAyMDI2IDEwOjA5IEFNDQo+IFRvOiBQaW9ya293
c2tpLCBQaW90ciA8cGlvdHIucGlvcmtvd3NraUBpbnRlbC5jb20+OyBpbnRlbC0NCj4geGVAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBQaW9ya293c2tpLCBQaW90ciA8cGlvdHIucGlvcmtv
d3NraUBpbnRlbC5jb20+OyBSb3BlciwgTWF0dGhldyBEDQo+IDxtYXR0aGV3LmQucm9wZXJAaW50
ZWwuY29tPjsgV2FqZGVjemtvLCBNaWNoYWwNCj4gPE1pY2hhbC5XYWpkZWN6a29AaW50ZWwuY29t
Pg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIHYxXSBkcm0veGUvdmY6IEF2b2lkIHJlYWRpbmcgbWVk
aWEgdmVyc2lvbiB3aGVuIG1lZGlhDQo+IEdUIGlzIGRpc2FibGVkDQo+IA0KPiBPbiBGcmksIEph
biAzMCwgMjAyNiA3OjU1IEFNIFBpb3RyIFBpw7Nya293c2tpIHdyb3RlOg0KPiA+IFN1YmplY3Q6
IFtQQVRDSCB2MV0gZHJtL3hlL3ZmOiBBdm9pZCByZWFkaW5nIG1lZGlhIHZlcnNpb24gd2hlbiBt
ZWRpYQ0KPiA+IEdUIGlzIGRpc2FibGVkDQo+IA0KPiBUaGUgY2hhbmdlIGFsc28gYWZmZWN0cyBw
ZiwgbWF5YmUgZHJvcCB2ZiBpbiB0aGUgdGl0bGU/DQo+IA0KPiA+DQo+ID4gRnJvbTogUGlvdHIg
UGnDs3Jrb3dza2kgPHBpb3RyLnBpb3Jrb3dza2lAaW50ZWwuY29tPg0KPiA+DQo+ID4gV2hlbiB0
aGUgbWVkaWEgR1QgaXMgbm90IGFsbG93ZWQsIGEgVkYgbXVzdCBub3QgYXR0ZW1wdCB0byByZWFk
IHRoZQ0KPiA+IG1lZGlhIHZlcnNpb24gZnJvbSB0aGUgR3VDLiBUaGUgR3VDIG1heSBub3QgYmUg
bG9hZGVkLCBhbmQgYW55IGF0dGVtcHQNCj4gPiB0byBjb21tdW5pY2F0ZSB3aXRoIGl0IHdvdWxk
IHJlc3VsdCBpbiBhIHRpbWVvdXQgYW5kIGEgVkYgcHJvYmUgZmFpbHVyZToNCj4gPg0KPiA+ICgu
Li4pDQo+ID4gWyAxOTEyLjQwNjA0Nl0geGUgMDAwMDowMTowMC4xOiBbZHJtXSAqRVJST1IqIFRp
bGUwOiBHVDE6IEd1QyBtbWlvDQo+ID4gcmVxdWVzdCAweDU1MDc6IG5vIHJlcGx5IDB4NTUwNyBb
IDE5MTIuNDA3Mjc3XSB4ZSAwMDAwOjAxOjAwLjE6IFtkcm1dDQo+ID4gKkVSUk9SKiBUaWxlMDog
R1QxOiBbR1VDIENPTU1VTklDQVRJT05dIE1NSU8gc2VuZCBmYWlsZWQgKC0NCj4gPiBFVElNRURP
VVQpIFsgMTkxMi40MDg2ODldIHhlIDAwMDA6MDE6MDAuMTogW2RybV0gKkVSUk9SKiBWRjogVGls
ZTA6DQo+ID4gR1QxOiBGYWlsZWQgdG8gcmVzZXQgR3VDIHN0YXRlICgtRVRJTUVET1VUKSBbIDE5
MTIuNDEzOTg2XSB4ZQ0KPiA+IDAwMDA6MDE6MDAuMTogcHJvYmUgd2l0aCBkcml2ZXIgeGUgZmFp
bGVkIHdpdGggZXJyb3IgLTExMA0KPiA+DQo+ID4gTGV0J3Mgc2tpcCByZWFkaW5nIHRoZSBtZWRp
YSB2ZXJzaW9uIGZvciBWRnMgd2hlbiB0aGUgbWVkaWEgR1QgaXMgbm90DQo+IGFsbG93ZWQuDQo+
ID4NCj4gPiBGaXhlczogN2FiZDY5Mjc4YmI1ICgiZHJtL3hlL2NvbmZpZ2ZzOiBBZGQgYXR0cmli
dXRlIHRvIGRpc2FibGUgR1QNCj4gPiB0eXBlcyIpDQo+ID4gU2lnbmVkLW9mZi1ieTogUGlvdHIg
UGnDs3Jrb3dza2kgPHBpb3RyLnBpb3Jrb3dza2lAaW50ZWwuY29tPg0KPiA+IENjOiBNYXR0IFJv
cGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiA+IENjOiBNaWNoYWwgV2FqZGVjemtv
IDxtaWNoYWwud2FqZGVjemtvQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3BjaS5jIHwgNCArKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMNCj4gPiBpbmRleCBiNWU4OTM1ZmZmMWQuLjZh
YzFiYWFiYWI0ZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMNCj4gPiBAQCAtNjQ0LDYgKzY0
NCwxMCBAQCBzdGF0aWMgaW50IGhhbmRsZV9nbWRpZChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4g
PiAgCQkJdmVyIC8gMTAwLCB2ZXIgJSAxMDApOw0KPiA+ICAJfQ0KPiA+DQo+ID4gKwkvKiBEb24n
dCB0cnkgcmVhZCBtZWRpYSB2ZXIgaWYgbWVkaWEgR1QgaXMgbm90IGFsbG93ZWQgKi8NCj4gDQo+
IE5pdDogInRyeSByZWFkIiBzaG91bGQgYmUgInRyeSB0byByZWFkIi4NCj4gDQo+ID4gKwlpZiAo
IXhlX2NvbmZpZ2ZzX21lZGlhX2d0X2FsbG93ZWQodG9fcGNpX2Rldih4ZS0+ZHJtLmRldikpKQ0K
PiA+ICsJCXJldHVybiAwOw0KPiA+ICsNCj4gDQo+IEkgYW0gY3VyaW91cyBpZiBwcmltYXJ5IGd0
IGlzIGRpc2FibGVkLCB3aWxsIGl0IGFsc28gaGF2ZSBzaW1pbGFyIGlzc3VlPw0KPiBJZiBub3Qs
IHdoYXQgY2F1c2UgdGhlIGRpZmZlcmVuY2U/DQo+IFRoYW5rcy4NCg0KSSBzaG91bGQgdHJ5IGl0
IGZpcnN0Lg0KUHJpbWFyeSBndCBjYW5ub3QgYmUgZGlzYWJsZWQgY3VycmVudGx5Lg0KIg0KWzQ5
MzY1LjM4OTY5Ml0geGUgMDAwMDowMzowMC4wOiBbZHJtXSBQcmltYXJ5IEdUIGRpc2FibGVkIHZp
YSBjb25maWdmcw0KWzQ5MzY1LjM4OTY5NV0geGUgMDAwMDowMzowMC4wOiBbZHJtXSAqRVJST1Iq
IENhbm5vdCBwcm9iZSBkZXZpY2Ugd2l0aCB3aXRob3V0IGEgcHJpbWFyeSBHVA0KIg0KDQpTaHVp
Y2hlbmcNCg0KPiANCj4gU2h1aWNoZW5nDQo+IA0KPiA+ICAJcmV0ID0gcmVhZF9nbWRpZCh4ZSwg
R01ESURfTUVESUEsICZ2ZXIsIG1lZGlhX3JldmlkKTsNCj4gPiAgCWlmIChyZXQpDQo+ID4gIAkJ
cmV0dXJuIHJldDsNCj4gPiAtLQ0KPiA+IDIuMzQuMQ0KDQo=
