Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEF5C4828D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 21:39:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E3A112E7E;
	Tue,  6 Feb 2024 21:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JhuiAKL3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2061E112E7E
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 21:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707255547; x=1738791547;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5+zXAr/r5vrBEdNhmyae6jmG80vt9ZWkOFmbyUhM+SI=;
 b=JhuiAKL3HsgR4D3QQxrQ5Ogr/Ci0cjZMiNhQMReusQcPbFBNqXO1RS5n
 jK3kZ11WqCxpDGRRAEHgJq75sM9SaiYPPEBiWzBcZr4iwcan/OuWyInRZ
 9f3kmtT3pv5GltIKB6RjMkKRiTuwVwcFc7HbV3UcPPKRmiGh7AtE+MPLT
 WP6nnIJuTQL2WxzYXrSBBytcUNC1lgmPuewwhgiZgRBFwKcQLfoJ7VOMa
 yScLJc/EPcK6txHnZCSDa/2lu/lf3/ctvD3/+udqNObs7KZvY8YsPW0kF
 ZqFb46q2q/ZAETcP61k6NJ7SmKKnKkVZo/v69B/S42PKfVltFFlzRfOPM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="18369389"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="18369389"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 13:39:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="1134649"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 13:39:05 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 13:39:04 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 13:39:04 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 13:39:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAPx2P60pzqbU6WIaY1cE0rbhBrfqeWbX04Uz8u7Zr3M48jfw03nZ52xY46ID4xWM1x/pCOzW4pfG9k3CpepntGyawePKxo22L7EAc8elWM0bZM4WtAosVamefbNjsalEOQeWrUDfw01VjlDwemxiPncQ/gJXrA5mIEEo6z+NQrKusHSTGop20V3F5+CEGzGFBh2XKMwqNgLvAD7zJSlfLfLhA0wFPLcon5KmGDopiXoYqYjYbLkkbuXtZcyifBEFMhGY8qA/ZH/e7yBNijsDFp+hm7uOPVJOL/HqL31O96Y0MAROo47REMvTl4PJSFOR/dnc0Vb13BxM5qbHABzhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SW4C6+hHytDFR/gt9EoT3m1SSIssvCgz77jhw49wh5k=;
 b=obs/cK8O+8BWdO0KzWpraTjbwcbbS99AUWGBBHRZN9Tb218F1z1/2tPgVx31s6HOaV6qMnxcRXXopA3147O82wWMKCCNSiPb45JzReHwRALOAA67aeQ2Nvq3NpUzr/KFtx9s9VrYrTu3Tc2b2GaOd7Cnl26zHur3mB2iP3LGpV6EjAdEadnICPxmjnyGgoRne/xwUecD1uG5cKSz6SO0CHTl4h8caikyECF99zwHGqvzNmBSldPA9CKzi7rMlhbvc/k96F00JdBU/hab9mQUU2d4wRZMgm49N1jKYXfBSxLtz2vXNEiW2MrzbYBJAwJZqYXcwmYnB8DhnEU+qVE+iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4604.namprd11.prod.outlook.com (2603:10b6:303:2f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 21:39:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 21:39:01 +0000
Date: Tue, 6 Feb 2024 15:38:59 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: Re: =?utf-8?Q?=E2=9C=97_CI=2Echeckpatch=3A_warnin?=
 =?utf-8?Q?g?= for drm/xe/xe_gt_idle: Drop redundant newline in name (rev3)
Message-ID: <ojbwfctuaj64udqy4jcia7mx5yxwsxukwcvuluoefq2k4263rq@524xrac5okl7>
References: <20240206192731.3533608-1-ashutosh.dixit@intel.com>
 <170724786027.1056684.5371544289872780995@5338d5abeb45>
 <858r3xbczc.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <858r3xbczc.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ2PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a03:505::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4604:EE_
X-MS-Office365-Filtering-Correlation-Id: ffac4249-e930-4713-ac1e-08dc275c0828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kLFWiruDM0GCWaVRXGxTjWGgVmDYW/BJfVhE+ipyHw+endtcvrBT+jbknxQnNqrgv+Rbr5H6VXM9yh53hgWTYiKikSy7nv0d9XnvzibHdR/BTEdR74Lay2eSl2SQTZ2BZu3fs3tfi70smB6OJRDyA8grj95BkkGgz4MsPYUlbzTK/TPH7/KBf17w1bfG9dbphEoXZ1cveOU1SsEEBW0cPMH6oW3XLFz0c7OCML4jjzcS+gnVf4DPSFqoF512ixvPJnnCEWH3/5HIla8USuNv7tEkKgjHI21zDdmx4gJQHxVrunkhVyWJwBG3abIcOXbQkNQ9bCxUUc+c+48epAdeIma7GFVfpIaTON/ppu6nrxQUJaMKVxX1b1t6mJpDJBC5CTMkZ0rcN9XmtWnA/jZkTru9Hhp6GqXryw/82xt10gOzEVYfDtUbzFgxceXWbBl6Ud/hE7RaaBZgdt6aPMoSl/Vpaz8wIev/8AXcUXXjFwC+NLSBWTnvGPz/TlY+WU0Iz3kIABoMbOHZ8A9PTB0kLta4eBZhy35Yhxi9s/hRnITVTscyzbEvU/OOHmhEyqmPeSDfMjlVVNvfOsBh+cp3tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(366004)(39860400002)(136003)(396003)(230922051799003)(230273577357003)(186009)(451199024)(1800799012)(64100799003)(2906002)(83380400001)(38100700002)(82960400001)(41300700001)(33716001)(316002)(6636002)(26005)(66556008)(66946007)(66476007)(4326008)(8936002)(86362001)(6862004)(6506007)(6486002)(5660300002)(9686003)(6512007)(478600001)(966005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5S9KNuc8KcDCWDsHWXH008b+4l4ZridF86tFYTXaTN+hkvBQ6kzo+bCqj/bv?=
 =?us-ascii?Q?VMxKzVxI8fjT6dToP2epNZ0ZTcbJp5CU+NllLlLMsp9BstNUAb4xg6+juv4K?=
 =?us-ascii?Q?WLHQoFFXTESbE09A/8tEim7l8dnRa2+T6COKL+fFJQBxGZisd1QqqFsf+q6v?=
 =?us-ascii?Q?tbWLyaKJ1rvsryAXLEb6g7bpw/QiYtUyt7X/8hzjAs4qe9wXiF4/s+cWQ+5e?=
 =?us-ascii?Q?PWVSXezXKokFt5i+Cthchk3ioXdsTj2pkoROVKVqsFEie6BXaOmJ4h/GoXjp?=
 =?us-ascii?Q?N+Nx4Np+reiEyiyTIv02eOBTvgptfngXIC+DyGR1CDJdOBnwKnBvbGHJ8Gwl?=
 =?us-ascii?Q?PrD5gW/ZJC8S5ujdBFOkabYcjj+G07/86UayTm1H1OEf6kmpzSbhbEezyxhf?=
 =?us-ascii?Q?Gh1Y3/yYLJS4IKmpVRNy+7NQ1YzT3V7cTqtdI5xE5FYfv1KECiWffXhzJ3Ue?=
 =?us-ascii?Q?k+P7LE9OtP6AIHx6EHy6ujYZ8LVGeKMZqmjLkG5zN1v2DXAJcDP3RMFzkwTk?=
 =?us-ascii?Q?0lU2Xa3mx9hdXZwhJugPVVDAhQ/jWyYf/lSSDQ908IKsyBweNg4PDCkmRCN1?=
 =?us-ascii?Q?ATM9F2cKrlqqlnoPSwRrHitgdYhqWLoLAXATq3+RHAPO4mSS7Vsuqai1tfTj?=
 =?us-ascii?Q?ofsageN2JEcN+IkL5prAA8nffwAfYhmiCYfpnC6kjJJNmd5Aw/4tMZucM2wO?=
 =?us-ascii?Q?T8sPVae3XVHpZCATfk6rbc+h7LSxMYLcdv2vI/viAjsQbf3W6RfHPkvnsGH1?=
 =?us-ascii?Q?EtOCkOscCxZkgUn65+0Op5byMPlnXpAycGKOIf0MaAxGmxZsDP2jT86gHtez?=
 =?us-ascii?Q?PV9i6cDshWgWGIDkt2Y/uAkw0i2irE+EgFr2IZ3QLIGwLHcAuM2aoUGgIs+n?=
 =?us-ascii?Q?8R+3iXA9a6l8MGnaHmaQt7YPb2Y69YcuGzKbe3E82hNwvdB8Khja7OIm0/Ty?=
 =?us-ascii?Q?Os5T8Niostc5AztOQapNcji0UomacAwFvsIgKcc2O8/XcfFYNQgpupbEHSlJ?=
 =?us-ascii?Q?XuutOsQQvjHBIIqzIlOxEdqPM97s9v6mhNHkaIdJW10RH1PlYsZ12Z3utj4f?=
 =?us-ascii?Q?fwSmgaNG7pe581N3+k9xRxNj5QjdR5Bqo8dJnpcfKoLbL554y4m6QpYijNQ7?=
 =?us-ascii?Q?aaGrpm/GEFRbARSsBtC4QBDnYXV1bAL1OVLLt4OCn7s/QYB4OSuVLg3RC2It?=
 =?us-ascii?Q?o5EjlKL+cABnYw0vW8lceiGoD0CsU6HacNbsCFBCiHFl031BEpjH+nP3xuAR?=
 =?us-ascii?Q?d9YIr7JSsu1jNvPTgw2WkdTJuCuMO4D95d1ugJBLz/FF4kBXWglFD161+u9Y?=
 =?us-ascii?Q?UzhBk35GALXmQPw5Y5dOz1XaJCub3t7zAINaGeXJIgQWGvaAv4AVHG82+rKQ?=
 =?us-ascii?Q?GMbem/AUjZ0rpa4YNHiQYW4kOm4lpaQkELHsEa/KFdojZy/wCpCH0PgUN4QY?=
 =?us-ascii?Q?qF133jNzvIzzzz2fIb/wQuo9+/B4TP3oZTNgF3RtZNvOtepFXN4LPSUSiPFZ?=
 =?us-ascii?Q?ROCs4YGqelYlIZBWl+ruDtotgfj9ZhS9cmS2/l2qE05sW9Loojdx/pT50gpV?=
 =?us-ascii?Q?cWb+erJ3iR+K/6byHy+vIeRxKzGsKXkxhh1nCq6CA2JfT4sEKoUKRplb5Poo?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffac4249-e930-4713-ac1e-08dc275c0828
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 21:39:01.3969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b55djxDfaFfA/p5W5aox7PxT72mOLgQ5+O48IIe8R6wUMhXJpeBOo2cz1OqFJ/4YCmNo4ZOl3JSLufPDQ6Amgyuogxc0Mtv3q3J7whU6yVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4604
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

On Tue, Feb 06, 2024 at 11:37:43AM -0800, Ashutosh Dixit wrote:
>On Tue, 06 Feb 2024 11:31:00 -0800, Patchwork wrote:
>>
>> == Series Details ==
>>
>> Series: drm/xe/xe_gt_idle: Drop redundant newline in name (rev3)
>> URL   : https://patchwork.freedesktop.org/series/129495/
>> State : warning
>>
>> == Summary ==
>>
>> + KERNEL=/kernel
>> + git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
>> Cloning into 'mt'...
>> warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
>> + git -C mt rev-list -n1 origin/master
>> 35591fb8b4d5305b37ce31483f85ac0956eaa536
>> + cd /kernel
>> + git config --global --add safe.directory /kernel
>> + git log -n1
>> commit 37e8820af8f2d82261e27714f2c1d6aca2043e91
>> Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> Date:   Tue Feb 6 11:27:31 2024 -0800
>>
>>     drm/xe/xe_gt_idle: Drop redundant newline in name
>>
>>     Newline in name is redunant and produces an unnecessary empty line during
>>     'cat name'. Newline is added during sysfs_emit. See '27a1a1e2e47d ("drm/xe:
>>     stringify the argument to avoid potential vulnerability")'.
>>
>>     v2: Add Fixes tag (Riana)
>>
>>     Fixes: 7b076d14f21a ("drm/xe/mtl: Add support to get C6 residency/status of MTL")
>>     Reviewed-by: Riana Tauro <riana.tauro@intel.com>
>>     Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> + /mt/dim checkpatch 8a42fafc783505db4f1d6a70005a5f103069c9d9 drm-intel
>> 37e8820af drm/xe/xe_gt_idle: Drop redundant newline in name
>> -:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '7b076d14f21a', maybe rebased or not pulled?
>
>Warning is incorrect, 7b076d14f21a is present.

I reported this issue some time ago... CI does a checkout of drm-tip
--depth=1, so when it runs checkpatch it doesn't know about past
commits :(

Lucas De Marchi

>
>> #12:
>> Fixes: 7b076d14f21a ("drm/xe/mtl: Add support to get C6 residency/status of MTL")
>>
>> total: 0 errors, 1 warnings, 0 checks, 12 lines checked
>>
>>
