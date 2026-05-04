Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4285AFF885A
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 18:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BF310E7F4;
	Mon,  4 May 2026 18:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A6fB3XIf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7905D10E7F4
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 18:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777919560; x=1809455560;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=L0F/cLYspo25fqTtw1wjDL27NXDadhLt33kAeXqhXw0=;
 b=A6fB3XIfGVjQESgjMBcLLT5S8bjlXlm/tPuk6ONhOksWFU5gilZJXrbs
 dkb6josvvGRXfgGGYKCFbFvaNPhVM7Z1i42k5Nljm+7a/gftVEdF0JCl3
 h6fuBjIBr8nu4eqyxi4xirkcLzcevsJuS4qeQcVxC2of1zBKjalXBdCLX
 SHDVLuFQBXRZev3T+HvWZOVX4zxHGDPoCIm5Kt4NNyYhM7LIqfoSx6ye5
 /MBP3VI27ZXazb9E3UKSQ4+hYJKotHrPHcoLcYa5mQY6tuLK6i4b2tvnn
 bh9RNJaC33FDACVMKTOkB//lUeT7E1R17IYk8PVIFijugiOwE9lCZBz1i A==;
X-CSE-ConnectionGUID: ltdbUX8oRYC4u3EFi1chEw==
X-CSE-MsgGUID: jUk9lOMISPedxaSdCXfXKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="82650486"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="82650486"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 11:32:07 -0700
X-CSE-ConnectionGUID: LjStwrGzTvSkeFmgJCCZuQ==
X-CSE-MsgGUID: bRmSEJ74QGiwyu246ytk2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="258942555"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 11:31:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 11:31:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 11:31:27 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 11:31:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J41nEoCz07V0w0MJwrLTXyQhvOMK0Mz+AsUd84HQb/heTCJ25V7Yz10UqRpR1uLippXP0+4cPaSuL0pI26jtf01mFFmWtpNabBwn8thhpQbOBH2j451knYT5hkWCr+FL1QlYEDfrTbQkAjfU67rdxXVEBlRrWHNx4z7siiF+CKL2TjeyQg82UUke0EuWYT5skIJ8ixgyuZTprsZVx23g77YYHUcCZGBgj2Ul0Flq0tz+R+XxWy5AVOEIp04wqKgVUTC/63h+iXagqj1JegKTEQ/Ljg4ANFR2Z06AeSA5xQ5tX4gM6P8DXaKhAoICHTz7VYtSHWdYreaMGMLbNNzxDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/0fJ1pPiPNKF6hJMkbdP7ejgq7mdCr227v3IftAt0U=;
 b=B7PKmUfvVIiz0IXaSAo75VyGy27QDh2OErtcNV0elOpLXFFt+KKoJR39pTcsX5R+hTRGK78u8L3isScnBC27K9QQ9Rz8QwfFnVojkwWbrlQJaSQ3nXjXKXof8xwHbJrlEpc9wD85l/jAkIeTK4GrSgVOLug0Mi0a0pb1m1tT9FHNZTnVjvXfV4AwlxcbuCkb7idzYLF1BT/z6xew6YpAGaIU9aYe0B5oBCxB4htFwRbVu0s9jGrjFayKXAyOHObpsbTKbAcFbODCf9LXehKHB3UEHEOhxDMf+8Ab4/EYw/J2+MdMr9Itx8welWMr35zUq+rbEMeTkOokpLlWSllPPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB8161.namprd11.prod.outlook.com (2603:10b6:8:164::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 18:31:24 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 18:31:24 +0000
Date: Mon, 4 May 2026 14:31:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, Riana Tauro
 <riana.tauro@intel.com>
CC: Stuart Summers <stuart.summers@intel.com>,
 <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <Michal.Wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <daniele.ceraolospurio@intel.com>,
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH 1/9] drm/xe: Rename survivability_mode to
 enable_survivability_mode
Message-ID: <afjl938sUW4yzYWF@intel.com>
References: <20260504044348.209625-1-stuart.summers@intel.com>
 <20260504044348.209625-2-stuart.summers@intel.com>
 <87bjeve215.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bjeve215.fsf@intel.com>
X-ClientProxiedBy: BY3PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:254::12) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: 93c1c54d-0fdf-4469-1db6-08deaa0b587c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: xA8fvK36w6MeEM3OAy53k2LvN1U46jnoDEejO79GjJVFjTgDg91HNfCKejiC9DgAYJprv5gh9k3CNfp9VvgS1eXUUrPozEDrv5q8PmwLqQ8Y9dq5LsV3fDCo4IBOTZrleIJ4t+CUxtFfZ53fdqVzXaNLNsOWFuiXu0laoMVn0K63HAMzyD7FsDdVKyDBASSvofgOHQmTvOCURoS9OVg0lTkBnpTwIBTr9FssU/nE/RHJBJXUnahsOg+n2lmxpx3gIvH9FuAhevryq04a9832QT0+sPQjcmmNANbi+TYols0TCuEl2OCVOgpxALURiUyfojNIOc6MnI4iItcpjwBpBaLumZecCeNA5xxM5Jqd72WJrp+TPkgZH0MDI1zKerMGRzzCpY5v/8L8OHYwLmmkOdT6yElZKq2l+9BC43kVI+p0zL85c2Nq66aQcIsN5F0W2usNLhB2WNVIlOjVazAZMBaIdfj6xbekH88qwkqX+M5sr5hWOeYtIqFy26z2bU+WMLomDYQIzyMwHDN/Fcc0/iiJVN6J8BUPw5dnIQYh6rRqUPgE8PT+0aOcDm7jbUKoWxbRnfbXZIMk3TJrSwkxXsyv40eOEq6qP4geO6kc1e4vtJ+XQAeyNOy6cyUbxmcw14LlTajxQXU9zMA32vbL6pKmDufLLA8rLxd7iRQ/Sv9avJHuS55GMLZKc+3rEdGV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2luZzA3eFlobFJZMFVTakhTaXFhdE5zRFoyNmQ0TWtqL1MrQ1pTSmJ6ZzMr?=
 =?utf-8?B?WGFibGp3eUtiRWl4OGlXU2VuSTFTRUhWLzZMY3pzaGVnWlVqSzZiQkRLaDdK?=
 =?utf-8?B?eG5Kb1l3MjJHUGpLWTRuNlUzd29EVktnVitOQXc5MlNZblR3Z29KaVd4UVlZ?=
 =?utf-8?B?Y3NlSit0QWswT2tBMy8xVmUveHpUS3RuN1VzalBHRy9kTE1SVlZsdkJNa3Rj?=
 =?utf-8?B?bDFMdERGaGVubHZIUFVndSsrVjdOWTJ4TGxUVHEzRzRLSVlXMXN4UndVdXk4?=
 =?utf-8?B?aFR5c3d1T0gxQ2NLRXVRZkloYWprRVdQU0QwcjF1QThEckVKZ1hadGVMa0Vv?=
 =?utf-8?B?SVM2Mml4NjZITHk0QXFmOVpaVmF2ZFZzNmIySllDNXp1bDYwb3dmdktRQXFt?=
 =?utf-8?B?ZXEvUVI1TCtsZGVvMUxReGFTbk5uaFhIWnhib3A0MlRneEhRUGhMVHVrWHZz?=
 =?utf-8?B?QlhOUk85emYxQWk4cWVQRGtkSC95OWpWTng1N2FnZnlVM2w5cUFjZ1QwNXRR?=
 =?utf-8?B?QU5UKzJqQ0RkNGpWNVdhTm5PQ3cyaUpTUEg4QW5ySm42WjY4TFJBSnNVN3U1?=
 =?utf-8?B?WDJRQkV6YUhJcnJ2cnZSa0krdmM3K0dXYzUxdWJ0ZkdzSUQrWHNmS2ttV1ZJ?=
 =?utf-8?B?VFh0bjM3bGo4NWd4RTNFcEdBRlIrdGhnTko3V3k5aGZRekFSOUhpWHVOdUw0?=
 =?utf-8?B?ZjdLYXRKNkZEMWp4SVNkaThxNlR4YVc0akVHb21KREk0aGVLaU9DNGNoSjli?=
 =?utf-8?B?cGQ4ektKZ25OcGpRcUo4ejVBTHJ2dkpjV1JnMTFhT2ZoTmk0c2x6SkxuVGwx?=
 =?utf-8?B?MjZRajZoYTJoODFWZDhvSTFPaThyNHNGL3ZKS0c3U0d1MER4aWFGTFBVYTFX?=
 =?utf-8?B?MzN5SzVHK0sxbnlVYjlsMXlFOVdwTzVVOFFBM25xM0ZOcnJOQXhONGVvZmtk?=
 =?utf-8?B?MW1TeC91a3A0TytGZmJjOWs2WG1Db1V2K3hGR2VmQ1IxY0RMdFFrL2VESTlj?=
 =?utf-8?B?UHgxc1NoKzk2a204WEJBaW8zdk1vVE92RXRxV29OQWxKVEU2YjV2a1kxL2l5?=
 =?utf-8?B?cG0zUkF1eEZXZ09VNjRiRVBPT05GckJTclVMRndxUXNUV0pNYlB6djYzMkdQ?=
 =?utf-8?B?cmVVMEJUS1dUU1pVTEhoZURPcE1mNmI0akJhTTY0VXB3U25sUHFEODFkMFlB?=
 =?utf-8?B?NmdPRXFLQlNnV3g5OVBYVzV0cTlqdW5GYUFkOGdSUEpJSmY2c3VDWEdUUkMx?=
 =?utf-8?B?TE1MbTRDVS9QQ0hOQnhzamNNQlp1TEtPZVJPbFNGcHFPMlBPcWF4Uk5VeEox?=
 =?utf-8?B?bEwwZHA1dFFlMTNCMzRLWllqNVkyN3RiYVB0YnF5MWljQlYzTldKcklBaDg1?=
 =?utf-8?B?T2RVbEI3NStneWRTdnNSaG16QWFsd041eFlmMVRNMlVjbGxaYVR2Y3dBakJY?=
 =?utf-8?B?THp0QzBHRGlHWm9hRlltU0pSRVVzSVY3cmpKeXdJb1owZVB4MEZOcldQcHhF?=
 =?utf-8?B?R3A2RlFFYXVXcyt4WFFycnI4VEtZZkZjVmVDUHZrbE9KdEJuM2RHV0Q2R1BE?=
 =?utf-8?B?MUVJYStiTmJqSlFRZGdXNUJnYi8yd1NPMi9USGRjUGVVVCtkSjNoVVRvdU4v?=
 =?utf-8?B?cjZhbkV4NEE5MUhNOGZDb1ZrSVFOTGZpUnNPbGk0aUdVb3d5dDhPQXVsTWlX?=
 =?utf-8?B?Tk4rY0dHRHlNV29XYVF2N0s3VlJQcndrcWUvbHlmK08yUW53c2dZazUvb3pK?=
 =?utf-8?B?WTQzdjFJNTc4bko3eFRIeUtqMTlCU1ZZTXB4U0o0TVVRbjQwaXFWb3d3Vi9D?=
 =?utf-8?B?cVl5Snl2L3JoZHA4Q1Z1Sld6WEhXQ0dNTDdXVmMwaExrQXFhaG13b0ZzNkhz?=
 =?utf-8?B?My94dXNMVWpnc0VzeWhEUytLMlhPNFFxR3V2djhKR1BKSUorWkJmNVRXMURr?=
 =?utf-8?B?cEpZTURzUllvWmFETTQ2OVJaU2treHBkVFIzTG1aWFptNVZBWncwN2ZWT3Vl?=
 =?utf-8?B?R3ZLeFIvd0p1WERYNjRMdTNYM2w1N0pYb0cxUUFOdDIvamE1Vm9pRmFRQ25J?=
 =?utf-8?B?T1VVaStpdGdJdTlNbGcxUW1OMGlLY0E5eHFiUjZVWFZoUE91Zy9DYi95RVUx?=
 =?utf-8?B?TFhPVUswS0loc3p1bnNXY01teFZIZ25NL1NJZ29CaUpmdi96NkVlSmtKRlIr?=
 =?utf-8?B?cEUybXEyenlpTmNsUFZTbmYvU2FyK1dzU2UwcS9YK05nZTNEQ280SU82UnJB?=
 =?utf-8?B?TVp3Smg5enkxU05Dd3J0MWxyWktkSW9zSDNEWFl5Rnl6UWozR0VDWWEydE9T?=
 =?utf-8?B?cFRXVUNBenRTUnlHOUtpb1JWZExJdnp6cE5RVGFOY1BHdUM5MVBBQT09?=
X-Exchange-RoutingPolicyChecked: lB1Pec+6y1kQe9sXc7hNrIKe+r+OA4d08ai4dbyIYZfX2ZDr3FaOMs0F0/edetbqgY9Ows2Cfrcgr0hXl/lU1L0DJdkf0Czg1RqxW63kJVyWTgG0HWHSYWcD1QRbx3gV25pZ3goESJ3/dDjaB13V39jMrCPaMHMlcWSBmLQfVl0zhKb0gA5uyXSr8EaAeBf0dI2A+IVRC+WO6vVJiCVdJ8Aagm2RIvAE3fveOD/dDQKUJLppQDKxoRIgnpwy4WE50frOkjcsqREthDM7EA5KCh+fPaIoAss+PZVD+yNBqPzNPGpKXisi86b7nDfAKLIKqxxLC5Kl5Htmqh3yV2j6Sw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c1c54d-0fdf-4469-1db6-08deaa0b587c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 18:31:24.3978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XkYPIs08PtNmrNHxxiHI3JZkB9aouah/6/9kjCHFD2MFw/AuhxdiIYkEZJeoXYbpVvoKl/AbWmeWotZJyJGtuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8161
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

On Mon, May 04, 2026 at 10:29:26AM -0300, Gustavo Sousa wrote:
> Stuart Summers <stuart.summers@intel.com> writes:
> 
> > Rename the survivability_mode field in struct xe_config_device to
> > enable_survivability_mode to be consistent with the enable_psmi naming
> > convention used for similar boolean config flags.

I don't believe we need this level of consistency.

I'd like to keep the survivability_mode as is because perhaps we could
perhaps even expand to multiple different modes later instead of only
enable disable flag?!

Cc: Riana Tauro <riana.tauro@intel.com>

> >
> > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > Assisted-by: Copilot:claude-opus-4.7
> > ---
> >  drivers/gpu/drm/xe/xe_configfs.c           | 39 +++++++++++-----------
> >  drivers/gpu/drm/xe/xe_configfs.h           |  4 +--
> >  drivers/gpu/drm/xe/xe_survivability_mode.c |  2 +-
> >  3 files changed, 23 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> > index 32102600a148..69abc69ec0f3 100644
> > --- a/drivers/gpu/drm/xe/xe_configfs.c
> > +++ b/drivers/gpu/drm/xe/xe_configfs.c
> > @@ -58,7 +58,7 @@
> >   *	│   └── ...
> >   *	:
> >   *	└── 0000:03:00.0
> > - *	    ├── survivability_mode
> > + *	    ├── enable_survivability_mode
> >   *	    ├── gt_types_allowed
> >   *	    ├── engines_allowed
> >   *	    └── enable_psmi
> > @@ -79,7 +79,7 @@
> >   * Enable survivability mode on supported cards. This setting only takes
> >   * effect when probing the device. Example to enable it::
> >   *
> > - *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
> > + *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_survivability_mode
> 
> I think we have not documented our configfs structure in the kernel ABI
> documentation.  Are we supposed to do that?  Is that not yet done
> because we do not consider our configfs stable enough to be classified
> as proper ABI?
> 
> In this example, we would be potentially changing what some would call
> ABI, hence my questions above.
> 
> --
> Gustavo Sousa
> 
> >   *
> >   * This attribute can only be set before binding to the device.
> >   *
> > @@ -260,7 +260,7 @@ struct xe_config_group_device {
> >  		u64 engines_allowed;
> >  		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
> >  		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
> > -		bool survivability_mode;
> > +		bool enable_survivability_mode;
> >  		bool enable_psmi;
> >  		struct {
> >  			unsigned int max_vfs;
> > @@ -279,7 +279,7 @@ struct xe_config_group_device {
> >  static const struct xe_config_device device_defaults = {
> >  	.gt_types_allowed = U64_MAX,
> >  	.engines_allowed = U64_MAX,
> > -	.survivability_mode = false,
> > +	.enable_survivability_mode = false,
> >  	.enable_psmi = false,
> >  	.sriov = {
> >  		.max_vfs = XE_DEFAULT_MAX_VFS,
> > @@ -357,20 +357,21 @@ static bool is_bound(struct xe_config_group_device *dev)
> >  	return ret;
> >  }
> >  
> > -static ssize_t survivability_mode_show(struct config_item *item, char *page)
> > +static ssize_t enable_survivability_mode_show(struct config_item *item, char *page)
> >  {
> >  	struct xe_config_device *dev = to_xe_config_device(item);
> >  
> > -	return sprintf(page, "%d\n", dev->survivability_mode);
> > +	return sprintf(page, "%d\n", dev->enable_survivability_mode);
> >  }
> >  
> > -static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
> > +static ssize_t enable_survivability_mode_store(struct config_item *item, const char *page,
> > +					       size_t len)
> >  {
> >  	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> > -	bool survivability_mode;
> > +	bool enable_survivability_mode;
> >  	int ret;
> >  
> > -	ret = kstrtobool(page, &survivability_mode);
> > +	ret = kstrtobool(page, &enable_survivability_mode);
> >  	if (ret)
> >  		return ret;
> >  
> > @@ -378,7 +379,7 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
> >  	if (is_bound(dev))
> >  		return -EBUSY;
> >  
> > -	dev->config.survivability_mode = survivability_mode;
> > +	dev->config.enable_survivability_mode = enable_survivability_mode;
> >  
> >  	return len;
> >  }
> > @@ -815,7 +816,7 @@ CONFIGFS_ATTR(, ctx_restore_post_bb);
> >  CONFIGFS_ATTR(, enable_psmi);
> >  CONFIGFS_ATTR(, engines_allowed);
> >  CONFIGFS_ATTR(, gt_types_allowed);
> > -CONFIGFS_ATTR(, survivability_mode);
> > +CONFIGFS_ATTR(, enable_survivability_mode);
> >  
> >  static struct configfs_attribute *xe_config_device_attrs[] = {
> >  	&attr_ctx_restore_mid_bb,
> > @@ -823,7 +824,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
> >  	&attr_enable_psmi,
> >  	&attr_engines_allowed,
> >  	&attr_gt_types_allowed,
> > -	&attr_survivability_mode,
> > +	&attr_enable_survivability_mode,
> >  	NULL,
> >  };
> >  
> > @@ -847,7 +848,7 @@ static bool xe_config_device_is_visible(struct config_item *item,
> >  {
> >  	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> >  
> > -	if (attr == &attr_survivability_mode) {
> > +	if (attr == &attr_enable_survivability_mode) {
> >  		if (!dev->desc->is_dgfx || dev->desc->platform < XE_BATTLEMAGE)
> >  			return false;
> >  	}
> > @@ -1098,7 +1099,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
> >  	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
> >  	PRI_CUSTOM_ATTR("%llx", engines_allowed);
> >  	PRI_CUSTOM_ATTR("%d", enable_psmi);
> > -	PRI_CUSTOM_ATTR("%d", survivability_mode);
> > +	PRI_CUSTOM_ATTR("%d", enable_survivability_mode);
> >  	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
> >  
> >  #undef PRI_CUSTOM_ATTR
> > @@ -1128,20 +1129,20 @@ void xe_configfs_check_device(struct pci_dev *pdev)
> >  }
> >  
> >  /**
> > - * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
> > + * xe_configfs_get_enable_survivability_mode - get configfs survivability mode attribute
> >   * @pdev: pci device
> >   *
> > - * Return: survivability_mode attribute in configfs
> > + * Return: enable_survivability_mode attribute in configfs
> >   */
> > -bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
> > +bool xe_configfs_get_enable_survivability_mode(struct pci_dev *pdev)
> >  {
> >  	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> >  	bool mode;
> >  
> >  	if (!dev)
> > -		return device_defaults.survivability_mode;
> > +		return device_defaults.enable_survivability_mode;
> >  
> > -	mode = dev->config.survivability_mode;
> > +	mode = dev->config.enable_survivability_mode;
> >  	config_group_put(&dev->group);
> >  
> >  	return mode;
> > diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> > index 07d62bf0c152..517de4946d35 100644
> > --- a/drivers/gpu/drm/xe/xe_configfs.h
> > +++ b/drivers/gpu/drm/xe/xe_configfs.h
> > @@ -18,7 +18,7 @@ struct pci_dev;
> >  int xe_configfs_init(void);
> >  void xe_configfs_exit(void);
> >  void xe_configfs_check_device(struct pci_dev *pdev);
> > -bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
> > +bool xe_configfs_get_enable_survivability_mode(struct pci_dev *pdev);
> >  bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
> >  bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
> >  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> > @@ -37,7 +37,7 @@ bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
> >  static inline int xe_configfs_init(void) { return 0; }
> >  static inline void xe_configfs_exit(void) { }
> >  static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
> > -static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
> > +static inline bool xe_configfs_get_enable_survivability_mode(struct pci_dev *pdev) { return false; }
> >  static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return true; }
> >  static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
> >  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > index db64cac39c94..7c85bdb267af 100644
> > --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> > +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > @@ -377,7 +377,7 @@ bool xe_survivability_mode_is_requested(struct xe_device *xe)
> >  	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE)
> >  		return false;
> >  
> > -	survivability_mode = xe_configfs_get_survivability_mode(pdev);
> > +	survivability_mode = xe_configfs_get_enable_survivability_mode(pdev);
> >  	/* Enable survivability mode if set via configfs */
> >  	if (survivability_mode)
> >  		return true;
> > -- 
> > 2.43.0
