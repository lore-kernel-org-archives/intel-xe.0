Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFAFC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 05:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C164B10EDC5;
	Fri, 26 Apr 2024 05:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DpZuvE13";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23EAD10EDC5
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 05:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714108682; x=1745644682;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=TaBK/gFjBqGI9zwbDnM9OpHcPHHfomQZSZX9+VYUhkg=;
 b=DpZuvE13tbsPRtziRRZHmL8eAy3yWTI9tDJQNFCp5NKI0lgGA65zzR3V
 OhjnK/XLgt9tTBjicviOQP/s4SKGErAt3scjiBn9wNpL/PEZcg+Y3C8JG
 1avGKoq07Fn4uuAdxahS5cNBMfjE5dB8h2bKsmd6aJcQto5rnJJ/kBTE/
 Eg94nEHmPvgC7iZN1ZG2XPGZpGurR9gbhisPY3tM52d9mYzQdwyzvzYEl
 OJgVQPsZjL5GUXBQmmdh+ev8GHI+UE7iPjufn+sCSP8iDC+39pvgVUwqD
 gbam/VIvPpIKXT22Yf1P/QwCFP4Inw76zxo0VkOkdZWUmAyjNeb+EYrDM A==;
X-CSE-ConnectionGUID: N/iOfOFpSxyIrY1TlGcICA==
X-CSE-MsgGUID: AW8GZlbDQOqm2FhzqNCB4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9667942"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208,217";a="9667942"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 22:18:01 -0700
X-CSE-ConnectionGUID: aKkHfpTmROeGFIjeBft+Cg==
X-CSE-MsgGUID: n8QOyN22R+uhhQL3ZLjDwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208,217";a="56486419"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 22:18:00 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 22:17:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 22:17:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 22:17:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLC1H1Vd5JhPwAJ+FRwSg9ghec+ZslIbAMeCx/OuSe7IfIEand469sOV+CvI9KV+Ns0NTLrFGCJBem4zF8BkGL9mRMHUk858PHl6OFiXNzInNsAc2h3qwWKOuRDTKx3H16qa3VJsp7zqaMIRZd/uxy38/5bXX0lhDVBDjoKHPUaY9yH1+aI3W+9Q3FE+JoJWswMZVHKNdmeBEJ3tQ6xm0VdQ5n7r7P2OxWJMRh243qsOwNFxSVhOc+H5KV/96/S7Ggpb9jRUMYTfMf2qeaRdf1EmNNEGSAv1Nph87iysohIPR1g7zjFsaNbn6CqSecMkFo+f+QduNqJVhovsdfSIIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNncEr1DjFvh/aY9HRcrBcrBlyo9LNeY+HfxYiAx13s=;
 b=b8mqCWkJpWOGeDUArXFmqhdSgzLEQqrtsESW0W3Qce6/NSyqH3p4qf6I58qGIPZVaf31/VP9WBeItUErprHAghePtjtjDWhX+W4QsVd600nKuEncm9annxSjFn9BPFLlARrXMPSDy83kWWi6X68toIPcrrNP2cjNTjqxVzn1ELc8B6kt55i0E5bLKe2SFD84rkuDSXF43Lx9AKm0mF/uz4QohwDXwyi7c30Pgom5BYJ3xIgWPmTbRxdTBMjGXHZClYXRyjX+uqeWnttMBky0jGHC2uPEYL8C1zb67f6VO4PEyUPZQ8QdLXBYNoj/6ShaYazT46Jxoxpv1EwIp/DDjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by MN6PR11MB8171.namprd11.prod.outlook.com (2603:10b6:208:471::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Fri, 26 Apr
 2024 05:17:43 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2%3]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 05:17:43 +0000
Content-Type: multipart/alternative;
 boundary="------------wADzHctydj900tde5opbkf2u"
Message-ID: <ef055b8c-d4cd-4d65-92ec-9234b294b725@intel.com>
Date: Fri, 26 Apr 2024 10:47:36 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/xe2hpg=3A?=
 =?UTF-8?Q?_Add_Wa=5F14021490052_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20240424034247.1352755-1-shekhar.chauhan@intel.com>
 <171398702493.1648713.6747513576019818684@8e613ede5ea5>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <171398702493.1648713.6747513576019818684@8e613ede5ea5>
X-ClientProxiedBy: PN2PR01CA0244.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::13) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|MN6PR11MB8171:EE_
X-MS-Office365-Filtering-Correlation-Id: fb66031c-c5a1-4905-c1f9-08dc65b0337d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXZEZlJMZkhoc3FORnQ2WC9acUk5dzFVWDNRSkl4V05nMS9hS1RNYzZKa0k2?=
 =?utf-8?B?V2FkK2N4WjJDMTlQRFVxYXR4dlFvTmVRY2FIWVdPaTdwV0FDVm1wZnlQODBw?=
 =?utf-8?B?REY4MC9RbWdFRVhNbDFRalhYenZiQVhqT2tuQjJiS3ZxNDBlY05ZeUxXOHVN?=
 =?utf-8?B?Q2hwL0t1QTNsOU1PL3ZWNWpWK1VEeVAyMlcrLzJleERMUm9vU2V4SnhzbVNk?=
 =?utf-8?B?dmFlU2VXdGxaZ2hKNXlVUW5qVWNlNXNSdlI2SzVxSHljUGpqSFNlN0JoWkxV?=
 =?utf-8?B?YWJ4S28xQUJKVmovdmhBOGJ3MExRejRwRUhoOHFacXBRRGdXSmhRSkRpWCti?=
 =?utf-8?B?cisrUjI1MHYyWDdUcXNSYWxyQmdtOVFiS1ozQTFyWDRJd0t3RXZzV1ZjTlcz?=
 =?utf-8?B?Z2FrR3N3eWNrZlFLT2EwbEN3WTlWSW0vVCtFeFFteGdsZ0tROXhSRDBlUmdp?=
 =?utf-8?B?SHpET0hkL1M5V0VkRis0UHNUcnpicUdmS3EyY0p2RkhOM2pvdzFIWDFjVkFa?=
 =?utf-8?B?NFlwWkorTStzVWZtREVGbklhM0FBS1YzbktLVm96czBVWXlsZnFLZWFFWEJ0?=
 =?utf-8?B?VWN3d29qMThwS1VnckcwS3ptSGlNa2xpRnFIc2hyMFRBZmhCemxwM1luQVl1?=
 =?utf-8?B?YXpwWmREVkZRRURwOEJFYStTWFJTZmFRTGQ5eVpmVWhoWTRzaU1FZzhPYmpr?=
 =?utf-8?B?TW9jdWlGRm9pdE1KMVlQc0xOSWVva3pmRnRpa0RqbnNnRkhsWG16MzBKSWtP?=
 =?utf-8?B?VXI1Ym9zSzIvVi9SZXJzQWovVnJRSFBYR2pLTGNHWFZ0VW0xZDhMbnlwNnBy?=
 =?utf-8?B?MFUrN2lNYWR5UDVHZWMyeFpiK3hpZXZXVnZmWjZicEQzanR2c012dnpGSWFL?=
 =?utf-8?B?bjVEUGp5TDZ0ZWFsTmdUaklIdUdvTmRQOWhxKzZsbVJMUmYxck1yNDYyUFJP?=
 =?utf-8?B?dTdQS0Y2U0liZlFHT0pSTTNpbk5peUZjQkJWM1p5ZzE0NlZST1BhY0dHNjRY?=
 =?utf-8?B?eGdrN1NESGVmcVJwUTErL2ZUWFF4RUQ4V2c4a21VZWRWcTgvNjZYOSs3MTF3?=
 =?utf-8?B?NXlCcStWNitDSUR6WWl4VVVIUU1oRTQ2eDh5RmZTaTNmMjdIZzlHeVVSUFBR?=
 =?utf-8?B?bGRQeEZGQlZxZWRpbndiRWJMSnNIUitKak95MkJjOHYybFdtd1RMQXRnaWUy?=
 =?utf-8?B?eEV0ZldVcS9xaVNYUURUTkFqZmVhMDkrM1NpV3RGdUErYkN5UFNnc3RXNllt?=
 =?utf-8?B?cm9HSksrL2RUWXRQbU9sTnZJeWo3bGdvZUw4WWl0c0FRRWNaamRzWllEVEVp?=
 =?utf-8?B?RWFlcEpXUVFVVmZOUWx3REI1Q1JhK28yUy9TSi9jZUNJK2h0UGhFL3ZHa2di?=
 =?utf-8?B?R1RTV0s4ZVNyaG9KWXdlZzJNU2FmajZpK2puMmdnTGZxUUdQR25GcDF1elpE?=
 =?utf-8?B?ZVpjNWVoS2M1MXc0cGRlR3hNN2hGU2ZVZG5EdGl5OEJYckhxSUxEWGY4bUdP?=
 =?utf-8?B?NXg4SVJOdEJwa2loeTRyL2dBVnMwUHlaZ0s3Z00vT2xMTGxESWxSRzMwZjFW?=
 =?utf-8?B?UWd4WmQ2K0MxckRTR0hwZjBuYVRYQkw5NU0yS1N0d3NYQUxXeExSK0VMdncv?=
 =?utf-8?Q?H/TtgOwwqzcLgqz/PA0544we6i3KIQgXgSuYDFntlPBQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkxGYlhIcm0wZmNlNnhlNWplUzVHL1UxdHkrcTVmMTJTVTRzTTZrNW9qajlo?=
 =?utf-8?B?akZtVk5naS92UFBySTFQZlRnZ3NRMjN4c0pHRkcxSFd0NGZRZmorUlRDMWtT?=
 =?utf-8?B?RDFHckxFbm9MUytXZ200eUNiZnJlS1l1U2VyUzlwSjRQdnhwODRlNjBqclVk?=
 =?utf-8?B?U2U3dTh6Q2d0cmYvOTN5aUNoY2crLzdlQmVJVnRtdzdxeGFUdm56eTZJcXVr?=
 =?utf-8?B?bXZzYlpNTEsyR1hQT2R5d0FHSHJNQlpaY1JMWVM0SEtud1pRanpSeFBCc3ZE?=
 =?utf-8?B?M2ZCNXk3Y2RydW9MbVZ2ZzEyalpMZUdQTUpiMW10SCtYTkNYM1VEeWhCdkhz?=
 =?utf-8?B?OWlJSUtiTEcrRjdQYXJXUjFnTjVCN2tqcEwxbDBtN0NlOVF0SVRZYWdtMzgz?=
 =?utf-8?B?STAybGo0ejFKNVhlemNHQ3JCUmlhZC9LaEhHTWUvcGVXcHFyNjdnWWsvMDNS?=
 =?utf-8?B?NHI0K2R0bmhycEJQZEYxTFNNcnV0Mml3VElJMklZVVlmNks1T2ZLcWQ0UEY2?=
 =?utf-8?B?YThobk5jcmZNUkQwMlJzRVF5UnYxU2pJYzRGWDdrSUJYc25oVmxxd0FGUXVZ?=
 =?utf-8?B?WUU0VlV1YkF1Z3NuV0ZIcHNJODVXRHBGcmVtVWFlc0N1clpOenhubGk1SXN4?=
 =?utf-8?B?Kyt4ZERNUVRSWFRxWStacllXY0EzSllLR3ZFS1dYMm5HcTRDUXROVnUzcHVS?=
 =?utf-8?B?b25WUS82RzJROGRacjJCTHZmOWNYcGI4QVFIYXdaSUtlWkRKakhIYmduM2NF?=
 =?utf-8?B?SkorRnpQMEFGcVhERGtweHh1ZXNoOGgrYUhvWjduV3FtSWlGdGZCblFmZ2Q4?=
 =?utf-8?B?UmFEVWRuUmhsSU85K3plcmtQd3B6ZTN1UytLUFYxdmxJdGxGc3JCUDBMdm51?=
 =?utf-8?B?NGFIb3l2cTcrUXRNaUFzaFVCRXRFQzRjZURLUUxLQzRDSVp4TDArSkFrYVNx?=
 =?utf-8?B?UGhLOVBNdmVxMXJTblJ5SE9majhFbkV1MTJPbmhDTU4rYzl5dm1VNlp6TVdP?=
 =?utf-8?B?c0svK1VBVUNaaEE5NU5uSThLMnNjQVNGTlN5T25wUy83WWJBTUNGeFpiYzls?=
 =?utf-8?B?TGhqTTdkMFoydDhEV0cwNk1xNkVhK0kxTHNUQm5iOHdaK2IxQ1l4emxsQWc5?=
 =?utf-8?B?QW85d3l3c3lwMlMwLzZ0S2hIOUcwNzB0aXgvQk5jb3gyYjQ2ak1lQjA3UTBO?=
 =?utf-8?B?enNzQWlPT2xwSDZSVTc0ZzhrY01iM0VXQm4rUDIxbUxXMEdhUDlIT2dUTXBG?=
 =?utf-8?B?SzR0a2g3d1dIVFZ1RUV3MEx1bitnTDFueDRGK3piZWhTL1JoN1RVRWNtNjRw?=
 =?utf-8?B?Q1hRbW9ManQySVh4TTdSUy9YdUhZR1VhVlk4bWNHclRxUUYvZHlwTkNCRFBt?=
 =?utf-8?B?NjRzaE1XR2xZZHB4L05wTFZ6MUVrcHFPZ1pwM1BMdlJLVTRVVmFIWTRua0Zi?=
 =?utf-8?B?QmJjaTZPU1RUU1hKRXpqbVVEWFFDSDRZQWs1aWlEcWpMbXhuNlVwblNnanBN?=
 =?utf-8?B?UFhhOHQ0MSt6SDcxQU1OcytiMFdkMncxb2hqOGQ4d1M4ajJCWUM3algwcE9h?=
 =?utf-8?B?UHRCZFBxcEtRdXhoUFl3N2hzTkF0WE9oSkNGRmpsY3ArWFRuN3hteDBMdDdP?=
 =?utf-8?B?MjQ4SkJNeGJhcmRybG5XMHRXUHVBV1FjWDRST1RjaHdiN09oRmxNMWVtRXln?=
 =?utf-8?B?Z2crKzV0QUxhUzlGNmJQeWl3M2dQSGsxMXZFSjZCWFRyS0tzbFBiYlBsSmZD?=
 =?utf-8?B?R2pYZDA0NmpsbzhzQWx6VTE0Wi94YTB5dmtnc21vQVNVb0FYZUNmUm5JZ1lw?=
 =?utf-8?B?aitSTVptUFQxL0k3L1pKQ0Fkb3RlN1QzdVQ2dWh0TjVuWlJMeUVHZ3RieGpB?=
 =?utf-8?B?dXNhbE53eUlQaXAzYlI5M3YxclhoanNyU0R0dVNBOHYrRld0MHJSaHZBcHh1?=
 =?utf-8?B?V0F5NDVQME5XU201Qm4rdVFIaGZpeitlSUhsZXF4UXQ1Mk5Dc254emptN3o4?=
 =?utf-8?B?MXppR0txM0s3Q3MveFlmajNWL0RCMXBlUkpkeFN5UDBnVXNlNEFXNWdiSnFF?=
 =?utf-8?B?NEFHaG1rcFJ5WXpuZEtxb0M0M0RlbThHV3ZhOGkyL0ZVZVFkNSt3VzB3SnRu?=
 =?utf-8?B?V1FNOU82ODdTQ3RuUENselZaSGJCc214MmZRczZSSjVibThIV2Uyc3N5eGp5?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb66031c-c5a1-4905-c1f9-08dc65b0337d
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 05:17:43.8105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqDeX1WA3uRSAp9uMJBpiM47BLlqIVnGsz0VOPvv+N/ZDAyeuqAzgs7Q3QEd2UWZAMATV68zKTlGpeZOgiJEafmssEbnhQSlu2ssooz3Rbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8171
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

--------------wADzHctydj900tde5opbkf2u
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

The following CI results can be considered false positives since the 
results are for DG2 and within the display segment which the patch isn't 
targeting.

/-shekhar
/

On 4/25/2024 01:00, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe/xe2hpg: Add Wa_14021490052 (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/132753/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/index.html
>
>
>   CI Bug Log - changes from
>   xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3_full ->
>   xe-pw-132753v2_full
>
>
>     Summary
>
> *WARNING*
>
> Minor unknown changes coming with xe-pw-132753v2_full need to be verified
> manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-132753v2_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (3 -> 3)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-132753v2_full:
>
>
>       IGT changes
>
>
>         Warnings
>
>   * igt@kms_tiled_display@basic-test-pattern:
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html>
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>  *
>
>     igt@kms_flip@modeset-vs-vblank-race@b-edp1:
>
>       o {shard-lnl}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-lnl-7/igt@kms_flip@modeset-vs-vblank-race@b-edp1.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-lnl-6/igt@kms_flip@modeset-vs-vblank-race@b-edp1.html>
>         +2 other tests incomplete
>  *
>
>     igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-256:
>
>       o {shard-lnl}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-lnl-7/igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-256.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-lnl-6/igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-256.html>
>  *
>
>     igt@kms_psr@fbc-psr2-cursor-plane-onoff:
>
>       o {shard-lnl}: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html>
>         +1 other test fail
>  *
>
>     igt@xe_exec_reset@gt-reset-stress:
>
>       o {shard-lnl}: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-lnl-3/igt@xe_exec_reset@gt-reset-stress.html>
>         +1 other test dmesg-warn
>
>
>     Known issues
>
> Here are the changes found in xe-pw-132753v2_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-4:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-463/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-4.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-435/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-4.html>
>         (Intel XE#827
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/827>)
>  *
>
>     igt@kms_big_fb@linear-16bpp-rotate-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#619
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +13
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-1.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +5
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-limited-range:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +5
>         other tests dmesg-warn
>  *
>
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@forked-bo@all-pipes:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_cursor_legacy@forked-bo@all-pipes.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +3
>         other tests dmesg-warn
>  *
>
>     igt@kms_cursor_legacy@single-move@pipe-a:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-435/igt@kms_cursor_legacy@single-move@pipe-a.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-434/igt@kms_cursor_legacy@single-move@pipe-a.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
>  *
>
>     igt@kms_cursor_legacy@torture-bo@pipe-c:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-436/igt@kms_cursor_legacy@torture-bo@pipe-c.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-466/igt@kms_cursor_legacy@torture-bo@pipe-c.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1
>         other test incomplete
>  *
>
>     igt@kms_feature_discovery@chamelium:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_feature_discovery@chamelium.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#701
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>)
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#310
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>)
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) +2
>         other tests fail
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +5
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +5
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
>
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +2
>         other tests skip
>  *
>
>     igt@kms_panel_fitting@atomic-fastset:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_panel_fitting@atomic-fastset.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3
>         other tests skip
>  *
>
>     igt@kms_panel_fitting@legacy:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_panel_fitting@legacy.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>)
>  *
>
>     igt@kms_pm_rpm@legacy-planes-dpms:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_pm_rpm@legacy-planes-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1211
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211>) +1
>         other test skip
>  *
>
>     igt@kms_pm_rpm@universal-planes:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-436/igt@kms_pm_rpm@universal-planes.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-434/igt@kms_pm_rpm@universal-planes.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1211
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +4
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-basic:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_psr@fbc-psr-basic.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +2
>         other tests skip
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak:
>
>       o shard-adlp: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +3
>         other tests incomplete
>  *
>
>     igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>)
>  *
>
>     igt@kms_writeback@writeback-pixel-formats:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_writeback@writeback-pixel-formats.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@xe_evict@evict-beng-large-multi-vm-cm:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html>
>         (Intel XE#821
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/821>) +1
>         other test dmesg-fail
>  *
>
>     igt@xe_evict@evict-cm-threads-small-multi-vm:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@xe_evict@evict-cm-threads-small-multi-vm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261>)
>  *
>
>     igt@xe_evict@evict-threads-large:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-436/igt@xe_evict@evict-threads-large.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-466/igt@xe_evict@evict-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>)
>  *
>
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_reset@gt-reset-stress:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@xe_exec_reset@gt-reset-stress.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>)
>  *
>
>     igt@xe_exec_threads@threads-fd-userptr:
>
>       o shard-adlp: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@xe_exec_threads@threads-fd-userptr.html>
>         (Intel XE#1088
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088> /
>         Intel XE#1330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330>)
>  *
>
>     igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html>
>         (Intel XE#1256
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256>)
>  *
>
>     igt@xe_exec_threads@threads-mixed-userptr:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-433/igt@xe_exec_threads@threads-mixed-userptr.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-436/igt@xe_exec_threads@threads-mixed-userptr.html>
>         (Intel XE#1044
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044> /
>         Intel XE#1169
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169> /
>         Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356>)
>  *
>
>     igt@xe_exec_threads@threads-userptr-rebind:
>
>       o shard-adlp: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@xe_exec_threads@threads-userptr-rebind.html>
>         (Intel XE#1169
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169> /
>         Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>  *
>
>     igt@xe_intel_bb@intel-bb-blit-none:
>
>       o shard-adlp: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@xe_intel_bb@intel-bb-blit-none.html>
>         (Intel XE#1619
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619>) +1
>         other test dmesg-fail
>  *
>
>     igt@xe_pat@pat-index-xe2:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@xe_pat@pat-index-xe2.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#977
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>  *
>
>     igt@xe_pm@d3-mmap-vram:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-434/igt@xe_pm@d3-mmap-vram.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-463/igt@xe_pm@d3-mmap-vram.html>
>         (Intel XE#1221
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221>)
>  *
>
>     igt@xe_pm@s4-basic:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@xe_pm@s4-basic.html>
>         (Intel XE#1043
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043> /
>         Intel XE#845
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/845>)
>  *
>
>     igt@xe_pm_residency@toggle-gt-c6:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html>
>         (Intel XE#958
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/958>)
>  *
>
>     igt@xe_query@multigpu-query-uc-fw-version-guc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-4:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-463/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-4.html>
>         (Intel XE#827
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/827>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-435/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-4.html>
>  *
>
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> /
>         Intel XE#910
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/910>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html>
>         +1 other test pass
>  *
>
>     igt@kms_cursor_legacy@cursor-vs-flip-atomic:
>
>       o {shard-lnl}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-lnl-4/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-lnl-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html>
>  *
>
>     igt@kms_cursor_legacy@forked-move@pipe-b:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-435/igt@kms_cursor_legacy@forked-move@pipe-b.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-434/igt@kms_cursor_legacy@forked-move@pipe-b.html>
>         +13 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank:
>
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html>
>         (Intel XE#480
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/480>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html>
>         +2 other tests pass
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate@b-edp1:
>
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html>
>         +2 other tests pass
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html>
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html>
>  *
>
>     igt@kms_plane@plane-position-covered:
>
>       o {shard-lnl}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-lnl-7/igt@kms_plane@plane-position-covered.html>
>         (Intel XE#1330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-lnl-1/igt@kms_plane@plane-position-covered.html>
>         +11 other tests pass
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html>
>         (Intel XE#771
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/771> /
>         Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html>
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html>
>         (Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html>
>         +1 other test pass
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-small:
>
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html>
>  *
>
>     igt@xe_exec_compute_mode@many-userptr-invalidate-race:
>
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-lnl-3/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html>
>         (Intel XE#1069
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-lnl-6/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html>
>  *
>
>     igt@xe_exec_reset@cm-cat-error:
>
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-433/igt@xe_exec_reset@cm-cat-error.html>
>         (Intel XE#1304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@xe_exec_reset@cm-cat-error.html>
>  *
>
>     igt@xe_exec_threads@threads-hang-fd-rebind:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-rebind.html>
>         (Intel XE#1256
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-rebind.html>
>  *
>
>     igt@xe_gt_freq@freq_fixed_exec:
>
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-lnl-3/igt@xe_gt_freq@freq_fixed_exec.html>
>         (Intel XE#1414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-lnl-6/igt@xe_gt_freq@freq_fixed_exec.html>
>  *
>
>     igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer:
>
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-lnl-6/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html>
>         (Intel XE#1081
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-lnl-3/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>  *
>
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>)
>  *
>
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> /
>         Intel XE#910
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/910>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>)
>  *
>
>     igt@kms_cursor_legacy@single-move:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-435/igt@kms_cursor_legacy@single-move.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-434/igt@kms_cursor_legacy@single-move.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> /
>         Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) +2
>         other tests dmesg-warn
>  *
>
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-466/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/904> /
>         Intel XE#909
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/909>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-463/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1
>         other test incomplete
>  *
>
>     igt@kms_vblank@ts-continuation-dpms-suspend:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend.html>
>         (Intel XE#1034
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034> /
>         Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>  *
>
>     igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html>
>         (Intel XE#1034
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034> /
>         Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>  *
>
>     igt@kms_vblank@ts-continuation-suspend:
>
>       o shard-adlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend.html>
>         (Intel XE#1034
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034> /
>         Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/927>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>)
>  *
>
>     igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
>
>       o shard-adlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html>
>         (Intel XE#1034
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034> /
>         Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>)
>  *
>
>     igt@xe_evict@evict-beng-mixed-threads-large:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>  *
>
>     igt@xe_evict@evict-mixed-threads-large:
>
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html>
>         (Intel XE#1041
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041> /
>         Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) ->
>         TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * Linux: xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3 ->
>     xe-pw-132753v2
>
> IGT_7819: 98e0d03839ce31141328a2935eb193361eca61e3 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3: 
> b489bf6605759a57c37295c2025e5ee392b88ff3
> xe-pw-132753v2: 132753v2
>
-- 
-shekhar

--------------wADzHctydj900tde5opbkf2u
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><font face=3D"Courier New, Courier, monospace">The following CI
        results can be considered false positives since the results are
        for DG2 and within the display segment which the patch isn't
        targeting.</font></p>
    <p><font face=3D"Courier New, Courier, monospace"><i>-shekhar<br>
        </i></font></p>
    <div class=3D"moz-cite-prefix">On 4/25/2024 01:00, Patchwork wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:171398702493.1648713.674751357601=
9818684@8e613ede5ea5">
     =20
      <title>Project List - Patchwork</title>
      <style id=3D"css-table-select" type=3D"text/css">td { padding: 2pt; }=
</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe/xe2hpg: Add Wa_14021490052 (rev2)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href=3D"https://patchwork.freedesktop.org/series/132753/=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://patchwor=
k.freedesktop.org/series/132753/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
132753v2/index.html" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetex=
t">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/index.html</a><=
/td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3_full -&gt;
        xe-pw-132753v2_full</h1>
      <h2>Summary</h2>
      <p><strong>WARNING</strong></p>
      <p>Minor unknown changes coming with xe-pw-132753v2_full need to
        be verified<br>
        manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-132753v2_full, please notify your bug team
        (<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:I915-ci-infra=
@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow t=
hem<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (3 -&gt; 3)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-132753v2_full:</p>
      <h3>IGT changes</h3>
      <h4>Warnings</h4>
      <ul>
        <li>igt@kms_tiled_display@basic-test-pattern:
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-463/ig=
t@kms_tiled_display@basic-test-pattern.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" m=
oz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/362" moz-do-not-send=3D"true">Intel XE#362<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13275=
3v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not=
-send=3D"true">FAIL</a></li>
          </ul>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>
          <p>igt@kms_flip@modeset-vs-vblank-race@b-edp1:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-lnl-7/igt@kms=
_flip@modeset-vs-vblank-race@b-edp1.html" moz-do-not-send=3D"true">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/=
shard-lnl-6/igt@kms_flip@modeset-vs-vblank-race@b-edp1.html" moz-do-not-sen=
d=3D"true">INCOMPLETE</a> +2 other tests
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-256:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-lnl-7/igt@kms=
_plane_cursor@overlay@pipe-b-edp-1-size-256.html" moz-do-not-send=3D"true">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
32753v2/shard-lnl-6/igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-256.html=
" moz-do-not-send=3D"true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
          <ul>
            <li>{shard-lnl}: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-132753v2/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-=
plane-onoff.html" moz-do-not-send=3D"true">FAIL</a> +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@gt-reset-stress:</p>
          <ul>
            <li>{shard-lnl}: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-132753v2/shard-lnl-3/igt@xe_exec_reset@gt-reset-s=
tress.html" moz-do-not-send=3D"true">DMESG-WARN</a> +1 other test
              dmesg-warn</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-132753v2_full that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-463/ig=
t@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-4.html" moz-do-not-se=
nd=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-132753v2/shard-dg2-435/igt@kms_async_flips@alternate-sync-async-=
flip@pipe-d-dp-4.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/827" moz-do-not-send=3D"true"=
>Intel XE#827</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_big_fb@linear-1=
6bpp-rotate-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true"=
>Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316" moz-do-not-send=3D"true">Intel XE#316</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-addf=
b.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/619" =
moz-do-not-send=3D"true">Intel XE#619</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-f=
lip:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_big_fb@yf-tiled=
-max-hw-stride-64bpp-rotate-180-async-flip.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/112=
4" moz-do-not-send=3D"true">Intel XE#1124</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE=
#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp=
-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_ccs@bad-pixel-f=
ormat-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201=
" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#7=
87</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-dp=
-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_ccs@bad-pixel-f=
ormat-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201=
" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#4=
55</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787=
" moz-do-not-send=3D"true">Intel XE#787</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a=
-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_ccs@crc-sprite-plane=
s-basic-yf-tiled-ccs@pipe-c-hdmi-a-1.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz=
-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a=
>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_ccs@random-ccs-data-=
4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D=
"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send=3D=
"true">Intel XE#787</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-limited-range:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_chamelium_color=
@ctm-limited-range.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"tr=
ue">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/306" moz-do-not-send=3D"true">Intel XE#306</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_chamelium_frame=
s@hdmi-cmp-planar-formats.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-se=
nd=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373" moz-do-not-send=3D"true">Intel XE#373</a>) +1 othe=
r test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd=
-after-suspend.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">=
Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/373" moz-do-not-send=3D"true">Intel XE#373</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a=
-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-463/ig=
t@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html" moz-do=
-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-132753v2/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-mo=
vement-256x256@pipe-d-hdmi-a-6.html" moz-do-not-send=3D"true">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz=
-do-not-send=3D"true">Intel XE#1214</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/282" moz-do-not-send=3D"true">Intel XE#282</a=
>) +5 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_cursor_legacy@2x-lon=
g-cursor-vs-flip-legacy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=
=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309" moz-do-not-send=3D"true">Intel XE#309</a>) +1 other =
test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_cursor_legacy@f=
orked-bo@all-pipes.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-se=
nd=3D"true">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/282" moz-do-not-send=3D"true">Intel XE#282</a>) +3 othe=
r tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@single-move@pipe-a:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-435/ig=
t@kms_cursor_legacy@single-move@pipe-a.html" moz-do-not-send=3D"true">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753=
v2/shard-dg2-434/igt@kms_cursor_legacy@single-move@pipe-a.html" moz-do-not-=
send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877" moz-do-not-se=
nd=3D"true">Intel XE#877</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@torture-bo@pipe-c:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-436/ig=
t@kms_cursor_legacy@torture-bo@pipe-c.html" moz-do-not-send=3D"true">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v=
2/shard-dg2-466/igt@kms_cursor_legacy@torture-bo@pipe-c.html" moz-do-not-se=
nd=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1195" moz-do-not-send=3D"true">Intel XE#1195</a>) +1 other =
test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@chamelium:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_feature_discove=
ry@chamelium.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">In=
tel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/701" moz-do-not-send=3D"true">Intel XE#701</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_flip@2x-flip-vs-susp=
end-interruptible.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"tru=
e">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/310" moz-do-not-send=3D"true">Intel XE#310</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:=
</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-adlp-9/igt@kms=
_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html" moz-do-not-sen=
d=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe=
-c-hdmi-a-1-x-to-x.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/616" moz-do-not-send=3D"tru=
e">Intel XE#616</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-b=
lt:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_frontbuffer_tracking=
@drrs-1p-offscren-pri-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz=
-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651" moz-do-not-send=3D"true">Intel XE#651</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:=
</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_frontbuffer_tra=
cking@drrs-2p-scndscrn-cur-indfb-onoff.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" m=
oz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/651" moz-do-not-send=3D"true">Intel XE#651<=
/a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-r=
ender:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_frontbuffer_tracking=
@drrs-2p-scndscrn-pri-shrfb-draw-render.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" =
moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656" moz-do-not-send=3D"true">Intel XE#656=
</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-re=
nder:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_frontbuffer_tracking=
@fbc-1p-primscrn-pri-shrfb-draw-render.html" moz-do-not-send=3D"true">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616" mo=
z-do-not-send=3D"true">Intel XE#616</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-re=
nder:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_frontbuffer_tra=
cking@psr-2p-primscrn-cur-indfb-draw-render.html" moz-do-not-send=3D"true">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
01" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send=3D"true">Intel XE=
#653</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@atomic-fastset:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_panel_fitting@a=
tomic-fastset.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">I=
ntel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/455" moz-do-not-send=3D"true">Intel XE#455</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@legacy:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_panel_fitting@legacy=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" m=
oz-do-not-send=3D"true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-436/ig=
t@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html" moz-do-not-send=3D"=
true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-132753v2/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-=
dp-4.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">Inte=
l XE#1214</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_pm_rpm@legacy-planes=
-dpms.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#=
1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
211" moz-do-not-send=3D"true">Intel XE#1211</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@universal-planes:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-436/ig=
t@kms_pm_rpm@universal-planes.html" moz-do-not-send=3D"true">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-=
dg2-434/igt@kms_pm_rpm@universal-planes.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" =
moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1211" moz-do-not-send=3D"true">Intel XE#12=
11</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_psr2_sf@overlay=
-plane-update-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-se=
nd=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/929" moz-do-not-send=3D"true">Intel XE#929</a>) +4 othe=
r tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-basic:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_psr@fbc-psr-basic.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-=
do-not-send=3D"true">Intel XE#929</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_tiled_display@b=
asic-test-pattern-with-chamelium.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-=
not-send=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_universal_plane@curs=
or-fb-leak.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send=3D"true=
">Intel XE#1195</a>) +3 other tests
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_vblank@ts-continuati=
on-suspend@pipe-d-hdmi-a-1.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-=
not-send=3D"true">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1608" moz-do-not-send=3D"true">Intel XE#1608</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-pixel-formats:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@kms_writeback@write=
back-pixel-formats.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"tr=
ue">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/756" moz-do-not-send=3D"true">Intel XE#756</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-435/ig=
t@xe_evict@evict-beng-large-multi-vm-cm.html" moz-do-not-send=3D"true">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13275=
3v2/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html" moz-do-no=
t-send=3D"true">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/821" moz-do-not-send=3D"true">Intel XE#821</a>) +1 othe=
r test
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-cm-threads-small-multi-vm:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@xe_evict@evict-cm-thread=
s-small-multi-vm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true=
">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/261" moz-do-not-send=3D"true">Intel XE#261</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-436/ig=
t@xe_evict@evict-threads-large.html" moz-do-not-send=3D"true">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard=
-dg2-466/igt@xe_evict@evict-threads-large.html" moz-do-not-send=3D"true">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
473" moz-do-not-send=3D"true">Intel XE#1473</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/392" moz-do-not-send=3D"true">Intel X=
E#392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@xe_exec_fault_mode@=
twice-bindexecqueue-userptr.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-s=
end=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/288" moz-do-not-send=3D"true">Intel XE#288</a>) +2 oth=
er tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@gt-reset-stress:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@xe_exec_reset@gt-re=
set-stress.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true=
">Intel XE#1214</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-fd-userptr:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@xe_exec_threads@threads-=
fd-userptr.html" moz-do-not-send=3D"true">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1088" moz-do-not-send=3D"true=
">Intel XE#1088</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1330" moz-do-not-send=3D"true">Intel XE#1330</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-436/ig=
t@xe_exec_threads@threads-hang-fd-userptr-rebind.html" moz-do-not-send=3D"t=
rue">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-132753v2/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr-rebi=
nd.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1256" moz-do-not-send=3D"true">Intel XE#125=
6</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-mixed-userptr:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-433/ig=
t@xe_exec_threads@threads-mixed-userptr.html" moz-do-not-send=3D"true">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13275=
3v2/shard-dg2-436/igt@xe_exec_threads@threads-mixed-userptr.html" moz-do-no=
t-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1044" moz-do-not-send=3D"true">Intel XE#1044</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169" moz-do-not=
-send=3D"true">Intel XE#1169</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1195" moz-do-not-send=3D"true">Intel XE#1195</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356" moz-do-=
not-send=3D"true">Intel XE#1356</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-userptr-rebind:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@xe_exec_threads@threads-=
userptr-rebind.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1169" moz-do-not-send=3D"=
true">Intel XE#1169</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1195" moz-do-not-send=3D"true">Intel XE#1195</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_intel_bb@intel-bb-blit-none:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@xe_intel_bb@intel-bb-bli=
t-none.html" moz-do-not-send=3D"true">DMESG-FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1619" moz-do-not-send=3D"true">In=
tel XE#1619</a>) +1 other test
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xe2:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@xe_pat@pat-index-xe=
2.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977" =
moz-do-not-send=3D"true">Intel XE#977</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3-mmap-vram:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-434/ig=
t@xe_pm@d3-mmap-vram.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-463/=
igt@xe_pm@d3-mmap-vram.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221" moz-do-not-send=
=3D"true">Intel XE#1221</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-basic:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@xe_pm@s4-basic.html=
" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1043" moz-do-not-send=3D"true">Intel XE#1043</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/845" moz-do=
-not-send=3D"true">Intel XE#845</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@toggle-gt-c6:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-adlp-1/igt@xe_=
pm_residency@toggle-gt-c6.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp=
-4/igt@xe_pm_residency@toggle-gt-c6.html" moz-do-not-send=3D"true">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/958" moz-d=
o-not-send=3D"true">Intel XE#958</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@xe_query@multigpu-q=
uery-uc-fw-version-guc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=
=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944" moz-do-not-send=3D"true">Intel XE#944</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-463/ig=
t@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-4.html" moz-do-not-se=
nd=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/827" moz-do-not-send=3D"true">Intel XE#827</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-435/igt@=
kms_async_flips@alternate-sync-async-flip@pipe-c-dp-4.html" moz-do-not-send=
=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-466/ig=
t@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html" moz-do-not-send=3D"true"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/282" moz-do-not-send=3D"true">I=
ntel XE#282</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/910" moz-do-not-send=3D"true">Intel XE#910</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-436/igt@kms_=
cursor_legacy@2x-cursor-vs-flip-legacy.html" moz-do-not-send=3D"true">PASS<=
/a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-lnl-4/igt@kms=
_cursor_legacy@cursor-vs-flip-atomic.html" moz-do-not-send=3D"true">INCOMPL=
ETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
2753v2/shard-lnl-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html" moz-do=
-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-435/ig=
t@kms_cursor_legacy@forked-move@pipe-b.html" moz-do-not-send=3D"true">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/282" moz-do-not-send=3D"true">Intel X=
E#282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-132753v2/shard-dg2-434/igt@kms_cursor_legacy@forked-move@pipe-b.html" moz-=
do-not-send=3D"true">PASS</a> +13 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-lnl-2/igt@kms=
_flip@flip-vs-absolute-wf_vblank.html" moz-do-not-send=3D"true">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/480" moz-do-n=
ot-send=3D"true">Intel XE#480</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132753v2/shard-lnl-7/igt@kms_flip@flip-vs-absolute=
-wf_vblank.html" moz-do-not-send=3D"true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate@b-edp1:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-lnl-2/igt@kms=
_flip@plain-flip-fb-recreate@b-edp1.html" moz-do-not-send=3D"true">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886" moz-d=
o-not-send=3D"true">Intel XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-132753v2/shard-lnl-5/igt@kms_flip@plain-flip-fb=
-recreate@b-edp1.html" moz-do-not-send=3D"true">PASS</a> +1 other test pass=
</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:=
</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-adlp-9/igt@kms=
_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html" moz-do-not-sen=
d=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/616" moz-do-not-send=3D"true">Intel XE#616</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@km=
s_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html" moz-do-not-se=
nd=3D"true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-adlp-8/igt@kms=
_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html" moz-do-not-send=3D"t=
rue">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1191" moz-do-not-send=3D"true">Intel XE#1191</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"tr=
ue">Intel XE#1214</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-132753v2/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@=
pipe-b-hdmi-a-1.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-436/ig=
t@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html" moz-do-not-send=
=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-46=
6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html" moz-do-not-=
send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-covered:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-lnl-7/igt@kms=
_plane@plane-position-covered.html" moz-do-not-send=3D"true">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330" moz-=
do-not-send=3D"true">Intel XE#1330</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-lnl-1/igt@kms_plane@plane-posi=
tion-covered.html" moz-do-not-send=3D"true">PASS</a> +11 other tests pass</=
li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-434/ig=
t@kms_universal_plane@cursor-fb-leak.html" moz-do-not-send=3D"true">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/771" moz-=
do-not-send=3D"true">Intel XE#771</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/899" moz-do-not-send=3D"true">Intel XE#899</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/=
shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html" moz-do-not-send=
=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-434/ig=
t@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html" moz-do-not-send=
=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/899" moz-do-not-send=3D"true">Intel XE#899</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@km=
s_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html" moz-do-not-send=3D"t=
rue">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-small:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-466/ig=
t@xe_evict@evict-mixed-many-threads-small.html" moz-do-not-send=3D"true">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
473" moz-do-not-send=3D"true">Intel XE#1473</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-436/igt@xe_evict@=
evict-mixed-many-threads-small.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_compute_mode@many-userptr-invalidate-race:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-lnl-3/igt@xe_=
exec_compute_mode@many-userptr-invalidate-race.html" moz-do-not-send=3D"tru=
e">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1069" moz-do-not-send=3D"true">Intel XE#1069</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-lnl-6/igt@xe_exec_c=
ompute_mode@many-userptr-invalidate-race.html" moz-do-not-send=3D"true">PAS=
S</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@cm-cat-error:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-433/ig=
t@xe_exec_reset@cm-cat-error.html" moz-do-not-send=3D"true">ABORT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304" moz-do-not=
-send=3D"true">Intel XE#1304</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt@xe_exec_reset@cm-cat-err=
or.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-hang-fd-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-433/ig=
t@xe_exec_threads@threads-hang-fd-rebind.html" moz-do-not-send=3D"true">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256"=
 moz-do-not-send=3D"true">Intel XE#1256</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-436/igt@xe_exec_threa=
ds@threads-hang-fd-rebind.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_gt_freq@freq_fixed_exec:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-lnl-3/igt@xe_=
gt_freq@freq_fixed_exec.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414" moz-do-not-send=
=3D"true">Intel XE#1414</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-132753v2/shard-lnl-6/igt@xe_gt_freq@freq_fixed_exec.html=
" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-lnl-6/igt@xe_=
vm@mmap-style-bind-many-either-side-partial-hammer.html" moz-do-not-send=3D=
"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1081" moz-do-not-send=3D"true">Intel XE#1081</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-lnl-3/igt@xe_vm=
@mmap-style-bind-many-either-side-partial-hammer.html" moz-do-not-send=3D"t=
rue">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-fl=
ip:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-adlp-2/igt@kms=
_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html" moz-do-not-=
send=3D"true">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/324" moz-do-not-send=3D"true">Intel XE#324</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp=
-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html" m=
oz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1231" moz-do-not-send=3D"true">Intel XE#1231</a>)</li=
>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-adlp-2/igt@kms=
_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html" moz-do-not-send=3D"true">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1191" moz-do-not-send=3D"true">Intel XE#1191</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">In=
tel XE#1214</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-132753v2/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-=
a-1.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1191" moz-do-not-send=3D"true">Intel=
 XE#1191</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1608" moz-do-not-send=3D"true">In=
tel XE#1608</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-434/ig=
t@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html" moz-do-not-send=3D"=
true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/282" moz-do-not-send=3D"tr=
ue">Intel XE#282</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/910" moz-do-not-send=3D"true">Intel XE#910</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-433/igt=
@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html" moz-do-not-send=3D"t=
rue">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/282" moz-do-not-send=3D"tru=
e">Intel XE#282</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@single-move:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-435/ig=
t@kms_cursor_legacy@single-move.html" moz-do-not-send=3D"true">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" mo=
z-do-not-send=3D"true">Intel XE#1214</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/282" moz-do-not-send=3D"true">Intel XE#282</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753=
v2/shard-dg2-434/igt@kms_cursor_legacy@single-move.html" moz-do-not-send=3D=
"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/282" moz-do-not-send=3D"t=
rue">Intel XE#282</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/877" moz-do-not-send=3D"true">Intel XE#877</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-adlp-4/igt@kms=
_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html" moz-do-not-send=3D"true=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1191" moz-do-not-send=3D"true">Intel XE#1191</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true"=
>Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1608" moz-do-not-send=3D"true">Intel XE#1608</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-8/igt@=
kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html" moz-do-not-send=3D"t=
rue">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1608" moz-do-not-send=3D"tr=
ue">Intel XE#1608</a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-fo=
rmat@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-466/ig=
t@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdm=
i-a-6.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send=3D"true">Int=
el XE#1195</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/904" moz-do-not-send=3D"true">Intel XE#904</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/909" moz-do-not-send=3D"true">Int=
el XE#909</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-132753v2/shard-dg2-463/igt@kms_plane_scaling@plane-scaler-unity-scalin=
g-with-pixel-format@pipe-a-hdmi-a-6.html" moz-do-not-send=3D"true">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195=
" moz-do-not-send=3D"true">Intel XE#1195</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-adlp-8/igt@kms=
_vblank@ts-continuation-dpms-suspend.html" moz-do-not-send=3D"true">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/119=
1" moz-do-not-send=3D"true">Intel XE#1191</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel XE=
#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1608" moz-do-not-send=3D"true">Intel XE#1608</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-9/igt@kms_vblan=
k@ts-continuation-dpms-suspend.html" moz-do-not-send=3D"true">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034" moz=
-do-not-send=3D"true">Intel XE#1034</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1195" moz-do-not-send=3D"true">Intel XE#1195<=
/a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</=
p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-adlp-8/igt@kms=
_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html" moz-do-not-send=
=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1191" moz-do-not-send=3D"true">Intel XE#1191</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=
=3D"true">Intel XE#1214</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-132753v2/shard-adlp-9/igt@kms_vblank@ts-continuation-dpm=
s-suspend@pipe-a-hdmi-a-1.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034" moz-do-n=
ot-send=3D"true">Intel XE#1034</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1195" moz-do-not-send=3D"true">Intel XE#1195</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-suspend:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-adlp-9/igt@kms=
_vblank@ts-continuation-suspend.html" moz-do-not-send=3D"true">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034" mo=
z-do-not-send=3D"true">Intel XE#1034</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1195" moz-do-not-send=3D"true">Intel XE#1195=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/927" =
moz-do-not-send=3D"true">Intel XE#927</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_vblank@ts-co=
ntinuation-suspend.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191" moz-do-not-se=
nd=3D"true">Intel XE#1191</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608" moz-do-not=
-send=3D"true">Intel XE#1608</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-adlp-9/igt@kms=
_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html" moz-do-not-send=3D"tr=
ue">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1034" moz-do-not-send=3D"true">Intel XE#1034</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send=3D"tru=
e">Intel XE#1195</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-132753v2/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pi=
pe-a-hdmi-a-1.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1191" moz-do-not-send=3D"t=
rue">Intel XE#1191</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-436/ig=
t@xe_evict@evict-beng-mixed-threads-large.html" moz-do-not-send=3D"true">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1195" moz-do-not-send=3D"true">Intel XE#1195</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send=3D"true">Int=
el XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/392" moz-do-not-send=3D"true">Intel XE#392</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-466/igt@xe_ev=
ict@evict-beng-mixed-threads-large.html" moz-do-not-send=3D"true">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"=
 moz-do-not-send=3D"true">Intel XE#1195</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send=3D"true">Intel XE#1=
473</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3/shard-dg2-434/ig=
t@xe_evict@evict-mixed-threads-large.html" moz-do-not-send=3D"true">TIMEOUT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041" =
moz-do-not-send=3D"true">Intel XE#1041</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1473" moz-do-not-send=3D"true">Intel XE#14=
73</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/392=
" moz-do-not-send=3D"true">Intel XE#392</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-132753v2/shard-dg2-463/igt@xe_evict@evic=
t-mixed-threads-large.html" moz-do-not-send=3D"true">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-se=
nd=3D"true">Intel XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/392" moz-do-not-send=3D"true">Intel XE#392</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3
          -&gt; xe-pw-132753v2</li>
      </ul>
      <p>IGT_7819: 98e0d03839ce31141328a2935eb193361eca61e3 @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        xe-1164-b489bf6605759a57c37295c2025e5ee392b88ff3:
        b489bf6605759a57c37295c2025e5ee392b88ff3<br>
        xe-pw-132753v2: 132753v2</p>
    </blockquote>
    <pre class=3D"moz-signature" cols=3D"72">--=20
-shekhar</pre>
  </body>
</html>

--------------wADzHctydj900tde5opbkf2u--
