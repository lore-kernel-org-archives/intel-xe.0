Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C49CC5B572
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 07:14:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE9510E0DA;
	Wed, 19 Aug 2026 07:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="oYmL5nQ2";
	dkim-atps=neutral
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250E210E0DA
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 07:14:36 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4956869750eso3882255e9.2
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 00:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787123674; x=1787728474; darn=lists.freedesktop.org;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=SkQivYCrGcLQO7U3us3T+CZ36XpWaxZtfR+PugmAjE4=;
 b=oYmL5nQ2XREjZMQ78ZsycDNfD/lItF9w2gAXQewGF9V/7f4DpdYFTI8iUT+GTdqZvF
 hlVEKV3NpqQdb1HrEwvN2hWdjpB7fEyZ5CY/eEqrG14mE1MntQWMrxFq70tULorzuPeL
 3m25/WtvFudjbXleCFWhozA59+Eq3qgTx+/cpdp0eTGoWwqbQnTnNM/HIXUnZA0KUB0X
 gSlMNXtjZ/lXC3UOsSNhv1H6nq42oDoIPGRpqlK0TtFdoYJhi/T5GxqJcZuQcBTvIWK/
 BOowhb9O+zjDNYNL2W/mIOjoLATbVeVbGcp2YcMb1xitv2nDhEScexA/0fnox3ptffM1
 iAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787123674; x=1787728474;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SkQivYCrGcLQO7U3us3T+CZ36XpWaxZtfR+PugmAjE4=;
 b=tSIuu5zHfaZe5k94jV3SyqSNaMcw91xv3TBwUMH+GMCLt/sxUefJUrJytj1Szik81g
 j5KVpvN1UgjX+R2DxlWHUkFVVVUsCsmgU5C1VFiDrArY7dNlm2Ci5+gCz0wSQYo1ONrA
 HePeshF5xV0m6GoUyPoNgqx91OnxwwJjkv3sGVIU5K8hhbwSjumLGl4TyHBjIao+fX94
 JYT0ICubNRuv/iZ8zW5HAEnJ3dgO3sYzbDilvLoCz4rgMlQjuXDy3Nw0+6YuB6dMbijz
 HCREI2ujNx2e49zocgrkfuqzh8fFXmT7BvgOEj2YshmJSSJEN1VVNs1Bm/aRryKptjC0
 4aFA==
X-Gm-Message-State: AOJu0YwxgdPA6cigFJPdmPi4G4wwpOmZq8MvB1UK0PartLoovnLBoB4X
 3XTppyiKn7nnFAP030RBsuRWhDVcW0cqJFThIPxE30E7rvjWbvXir17f
X-Gm-Gg: AR+sD12VsoJuLzP/4rig3r9laMScG93++IZa/lAsrtDW7uI8Z4mn+m4mwslreYu5LAO
 cvruEJ3Aq82w2xrxUFjcPgudpK6X05fandthmpc1SuqpolTa5S9OuCjMEVSwRxUhZaQ46xjpD78
 Yb48tJ8H1RPyDr7dswJ3v6cQn0exUO64clwa48tBNSSKWVxEV94OSXUymIxTWsHChF31Igw0juo
 0lu875/piYaEGjyxTryEVzZgdYeCgr0phjOsBQOmIgCnSuFirize9+3agCaA4HJ2awgvwrvkolR
 B6WLQhpjRL4Uy8TZwa109yc584xXHBSA+gcpae9Ur+PMTQmxbpPh+RzqlngIpg84h4g0eM7GJ7f
 H3d3SZhm0oBnXgWBBu5tNt+rzMyVkngLkzMetHMCc810pHkb4JMlEXCc9hKcyMqTvfwvy52UEcW
 7mYKUMcoy0BrJftXeGWuzEzaPWCWWkeYGE5yxadvujzWKUBkK7CvoMeKlv
X-Received: by 2002:a05:600c:3f18:b0:498:1595:be7b with SMTP id
 5b1f17b1804b1-499aa194df0mr43917965e9.4.1787123674377; 
 Wed, 19 Aug 2026 00:14:34 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa17567asm38234015e9.10.2026.08.19.00.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 00:14:33 -0700 (PDT)
Date: Wed, 19 Aug 2026 10:14:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [bug report] drm/i915/kunit: DP link: add fallback tests
Message-ID: <aoVX1vP6u291ElZW@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Imre Deak,

Commit 4fee95d4f887 ("drm/i915/kunit: DP link: add fallback tests")
from Jul 1, 2026 (linux-next), leads to the following Smatch static
checker warning:

	drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:1223 get_fallback_config()
	warn: ignoring unreachable code.

drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
    1210 static bool get_fallback_config(const struct test_config_table *expected_table,
    1211                                 enum intel_output_type output_type,
    1212                                 const struct intel_dp_link_config *target_config,
    1213                                 struct intel_dp_link_config *fallback_config)
    1214 {
    1215         struct kunit *test = expected_table->test;
    1216         const struct link_config_set *config_set =
    1217                 get_fallback_configs_for_output_type(test, output_type);
    1218         int i;
    1219 
    1220         i = lookup_config(config_set, target_config);
    1221         KUNIT_ASSERT_GE(test, i, 0);
    1222 
--> 1223         for (i--; i >= 0; i--) {
    1224                 const struct intel_dp_link_config *config =
    1225                         &config_set->entries[i];
    1226 
    1227                 assert_config_is_supported(expected_table, config);
    1228                 *fallback_config = *config;
    1229 
    1230                 return true;

This return statement means this for loop doesn't loop.

    1231         }
    1232 
    1233         return false;
    1234 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
