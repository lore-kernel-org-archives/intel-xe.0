Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF971C83F22
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 18:54:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B78810E2D0;
	Wed, 16 Jul 2025 18:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EUic1iZX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E1910E2D0
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 18:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752692076; x=1784228076;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Dxl54Df++qRNlIiRsVJ1j5ruujHJHX5GWR2RRT1ej94=;
 b=EUic1iZXQvWM7FuxkMfq9zII5RpzLogRuVKBPflF9QE9Z7ceczjKGb0G
 MM92++lcQIR5H8+Q06HncJgzizJzs3YaBOQhM4B7TGKE1qV9B3W9ktFLb
 dxEVVGYeR+m8T5movv/T0IUfrimyKNKcZjiU7Dm9N3rafV3BOK8Qnia6G
 fVgG4t8nMRzZNiaioXXufIEMhL0q/pjpFjMoyDYP2tSUVBd8107QZ+Zf8
 Qy7AXYsCDWxfuaZFQOYhmk6du87dZdibUYQUs0bC+jaiTWLcbwT/WEC2G
 dTBHVRtu3SjjYaYyTlcvjs5di94MCTW+ncFY/nnDeIyrTak87fROtnMwz A==;
X-CSE-ConnectionGUID: FrNg5Y3kRHq6Z7A8/47bNw==
X-CSE-MsgGUID: gxwFd9dVQpmmSJNKJq4V2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54664086"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="54664086"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 11:54:36 -0700
X-CSE-ConnectionGUID: gbmeAqAkRJy/zfJ1yUEB7w==
X-CSE-MsgGUID: q2nQtTM0QZyiebBu/bP3rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="194717760"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 11:54:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 11:54:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 16 Jul 2025 11:54:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 11:54:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f37WjJIIDreQFOpwwJgmQbnnvfKcG0bi4IctCMv2PjCqDU2kynJb0WfY/rNSugxB66TbknPjb7+ySYIAeA92f9Yc0GgxJp+cBg39oZ4zk/9xWffWF/P64t4eSOKIt79tHJ9gmgxiYBOqor6YQ8E38njcvymd7tarAiUAZAnBThhFFwak3IYhPQFmMoVHpg+ycYzEWXIxDhvL1nm/hibLAAclu1A2C7SxIToiIBZA0DpYIfGjw4d8QL91S6r9xElWij9pUUoMfyBFG5VL3kWZoatKPiXstgae/4YHpmeKpzbAeiJE5Y+wS5iPXJIX7cOmorCsfYI2yEwG4bF36QaZyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7/Sv6mAExPdf32IKWS9hEXZtj1o1S4GzfS4mYhozH0=;
 b=SFjrRsh+qNHWSHPJUln8xpt8PqFjkaiKP9yMdW3WJBb+sHvejfenMQXqt4/nbWE02YZZ2HYbpn33TTNgu30uNhAMseVl/1/Pd+Xle3t6xUpCiCazlU8e+8Lg61JJeq4WLnhMGZDwU5JSYASVHyGIbvJML/escrhloMpiyEjWE4Ib03gITlAUpjlCHtFjUucdZSTOm7hwOtdCNxSK2OvhzKMRGPuBAF9dH839tKmElKdnRT6R3hCC7781CSNBlq8mTHheIWdRaKfcsCATjUmdYtwAdOX3bYIv2mceYhpWWLqzFWdNXwmXd/+x0KfiP0apxX4belc2JImvR8rBUqUERg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CYXPR11MB8731.namprd11.prod.outlook.com (2603:10b6:930:db::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.24; Wed, 16 Jul 2025 18:54:16 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 18:54:16 +0000
Date: Wed, 16 Jul 2025 20:54:12 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?utf-8?Q?Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v6 8/9] drm/xe/vf: Refresh utilization buffer during
 migration recovery
Message-ID: <vl7jppsrsa4wlfekee65cd34kweejtbxfyglcvwainysrhrztn@lszmi53xu2o3>
References: <20250704210228.825843-1-tomasz.lis@intel.com>
 <20250704210228.825843-9-tomasz.lis@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704210228.825843-9-tomasz.lis@intel.com>
X-ClientProxiedBy: WA2P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::23) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CYXPR11MB8731:EE_
X-MS-Office365-Filtering-Correlation-Id: 721d1e3a-cb73-4b78-3714-08ddc49a29c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUx5dGpySGNtY3VyUkJWU3NJQWhpWnhwV3ZxYVpDd1lESDE2UC9hOG96KzJz?=
 =?utf-8?B?VFI2U2tJcWcyUVZxbjZSVk9tV0dVZVVWU253blJwUS8reFhZMnBYRUZ1ZkdW?=
 =?utf-8?B?SHI2b3NMdmZWUmNQT1dtSlNiZHJSbTJMOHBjRWgyM0ord2xtemcvdktxTzNs?=
 =?utf-8?B?RXB0NnZTQlVGbjZCRWh2SVEydzdueTVxSXJ4RjgvN2ZwUjhTSGZmVURVakhL?=
 =?utf-8?B?Y2RGZWR2bnpZb1dwS3pNQVlseVFwRDZoTU1FcmNVWG9HWDE3NEg5VlQ0L1Zz?=
 =?utf-8?B?aVVDTU45aktaSlhyeE9VdjJyR1VuVTVPMEIxZkh5N0NwWFBWY1lnMGFIQUJG?=
 =?utf-8?B?TUY0MWxpc2RCcjArRDF1ZUZud0JMcVRCeWE1c0JHWUROT3BTeTNSZzlLa0F2?=
 =?utf-8?B?TTNmK3BzM01tWGN4OXpod00vT2cyalZ5RE1kQkxRMVpqRzBEeWpFc25RZmFl?=
 =?utf-8?B?OW5YR08yKzFmRXdUZTI0N3ptVTEyUXV4eUh1OXVaYjltQmwxa2hIeFA3WHgy?=
 =?utf-8?B?NWNNWnBSZEFFblQ1NHhUMUgzVldWYkl6cGNGeHNDeFQvWWpnQTBSeXZKLzI5?=
 =?utf-8?B?Q2gvZkRCc3Q4NHdjd3dnWXFLU3VhbUl4bkgrRHpnT21mKzNXOWtSR0QxM1VF?=
 =?utf-8?B?czlHd1lGdlpUMm5mNno3ZXB1N09PQ085aG1TZkFYaWlwNHZaZUt4aWE2RDJC?=
 =?utf-8?B?c3VCY1NuSG5rQ2htZndxMWJNNjE0emszU252UjI1Znk5RWw2UU9EV01qLzl3?=
 =?utf-8?B?cEtWMWs1eDJuQ0tPTTJpY05kM1FmU0tOSzF3L1ZhejZXcEZKYnY2eGVGM1V0?=
 =?utf-8?B?Q0sxL2ZQVG5qVG9VTEdWN2EzeGx3d09IbU4vSmxONi9rZ2pCZzJkUEFQbnpF?=
 =?utf-8?B?eFhYYlhHRHJCWHM1LzJqWDBJd2xQWmJVUERzM2hEdDdreTRCck4xaEtYWmxQ?=
 =?utf-8?B?d21mbE1OUHFORE5qb0xPenlYVFN1Mno0QnRlZ2swdFdtL2pQeGppS3pKMFNX?=
 =?utf-8?B?TDBhekxscWFZRkl1NEU5Sm0zY20zRDRncDZST2pqVXVuVytCcHJzM1RVb1Rl?=
 =?utf-8?B?Z2R4N0VNK0s2ZVlNMzROLzB6RjVPS0Jaa3ByMVR0clZ6UWU1dUxEWG0rem9R?=
 =?utf-8?B?WlBJVmY1MHZlWnByYWZYWjJzc0lLZFRzeFdTZFpYOUhxMUovMjgvQnlIY0lh?=
 =?utf-8?B?K1hxQXBYbERiaWNVS1FMRmxIbGdrZlM5UTk3aU9hUkVIK2Z3RjRNRlU2azIx?=
 =?utf-8?B?WUUxMWZYZXgxUXhPM2hPS1RTdEZHTE4vT211RTZMYU1QZHF3Nkx1bC9LLzB2?=
 =?utf-8?B?WGFUVFZqWFJzRVVTMFYybmpyNFRGMGxkOVYySDhMN2dKVE9iTVo4K3JJUWF0?=
 =?utf-8?B?aWRncExWVTNpaDk0UXFtYlM0RnhLMVZ6c0UyWk1kdXJ2L3gyNnZ6bzlaUzFr?=
 =?utf-8?B?NXVNb01DUzdzWkt5WWc2cHVBWHAzOW1Cak9aY3lscm9YNm5mZmJvWFdDOEdk?=
 =?utf-8?B?Z2JhV3B0TlI3dkh1TU10ZkM4NnRSK1BTTW5hbGNpR1UwUEFZV1oyVlg5U2dG?=
 =?utf-8?B?YnZ3SVRobEVSUDN6dUROVFBocFMveWRMMjd2OXQycjdiUUZSTnRuMTNBU3hy?=
 =?utf-8?B?cWZBZ09NK1JBNlk3cW5YOGJIS2w0b3hWR2JzSjNGMmJCcHRtRmJyQkJ6aWRC?=
 =?utf-8?B?b0xMS09ENFAreVRIWm81ZW5RL3dyUDArS2toSVJWVkk3dDRJdHJMOStGaWNW?=
 =?utf-8?B?UGdwc240dUxjUWg1MHVRVjg0QnZqcnFZZHQ3QlJQdUhWWUtwaUQyQ0xFTEpI?=
 =?utf-8?B?TnJGb1RzaG5kWUtKOS9ZREpsNmtyYkQyU3RXUGVUelFDQ0c4VTBYQUxNd0t2?=
 =?utf-8?B?YWEvV04yYVJabFlXYlN3OGNlcDUra0J4MitXWitXTERwcGFDR2VxVlhER2lI?=
 =?utf-8?Q?L7/ZE4W1rDo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUhmM2dGaDdqbFFRbW84MisrOFYwKzhycVFDS0tTTC9ONHIrN3c4ajNPdVFY?=
 =?utf-8?B?S01ocmVXY3BnblR2WEw0cU5RU2xvQXA0QTNVRWpJU2FLTDE1M0tPYWZFVmlT?=
 =?utf-8?B?cTR5dG1QMGtJYWZDU1ZQbWdjNU5LVTJoVllCOFNETzEzZlBKTXlZek9KdmNT?=
 =?utf-8?B?K296TysveTE1ZW1Dc1MvM2o0ZjZReEUwcHcwZTVRelVPRkhTRGZmLzVSbDZ4?=
 =?utf-8?B?VDJNN2N3c2JZeVBhdWY5NERsR0hkRno0ZVFIamU5M0pUazRIenBaUlV3VVli?=
 =?utf-8?B?dFNuR0N5M3hlQ0VhV25xbTk2aVhoZkNoeHpIdmJFM3BESkVvZ2JySTRXcHlG?=
 =?utf-8?B?R2dVQ1dONENsY0hVM2ZvUjRQZTQxRlVLRzc2bnRPcHlQS0FQbUVEcWp4bktl?=
 =?utf-8?B?WnJTa0ppOWhjK0tia1dtTWZ3Wk9LZVlMekI4dFFtQ3VaRloreXhsSzNyaE1Z?=
 =?utf-8?B?a3JVcjBXZzNwbFQxdHRrcE1rckE0NzVCSkl2aXdMQ1UvdjEvaXBXdEpQaFNs?=
 =?utf-8?B?Z3B6VUhkZ2JEOHV3ZUFrU3lsVVBZZk1aRStLcjZjQyt0azhGTFpRL1cyaStH?=
 =?utf-8?B?VDJtRDNxMnp3K3ZURFQxUStrZVd4RHNFT3pTeVl5U2JkVXIrY0krVXpibHNP?=
 =?utf-8?B?eWJXR2VpVDhyY2V1N0x5WTVId3NvN0ZPZzJQWFhzWjRSQ2lydHArdU9nRkNE?=
 =?utf-8?B?dDZJeUxRdFpkbkpxNlYvbUVsR2RzYmNOcFdDRFVWUk5pNUtkdjVGSEVHVVor?=
 =?utf-8?B?RDl1WlIxbGVlNUM2TzM1clFmajZYdmZZNldvV3RVVjJlRnh6KytMbDlYbnlh?=
 =?utf-8?B?WkYwMmNEdDhsRVNmOVhUZk83N1dMMmZ4dHFhU2hOcTNScGVMU1Y3eWJxRWRL?=
 =?utf-8?B?NUlTNFVXeDAxTFcwWlRZcnR4R3RZRkhQZ09uakwzVUxzZHk0R2FiaGZUa3JK?=
 =?utf-8?B?RTlYUU0rR2lTUTh4WFJUNEV4N0xmbklFQ0owNDdZdXdrOHZuQ3RIeGRoSUh4?=
 =?utf-8?B?MWlPUnhzUWNiVkEyNHRFNUhiYUkraHJzQ1Jub3Y0UGk5c1h4Q2kwZktBRWJp?=
 =?utf-8?B?Zi84U0NhajFOdWhvb3RXMVdmZVBnLzJFUk4rRmxZZS9ReWdvZzdmUWM0T1Z1?=
 =?utf-8?B?Tmw5TkVRSzlSeXFETzNWTjN0bjl5cjRrTHpaSUhVeU1oNXVoNjdqMEVENjFJ?=
 =?utf-8?B?YlhsSGRHcU9obk85RXhpNU5vSTA0WC8zcDl6SDU4NHhjRFl1N0owVkVIZ25a?=
 =?utf-8?B?OVppYysrZ21rdVBHSnlsTnpVYndOK1I1bkk3WWNYblUzRXIzNTFaUUN3a1lo?=
 =?utf-8?B?R3FXNjE2Y2c1VzRwdXl3cnc2QTI4dGs5WlZqZEFHVWlCQnJCQVJWZm1MQVU3?=
 =?utf-8?B?SEFDV2JCMkZLSmt1Zm5wWHNEVFplK3BPVE9EVy8zWTZLU2pub2JZdWxFWFFz?=
 =?utf-8?B?S2UvSGhiNW8yTmFNcXNYdlFGMWFOM04rNUhBRHhXejdKN0V3RGI1dDhOdnk1?=
 =?utf-8?B?eVA1SEZuL2lJR3h1azV4ZTcwMzJVT3JaT2l3ZDJIVnhpcld0WWhzMzRobloz?=
 =?utf-8?B?K3c3aU1PVzU5ZDNFeXZzSHRmOW0zZFR1em9wSXErTzhkaHV4RjB3L0orQi9I?=
 =?utf-8?B?K083ZDdjdzVsOHlrb1RrbHZaMWdPcXRtZURKZFpzUStvNkcrSWNETHdPdnZS?=
 =?utf-8?B?Z1NhL3ZIbHpMQzhCZGhDcG1SN3Q4WmJ1NmI4S2o5cHF1V3ZRWDdkNEhtWnpU?=
 =?utf-8?B?T0YvZjYrcUhVZkFLZEM3RXhHUGxoTlYvRERueFgyQllhTU8xMVRMM21wczJT?=
 =?utf-8?B?UVI1emsrQUo0ZmJLQUQvSi9vdmExNHFQT3NqUXQ2TWlEc25UajJwSWM4am96?=
 =?utf-8?B?anRPSVJIa0lhT1RnNnVwRm94Yk5jSDg4L2pUbzdlVVRmVWFZYTUxZ1RMWlpN?=
 =?utf-8?B?eXVWZlArVDRUZ2xZRUlKYW0yamYwdXdDQlBGbUg5bzFOenJicTdoMXJ1MCtD?=
 =?utf-8?B?QU92dzFuRENrcllrV2VjQmtjdzJTcFh1Zk4xWFE2UjN1T2x2aEtEV3BaSVYy?=
 =?utf-8?B?bHFKV2ozQ3JTSjZVS2pQNU1TRFEvZ3NnVE9jZXhVRHlaaG1tWk94VThna21j?=
 =?utf-8?B?SHlBNjQySEloUEdoNWtrd2lGeWJJVEZ2cTAxZ1hGVGNWODY5eU45SFdQRXFJ?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 721d1e3a-cb73-4b78-3714-08ddc49a29c8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 18:54:16.3386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSJg8vifuNN5V5BWVgPEgmkFfJiRjeJDrqS6CRrk+kg5rYhbG5N5Kmo5kavh/fjjsxa55YVldpT3m+lA2nAE/8KtE3k/FeIdyvjYyCxFlNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8731
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

On Fri, Jul 04, 2025 at 11:02:27PM +0200, Tomasz Lis wrote:
> The WA buffer we use to capture context utilization contains GGTT
> references. This means its instructions have to be either fixed or
> re-emitted during VF post-migration recovery.
> 
> This patch adds re-emitting content of the utilization WA BB during
> the recovery.
> 
> The way we write to vram requires scratch buffer to be used before
> the whole block is memcopied. We are re-using a scratch buffer
> introduced in earlier part of the recovery.
> 
> v2: Notable rebase after "Prepare WA BB setup for more users" patch
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>

Needs to be rebased onto current drm-tip (and the tmp buffer allocation
should probably be shifted down the stack).
But still:

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c |  1 +
>  drivers/gpu/drm/xe/xe_lrc.c        | 54 ++++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_lrc.h        |  4 +++
>  drivers/gpu/drm/xe/xe_sriov_vf.c   |  2 +-
>  4 files changed, 42 insertions(+), 19 deletions(-)
