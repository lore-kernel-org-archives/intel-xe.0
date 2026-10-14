Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDD2C3DA7A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 17:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9A210EA81;
	Wed, 14 Oct 2026 17:54:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1F510EA81
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 17:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792000466; x=1823536466;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uh3eLJoLNjwNd51PWperAP7rv6V2+Oiwep9awxxTV4c=;
 b=mut5Fe3hWmZ9xMzg1mQIIUDIztJgGqBigEia8hFqra5D7Xu+/2baK3h0
 mIqhb4aMEk7Bw9kw/82wyWDePNxYOXZeGz+CcjWJqj7S82AA4U8FDD2PM
 DNXq1kJXPJIlrZ3T8r8u8zTO9/ecf1BNnDmV9Ut5c8Kj41NvBO2IIs1V/
 WVHB0Vnq767LsDGOSQXDYEir8KJgbX+T+c000q2kulxwRlaoVOgmUapxa
 nJEbHg6/XCL8f2GGnlR1xjNG1pyyX7NKFL6zsSbf1+g+lGBV/68rqaw7C
 H5haL7lWIB2jiDv/B5LCzn4sfAn7LHbzkSQyL0yS/z5sR4QxibfZcN0iQ w==;
X-CSE-ConnectionGUID: vxbUA0tbQnm1tsdh+2Q07Q==
X-CSE-MsgGUID: 2hGaIhFYRl+ltRYXe6ykEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="760962"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="760962"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 10:54:20 -0700
X-CSE-ConnectionGUID: dLbB+UmKR6uzQL6Ej5HRQA==
X-CSE-MsgGUID: gy0XlcbDRnW+tPns2JwWaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="3235424"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 10:54:21 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 10:54:20 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 10:54:20 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 10:54:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y1+cHq1l9uIDpTA208yoQsEiBn8f56ke5bFN0Ojd16662Xjy9OaVWC3MKCo7A3pr0/LOH0SpEzQgqVxx6aK8Rn3SOJpQWRkofEILaVOCshZqlV71cDcaXd9gtjjOReYzYIrFr2dADXVfOaCfl4Q86/J4Fk7N3mot6pNomuO1c9+3hlv8bmJKDpM4dyZ0268zpHxTbR/rYEMrQX2myb22LM1J0uzCIApS6/Zow+mVp4ZVd9rsxXpxWLOZXl+Q8emgb9tAUUIiHIdPpy/ASNwgo54pD1/PQSMjZAOj66EAULvWlDNVPjfKWEstCg2Jjk0MHC2XJFP5po/ovlxj7o9KDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvJ0QWxknaJpKQPOV5eAE4rnLzIvLYhcrXkWavUYm3w=;
 b=e2cKwmLpLW7eNregzRVVsYjUpn3M610ghCk4l8mWIjIdqPW9BZezJnDc57zIZkpVudwk4e+8+nQBYNJu9vMtuGj/DM9iKPwK1Y2keEUbN8rjIhgox6XwtHY5fc75PLlOyqCRfRfnhI/KH8g/r91G+aN3aaYvU1jQ+naAlHoYBQApBzbS6WwEe5mZPLh9BTUpEQxoEs8LDxsiQFeViMdxAN+uVkNyjCMI/D948ydjUEHJsLYWRPapQUYkwB8Sy/3C0EVCZUtBGaECag44yzGmyOtyHT/JnKCJ4akLeMHSM4siM7NfqaXRVCehqoKBt0RfzaP3m4kNU5jxO88tIW8p2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by SA3PR11MB097687.namprd11.prod.outlook.com (2603:10b6:806:595::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 17:54:00 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 17:54:00 +0000
Date: Wed, 14 Oct 2026 13:53:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>
Subject: Re: [PATCH v13 11/16] drm/xe/hwmon: Decode CRI temperature registers
 as IEEE-754
Message-ID: <as_Bs7PvYw04oQy_@intel.com>
References: <20261014115806.831459-1-karthik.poosa@intel.com>
 <20261014115806.831459-12-karthik.poosa@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261014115806.831459-12-karthik.poosa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::26) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|SA3PR11MB097687:EE_
X-MS-Office365-Filtering-Correlation-Id: d2a16062-05fc-4e28-2625-08df2a1c202d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|56012099006|261009223027099003|11063799006|4143699003|22082099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: n8s4kv7poJE7n/T5g1/lIByrfjI72uVFDtgDaM9dnaLo+gxwREPd1ymtwc5D6UzCgBxL9MQwKk5b6L5q4XmmlFo3xtU5kO8S+7I2Ewcw6ux+a+Nlaq9NiDIe5KA1o+H+VEH637mrj7LiYIFVxS71+RAFaPyBU7moZYCBNWPyQmuWCirRCqIUgX/6RhM4J6HZFpWBj3RDvTRRVUSk1cDfllDGpEhrUSbGL7uRz2zYBHUaEPBZfqwLuo8lbRzG+ZNTg6ra0iP1WFmQmpLs8anJGeRbJxy/S7d6oUf3HibKmkC9hQoIsDTRxrPp7kQOvePAMccEARTVWn5EnlC9rodQFrljPRXVYbzthMk+oJZ2a7A7o/Cpv7ratTqbITTFXhWyzTe0BvVa68CIDYVcH0P6ddBcfb46RbuMQoF9ex9WNVqtcereBVkJqQT+V2hNQ3i9hk6dFmfZxan5yI5c7ccszYsZIYVF6YVTTYai5iytByHUMHlGF3djHmmPRWiG1JkeShmqIoojfmtQSwd3Nvx26Nnht+d2e0ZTAgU0uX0M1RWUJyLq6qbfW2fCezr1gcVgzP1jyIc/JI9SKt9CdFaw2ecn8kBIjtEztgMFFvrbxC/uN7BCApEoV1Tu8NZQSMnibybDnkNwXSeMsS62aR902Hzda517e4QrWx/VGyHL7eM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(261009223027099003)(11063799006)(4143699003)(22082099003)(10067099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EWoJSkZnP9IG5pOjB/qJYskx0Tle7/tFR9x06AAa4R0h2XSychUsK0Ogwc?=
 =?iso-8859-1?Q?zw573xGMH8IXINXqWtIdxGcn4molVaMWkFA5djcmYgUpMuwfXZdlcllTih?=
 =?iso-8859-1?Q?0Qfq07GZSQByL3mP/VREcas90V4V042dv9qfpz6OaBSePmJZ52lUNQtdtk?=
 =?iso-8859-1?Q?1Br9tiQf+CBpw0bITPDmBjQ+04hMoq4zD+IBNF48PnBvOdMoAz7ijNf/KD?=
 =?iso-8859-1?Q?FlQsJd8wnB6t6gbdgPlP1jEXh2J2uivxsz2lZ892fd7ljzivkgvT8U042L?=
 =?iso-8859-1?Q?D0wofjBVTAE8TFKOBU6xRzbL2jjMCJG/hrRyFNWRDcPqYzodbGDMRq0f0l?=
 =?iso-8859-1?Q?EbLDDETiE39FxhYX4G2g5FBnuayU3iKxA0j2o4jawPAh+8NEpVaqYIvzge?=
 =?iso-8859-1?Q?KfafPrSC+mcLL8EQ8lUTNPWQF4nSBj2+UTPUPmh5vxes9kTXEmGLRiXY/4?=
 =?iso-8859-1?Q?W6HmzpJ9m2Yk9ZcmasSOmDmD8e7816rUbS1I++qeeayQt1TUqz32a9sRFb?=
 =?iso-8859-1?Q?gm8tmBsPUgdMmIlTeE8APTxrjS/cgx/U2byvkMZnAmpTp+dKtCt9VWmAJZ?=
 =?iso-8859-1?Q?7SuU4p/QraZiJ/UfZPn8IK+JfwCnSVztx9CZ4VxZRGRNMxqN46iGcab8zW?=
 =?iso-8859-1?Q?TUOvoxYPMyxRwsbC9nuj8hWw7W5P7gx/9VvGKnUGUFNcAk+qo66b3pP9UO?=
 =?iso-8859-1?Q?YY4rsq+pTbkJyPYdLUQMcPsQthQQIhQKBUtDkspoUURIYnUWPHnCxttlLY?=
 =?iso-8859-1?Q?4feQN+pvWYFk4X25c8FtrtRBDaHXak6kVUq9vq7FmjpEPQI07sZzAXMk4x?=
 =?iso-8859-1?Q?hoOmkQ/DWZ8a+5nzF6uJk9ZksSCkLtcQFuHx6jbWAKZf8MLkpIciqZyqVt?=
 =?iso-8859-1?Q?91pOpy6vOa+H2LZLy8pTaSdrX6/ogbuidbSWWu9xJJGOlwkd2/dcC+krME?=
 =?iso-8859-1?Q?6WPYaI7JXlyWq0LF8wfqQxkrDiUg0wYffmdCtp7igYQPHFT3i/T26GEL3o?=
 =?iso-8859-1?Q?EHYsj7wZqwsTtw5nYfbHY0Ipi0o8dH2XRdJ1DjxN04fHIg0ogwp2lfsSOi?=
 =?iso-8859-1?Q?Iwsn/FmcdcAn8jTctg+pdq6fCIJ/CyXK1wbldwCzQGl++5Y0Sse9lpxjbZ?=
 =?iso-8859-1?Q?d4O+MJF4QBgH3dr7Z+NoXV29TzGlh7ldVxYMFGISy5J5KgImnNxhXwN6Lc?=
 =?iso-8859-1?Q?EuCE88jcIZ4O6ZDQaT/MsNvi7YtEdOYGnB+ZPDtemIOzB6mZQpoOwpRXB0?=
 =?iso-8859-1?Q?8fE/gdY+u//EvCnhQJjWRY6JWSQP5PMbqOTHX1EqpFeHVGR8QUDgIZJCDm?=
 =?iso-8859-1?Q?iSDvfy1MHp7sBYkkgQy05JNo34pTtaTpr5+GrF3z+d0JEty9Ry680G+M8V?=
 =?iso-8859-1?Q?4Eb2CDnlQO0AfqtycaYSM83Y6zOs/25AtYdub4XLzmrAdMYTwXpVNrwoP4?=
 =?iso-8859-1?Q?ZD6TcfO+vHx/u9WB9txz4+89KviNkfIOfkhb7g26Jsp+td2DNGNsouGIWr?=
 =?iso-8859-1?Q?z6tZgmf3km450kCybQsOqLCszMDwE5DLi4cV/imE+lK96XO68nG2CoMinK?=
 =?iso-8859-1?Q?xW1edy/JM3lJU6eO34gK9W/8wbZTukQXc4xXmHCyIWrpNstM54XQj2POlc?=
 =?iso-8859-1?Q?GVBXtejMYD9aTkhkMiyvlBIpjv3OvjiNwQ0cVUGSojLOgRiDcbYS72eFit?=
 =?iso-8859-1?Q?mLy3vYkkXMyKVw3aq2pi4SLh9+F0zP2lDmDfSUj6Hrkm+pfz8ICmQ5ddMr?=
 =?iso-8859-1?Q?YyWXUgCdEpi7FGhQfrzzAvGLsR5eUuOjNQkHuh0D4rh4YdtCKwBZH5GFSJ?=
 =?iso-8859-1?Q?refjMaT4Wg=3D=3D?=
X-Exchange-RoutingPolicyChecked: xn6gAOwt8swIZOXl82NKbnMIdk4GxP2jy7OUdPoWMrPp9pjxFSI2jtAnaleVVi5sScws3QO8KnWR4FGXZfVXtj7tGkBMeiwXJSDsFCRaU21Rkf3pp0+0te6REst+n9dfHxIRzzgtP/snVsmu4d65Yuq+RO20S3p4ZnYXOqzb4Qy+4iXHVlGE+HkgvwqTnpNGjZO+SQKW96+7L8A0TWLE0HGW8tnBakxqs9f17BjJckm4Oo4aRTKrKjexx6Vjl4iJsjzIvV11Qs7lBcWdk3xaz2ZRN6RZUVSVhuYnwZoWVvoqemm3i72beXiSKeGuz6/lU7IbGuaH/iVzlNbS5u2fjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a16062-05fc-4e28-2625-08df2a1c202d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 17:53:59.9447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5eD1wfCLX4O/agGzqSN3Le7fspH+5VdPO2k+tWdnnevsy/Jh9pAMXPPUTGBZuO4pNTLDn0fO+W7dUjdQiqHbAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB097687
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

On Wed, Oct 14, 2026 at 05:28:01PM +0530, Karthik Poosa wrote:
> CRI temperature registers encode package and VRAM temperatures as
> IEEE-754 floating-point values. Decode these values before exposing
> them through hwmon.
>  
> Use integer-based IEEE-754 decoding since kernel code does not use
> floating-point operations and hwmon reports integer temperatures.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: LLM
> ---
> 
> v2: Add missing description for parameter 'temperature' in
>     xe_hwmon_temperature_decode().
> 
> v3: Add missing mmio_temp_valid() check in xe_hwmon_temp_read() for MMIO
>     temperature register reads.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
>  drivers/gpu/drm/xe/xe_hwmon.c | 99 ++++++++++++++++++++++++++++++-----
>  1 file changed, 85 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index afcc80e34bfd..dad2397db141 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -1266,6 +1266,70 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  	}
>  }
>  
> +#define IEEE754_SIGN		REG_BIT(31)
> +#define IEEE754_EXP_MASK	REG_GENMASK(30, 23)
> +#define IEEE754_MANTISSA_MASK	REG_GENMASK(22, 0)
> +#define IEEE754_EXP_BIAS	127 /* Exponent bias to obtain the actual exponent */
> +#define IEEE754_MANTISSA_BITS	23 /* Mantissa width and implicit leading-1 bit position */
> +#define IEEE754_EXP_SPECIAL	0xff /* reserved exponent value encoding infinity or NaN */
> +
> +/**
> + * xe_hwmon_temperature_decode - Decode an IEEE-754 temperature register value
> + * @reg_val: The raw register value to decode
> + * @temperature: Pointer to store the decoded temperature in millidegrees Celsius.
> + *
> + * IEEE-754 single-precision format:
> + *
> + *  31 30                         23 22                         0
> + * +--+-----------------------------+----------------------------+
> + * | S|          exponent           |          fraction          |
> + * +--+-----------------------------+----------------------------+
> + *
> + * value = (-1)^S * 1.fraction * 2^(exponent - 127)
> + *
> + * Return: 0 on success or an error if @reg_val is non-finite or cannot be
> + * represented in millidegrees Celsius.
> + */
> +static int xe_hwmon_temperature_decode(u32 reg_val, long *temperature)
> +{
> +	u32 exponent = REG_FIELD_GET(IEEE754_EXP_MASK, reg_val);
> +	u32 mantissa = REG_FIELD_GET(IEEE754_MANTISSA_MASK, reg_val);
> +	s64 value;
> +	int shift;
> +
> +	/* Exponent 0xff encodes infinity or NaN. */
> +	if (exponent == IEEE754_EXP_SPECIAL)
> +		return -EINVAL;
> +
> +	/* Subnormal values are smaller than one millidegree Celsius. */
> +	if (!exponent) {
> +		*temperature = 0;
> +		return 0;
> +	}
> +
> +	value = (s64)(mantissa | BIT(IEEE754_MANTISSA_BITS)) * MILLIDEGREE_PER_DEGREE;
> +	shift = exponent - (IEEE754_EXP_BIAS + IEEE754_MANTISSA_BITS);
> +	if (shift >= 0) {
> +		if (shift >= BITS_PER_LONG || value > (LONG_MAX >> shift))
> +			return -ERANGE;
> +		value <<= shift;
> +	} else if (shift > -64) {
> +		value >>= -shift;
> +	} else {
> +		value = 0;
> +	}
> +
> +	/* Ensure the magnitude fits in long, which is 32-bit on some arches. */
> +	if (value > LONG_MAX)
> +		return -ERANGE;
> +
> +	if (reg_val & IEEE754_SIGN)
> +		value = -value;
> +
> +	*temperature = value;
> +	return 0;
> +}
> +
>  static int
>  xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  {
> @@ -1275,26 +1339,33 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  	switch (attr) {
>  	case hwmon_temp_input:
>  		switch (channel) {
> -		case CHANNEL_PKG:
> -		case CHANNEL_VRAM:
> -			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
> -
> -			/* HW register value is in degrees Celsius, convert to millidegrees. */
> -			*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> -			return 0;
>  		case CHANNEL_MCTRL:
>  			return get_mc_temp(hwmon, val);
>  		case CHANNEL_PCIE:
>  			return get_pcie_temp(hwmon, val);
> +		case CHANNEL_PKG:
> +		case CHANNEL_VRAM:
>  		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>  			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
> -			/*
> -			 * This temperature format is 24 bit [31:8] signed integer and 8 bit
> -			 * [7:0] fraction.
> -			 */
> -			*val = (s32)(REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val)) *
> -				(REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *
> -				 MILLIDEGREE_PER_DEGREE;
> +			if (!mmio_temp_valid(hwmon, reg_val)) {
> +				drm_dbg(&hwmon->xe->drm,
> +					"channel %d temperature invalid, val 0x%llx\n",
> +					channel, reg_val);
> +				return -ENXIO;
> +			}
> +			if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
> +				return xe_hwmon_temperature_decode((u32)reg_val, val);
> +			} else if (channel >= CHANNEL_VRAM_N) {
> +				/*
> +				 * This temperature format is 24 bit [31:8] signed integer and 8 bit
> +				 * [7:0] fraction for platforms before CRI.
> +				 */
> +				*val = (s32)REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val) *
> +					(REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *
> +					MILLIDEGREE_PER_DEGREE;
> +			} else {
> +				*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> +			}
>  			return 0;
>  		default:
>  			return -EOPNOTSUPP;
> -- 
> 2.25.1
> 
