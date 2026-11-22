Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A1D606A31A
	for <intel-xe@archiver.kernel.org>; Sun, 22 Nov 2026 21:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JuGGCYif
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8244910E158;
	Sun, 22 Nov 2026 21:10:17 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FED10E158
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 21:10:08 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-490d59c3f0aso1183139f8f.1
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 13:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795381806; x=1795986606; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kkEnOl2a8G59aZX0QEUpspVrdBsd5WlJl19+dDmR1Ts=;
 b=JuGGCYifa4ByhgtA86iVh9AcDmITV+INNJJtcYhK9NZpGf6QqK1S0rCdA7FN6GoNpl
 GR1ez1vltWPTumY6ILRsDhw4P44VCVHqtM8L7oNnhCt1TYAnYpBTTcwq64oYFypzIm1U
 eqbWWCyqjV7xVOvXmJi+pfORtVG9fegMsSewXQCeOmQ5sRT0Mt2UTBzfBm4k159U/2P6
 Qc55ZKZ9wm3x9f/JobiW2ATpIp6krBSYDkZVPHOtXjaDVJRpZasCKbf6fJdR8cuXdfAJ
 PqyfWmuFElZVlyUOOLAgE4TK/KSHctbZ8ykTEJZmjbOFVDuwIUsC+v2quEU+3k8DPhCn
 0oSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795381806; x=1795986606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=kkEnOl2a8G59aZX0QEUpspVrdBsd5WlJl19+dDmR1Ts=;
 b=Qq9KNmkirMxpSoBPj5J1sTieLCKw4yQO0zcfCugfhCAcZ9JZ4KylmjVrCJZzg/13z1
 9KR5urfHITqp9MrcF0X5bwnuPCAtTfcMrhOCVUSwHL/iI4bNgNdWc7771daWTMSHP4J1
 3efBoygJxoCC5FiyiuGpALaCXLO1YUmw8RH5lQ37ZRjWCZqMhUKuo66iiRpUrlD46c7C
 whStZMQQk0E2ZrDgVi5nE+GrpEzO4pFilmB+ZeKdCHiHtIvoKwj8KiJrBpHA1XtE/ih+
 u7Wf1obm0e0f+dxQgrdsMUseSkg4GFTUusTaF2uSnKbweyrOqbg2oO4V0TQJcKLIaXLU
 RzNw==
X-Gm-Message-State: APuU4Z8ZbU2vS961ZCkKH+9+XowwbYWRcRSE7j74eINS/tIt7usLV1U9
 SQHyAGU36Tto2Lnn4B1hLU2dmy2GloJvC/iTGVEmEGZCedtHjhDJg3DcDma1Og==
X-Gm-Gg: AZFdTZe1xR6RtvHiD8wsENKad8/HzDOehR8zCAQlXGwK9zcWO4iw7NFA38SBSTFmgHH
 gLW6BfLa61lrOs31ARa2YUwORaC5VWMOLbKLK0z6tKECwfIqbv2cxSAt2MLtm0ZR1Qrnj+nCCeS
 lrGtudyWY9P8ehiwBy+hfK4o7VbT1sQqFZMwkEcqu97k46jsWkfXQN4GUiVTRn+7EngCddmohs9
 l03vxep8nl6szLJk5mvrTdRjvqn0olMTO7GtXkk93g7gyYZdEzgPuh9/G26bYAtTRimisSwxfmP
 hguiBTra97Sdm0yE4eDUgF159QEv/KM3hAwBYytgN54Vc5z7ltj5itv6Mvca19IQXBcDvsrVWse
 q0BPl2V9SKX0nx9jZe0Cb88rhQzGVAQUh1nGxWtpxFeREsbtt9YK2muxm8peyhPfQ90qcrZLiUZ
 KSdqOtkduw1uACDF63oGYNbPdpRtA6zHjCKqMxc0tFaiKrrVH5bOHzUu5WLpfhrh4Ga693l7Lwz
 5GHE/aTpTS7uhaMorWWNOeL4+jjzW2Db3C2Iy1XzbTNx/deKEA7luDlxOMosq34YSijdrK1hNUg
 HSbY5Da6XQlLyndGUt6urhT/JTNv2T7DsqgDnwVGSWMVfI7fRRLgDgxDH8Ra/RLUtu/vwi8iC54
 F2k9h5ruNcI+ndNmF4coiJ+Jx0Lse
X-Received: by 2002:a05:6000:25ca:b0:48f:bcbf:26fc with SMTP id
 ffacd0b85a97d-4abb831077amr18242037f8f.53.1795381806190; 
 Sun, 22 Nov 2026 13:10:06 -0800 (PST)
Received: from fedora.speedport.ip
 (p200300f5bf18ab2ae5bbfb8de26be908.dip0.t-ipconnect.de.
 [2003:f5:bf18:ab2a:e5bb:fb8d:e26b:e908])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6bc8ce06sm17822034f8f.47.2026.11.22.13.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 13:10:05 -0800 (PST)
From: aleskxyz <aleskxyz@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>, aleskxyz <aleskxyz@gmail.com>
Subject: [PATCH 1/1] drm/xe/hwmon: add DG2 dual-point fan-table programming
Date: Sun, 22 Nov 2026 22:09:30 +0100
Message-ID: <20261122210931.66822-2-aleskxyz@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122210931.66822-1-aleskxyz@gmail.com>
References: <20261015190113.1268522-1-karthik.poosa@intel.com>
 <20261122210931.66822-1-aleskxyz@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The existing BMG path programs one control point per mailbox write and
then commits the point count, reading the table back with GET. On DG2
that encoding is ACKed but does not apply a curve. A custom table only
takes effect as a dual-point Set on fan 0: subcommand 1 writes the point
count and subcommand 2 packs two 8/8 temperature/speed points in each
dword.

Gate the encoder on XE_DG2 so the existing BMG write_batch/GET flow is
unchanged. Add FSC_WRITE_FAN_TABLE_DUAL for those packed writes. The
helper sends the count and then the packed pairs. A count of zero
restores factory control, which the BMG subcommand-0 point-count write
does not.

Skip user and stock GET. Manual-mode sysfs and suspend restore use the
in-memory USER cache. Stock-mode show is empty. Program an IGS default
curve only when pwm_enable=1 finds an empty USER table, as a driver seed
rather than firmware stock.

Reject odd counts: the last packed dword is one point plus (0,0) and is
not applied. pwm_enable=2 programs count 0 through the same DG2 encoder.
Probe skips the min-PWM GET (subcommand 8) and the stock-table GET, sets
min_pwm to 0, and still reads max RPS for fan 0. Hide pwm2 and pwm3 and
their curve attributes; only fan 0 is programmed.

Signed-off-by: aleskxyz <aleskxyz@gmail.com>

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index e91bcacdf..fd3ddada6 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -1200,6 +1200,26 @@ static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 sub
 				     uval, NULL);
 }
 
+/* DG2 FSC is dual-point Set (IP 12.70); BMG uses the existing BMG path. */
+static bool xe_hwmon_is_dg2(const struct xe_hwmon *hwmon)
+{
+	return hwmon->xe->info.platform == XE_DG2;
+}
+
+/* DG2 only programs fan 0. */
+static bool xe_hwmon_pwm_channel_enabled(const struct xe_hwmon *hwmon, unsigned int channel)
+{
+	if (xe_hwmon_is_dg2(hwmon))
+		return channel == 0;
+	return IS_FAN_ENABLED(channel);
+}
+
+/* Driver default when enable=1 has an empty USER table. Not firmware stock. */
+static const struct fan_control_point xe_hwmon_igs_default_table[] = {
+	{ 25, 0 }, { 33, 10 }, { 41, 20 }, { 49, 30 }, { 57, 40 },
+	{ 65, 50 }, { 73, 60 }, { 81, 70 }, { 89, 80 }, { 97, 90 },
+};
+
 static int xe_hwmon_get_fan_enable_mask(struct xe_hwmon *hwmon)
 {
 	int ret;
@@ -1231,8 +1251,20 @@ static int xe_hwmon_get_fan_enable_mask(struct xe_hwmon *hwmon)
 static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *point_count,
 					enum fan_table_type table_type)
 {
+	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
 	int ret;
 
+	if (xe_hwmon_is_dg2(hwmon)) {
+		/* No user/stock GET; return the RAM cache. */
+		if (table_type == USER_FAN_TABLE)
+			*point_count = fi->fan_table[USER_FAN_TABLE].point_count;
+		else
+			*point_count = fi->fan_table[STOCK_FAN_TABLE].point_count;
+		if (*point_count > MAX_FAN_CONTROL_POINTS)
+			return -EINVAL;
+		return 0;
+	}
+
 	ret = xe_hwmon_pcode_read_fan_control(hwmon,
 					      (table_type == USER_FAN_TABLE) ?
 					      FSC_READ_USER_FAN_CONTROL_POINTS :
@@ -1254,6 +1286,52 @@ static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *poi
 	return 0;
 }
 
+/* Fan 0 Set: subcmd 1 = count, then packed pairs. Even N only; count 0 restores factory. */
+static int xe_hwmon_program_user_fan_table_dg2(struct xe_hwmon *hwmon,
+					       const struct fan_control_point *points,
+					       u32 point_count)
+{
+	struct xe_pcode_write writes[1 + DIV_ROUND_UP(MAX_FAN_CONTROL_POINTS, 2)];
+	unsigned int n = 0;
+	u32 i;
+	int ret;
+
+	if (WARN_ON(point_count > MAX_FAN_CONTROL_POINTS))
+		return -EINVAL;
+	if (point_count & 1)
+		return -EINVAL;
+	if (point_count && !points)
+		return -EINVAL;
+
+	writes[n].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_FAN_TABLE, 0);
+	writes[n].data = point_count;
+	n++;
+
+	for (i = 0; i < point_count; i += 2) {
+		u32 data0 = FIELD_PREP(FAN_CONTROL_POINT_TEMP_MASK, points[i].temp) |
+			    FIELD_PREP(FAN_CONTROL_POINT_SPEED_MASK, points[i].speed);
+
+		if (i + 1 < point_count) {
+			u32 hi = FIELD_PREP(FAN_CONTROL_POINT_TEMP_MASK,
+					    points[i + 1].temp) |
+				 FIELD_PREP(FAN_CONTROL_POINT_SPEED_MASK,
+					    points[i + 1].speed);
+
+			data0 |= hi << 16;
+		}
+		writes[n].mbox = PCODE_MBOX(FAN_SPEED_CONTROL,
+					    FSC_WRITE_FAN_TABLE_DUAL, 0);
+		writes[n].data = data0;
+		n++;
+	}
+
+	ret = xe_pcode_write_batch(xe_device_get_root_tile(hwmon->xe), writes, n);
+	if (ret)
+		xe_dbg(hwmon->xe, "FSC dual table count %u failed, ret=%d\n",
+		       point_count, ret);
+	return ret;
+}
+
 static int xe_hwmon_commit_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
 					  const struct fan_control_point *points, u32 point_count)
 {
@@ -1292,6 +1370,9 @@ static int xe_hwmon_commit_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
 				FIELD_PREP(FAN_CONTROL_POINT_SPEED_MASK, speed);
 	}
 
+	if (xe_hwmon_is_dg2(hwmon))
+		return xe_hwmon_program_user_fan_table_dg2(hwmon, points, point_count);
+
 	xe_dbg(hwmon->xe, "committing fan %d user table with %d points\n", fan, point_count);
 
 	writes[point_count].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_NUM_FAN_CONTROL_POINTS,
@@ -1335,6 +1416,39 @@ static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
 	xe_dbg(hwmon->xe, "activating fan %d user table from %s table\n", fan,
 	       (table_source == USER_FAN_TABLE) ? "user" : "stock");
 
+	if (xe_hwmon_is_dg2(hwmon)) {
+		struct fan_control_point pts[MAX_FAN_CONTROL_POINTS];
+		const struct fan_control_point *src = source_table->fcp;
+
+		point_count = source_table->point_count;
+		if (table_source == STOCK_FAN_TABLE) {
+			src = xe_hwmon_igs_default_table;
+			point_count = ARRAY_SIZE(xe_hwmon_igs_default_table);
+		}
+		if (!point_count || point_count > MAX_FAN_CONTROL_POINTS)
+			return -EINVAL;
+
+		for (point = 0; point < point_count; point++) {
+			pts[point].temp = src[point].temp;
+			pts[point].speed = is_full_speed ? 100 :
+				max_t(u8, src[point].speed,
+				      min_t(u32, fi->min_pwm, U8_MAX));
+		}
+		ret = xe_hwmon_program_user_fan_table_dg2(hwmon, pts, point_count);
+		if (ret)
+			return ret;
+		if (table_source == STOCK_FAN_TABLE) {
+			for (point = 0; point < point_count; point++)
+				fi->fan_table[USER_FAN_TABLE].fcp[point] = pts[point];
+		}
+		fi->fan_table[USER_FAN_TABLE].point_count = point_count;
+		fi->fan_table[USER_FAN_TABLE].temp_staged = 0;
+		fi->fan_table[USER_FAN_TABLE].speed_staged = 0;
+		fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
+		fi->is_full_speed = is_full_speed;
+		return 0;
+	}
+
 	point_count = source_table->point_count;
 	if (!point_count || point_count > MAX_FAN_CONTROL_POINTS) {
 		xe_err(hwmon->xe,
@@ -1413,6 +1527,23 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm, boo
 	pwm = DIV_ROUND_CLOSEST(pwm * 100, U8_MAX);
 	clamped_pwm = max_t(u8, pwm, min_t(u32, fi->min_pwm, U8_MAX));
 
+	if (xe_hwmon_is_dg2(hwmon)) {
+		struct fan_control_point pts[MIN_FAN_CONTROL_POINTS];
+
+		for (i = 0; i < MIN_FAN_CONTROL_POINTS; i++) {
+			pts[i].temp = FIXED_PWM_TEMP + i;
+			pts[i].speed = clamped_pwm;
+		}
+		ret = xe_hwmon_program_user_fan_table_dg2(hwmon, pts,
+							  MIN_FAN_CONTROL_POINTS);
+		if (ret) {
+			xe_err(hwmon->xe, "failed to write pwm %d for fan %d, ret=%d\n", pwm, fan,
+			       ret);
+			return ret;
+		}
+		goto pwm_cache_update;
+	}
+
 	/*
 	 * Set the first fan control point in the user table to the clamped PWM value.
 	 * Use only the first fan control point for setting the PWM value.
@@ -1443,6 +1574,7 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm, boo
 		return ret;
 	}
 
+pwm_cache_update:
 	/* Update the user fan table cache. */
 	for (i = 0; i < MIN_FAN_CONTROL_POINTS; i++) {
 		fi->fan_table[USER_FAN_TABLE].fcp[i].temp = FIXED_PWM_TEMP + (i);
@@ -2056,7 +2188,7 @@ static umode_t xe_hwmon_curve_attributes_visible(struct kobject *kobj,
 	u32 attrs_per_fan = 2 * MAX_FAN_CONTROL_POINTS;
 	u32 fan = index / attrs_per_fan;
 
-	if (!hwmon->xe->info.has_fan_control || !IS_FAN_ENABLED(fan))
+	if (!hwmon->xe->info.has_fan_control || !xe_hwmon_pwm_channel_enabled(hwmon, fan))
 		return 0;
 
 	/* All slots must exist at registration, before the user curve has been staged. */
@@ -2083,6 +2215,26 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon, bool is_init)
 		if (!IS_FAN_ENABLED(fan))
 			continue;
 
+		if (xe_hwmon_is_dg2(hwmon)) {
+			if (is_init)
+				fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
+			/* No min-PWM GET on DG2. */
+			fi->min_pwm = 0;
+			if (fan == 0) {
+				ret = xe_hwmon_pcode_read_fan_control(hwmon,
+								      FSC_READ_MAX_FAN_RPS, 0,
+								      &fi->max_rps);
+				if (ret)
+					xe_warn(hwmon->xe,
+						"failed to read fan %d max RPS, ret=%d\n",
+						fan, ret);
+				else
+					xe_dbg(hwmon->xe, "fan %d max RPS %u\n",
+					       fan, fi->max_rps);
+			}
+			continue;
+		}
+
 		ret = xe_hwmon_pcode_read_fan_control(hwmon,
 						      FSC_READ_STOCK_FAN_CONTROL_POINTS,
 						      fan, &stock_fcp_count);
@@ -2699,7 +2851,7 @@ xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 static umode_t
 xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
-	if (!hwmon->xe->info.has_fan_control || !IS_FAN_ENABLED(channel))
+	if (!hwmon->xe->info.has_fan_control || !xe_hwmon_pwm_channel_enabled(hwmon, channel))
 		return 0;
 
 	switch (attr) {
@@ -2851,10 +3003,15 @@ xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
 				break;
 			}
 		} else if (val == XE_FAN_PWM_AUTO_STOCK_TABLE) {
+			if (xe_hwmon_is_dg2(hwmon)) {
+				ret = xe_hwmon_program_user_fan_table_dg2(hwmon, NULL, 0);
+				goto stock_table_applied;
+			}
 			/* Switch to stock table specifying the user points to 0. */
 			ret = xe_pcode_write(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL,
 								   FSC_WRITE_NUM_FAN_CONTROL_POINTS,
 								   channel), 0);
+stock_table_applied:
 			if (ret) {
 				xe_warn(hwmon->xe,
 					"failed to disable user fan table for fan %d, ret=%d\n",
@@ -3172,6 +3329,15 @@ void xe_hwmon_suspend(struct xe_device *xe)
 		if (fi->pwm_enable_mode == XE_FAN_PWM_AUTO_STOCK_TABLE)
 			continue;
 
+		if (xe_hwmon_is_dg2(hwmon)) {
+			/* No user GET; restore from RAM. */
+			if (fi->fan_table[USER_FAN_TABLE].point_count <
+			    MIN_FAN_CONTROL_POINTS)
+				continue;
+			fi->restore_user_table = true;
+			continue;
+		}
+
 		ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
 		if (ret || point_count < MIN_FAN_CONTROL_POINTS) {
 			xe_warn(hwmon->xe,
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 80642bee0..17c6ec189 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -84,6 +84,8 @@
 #define   FAN_SPEED_CONTROL			0x7D
 #define     FSC_WRITE_NUM_FAN_CONTROL_POINTS	0x0
 #define     FSC_WRITE_FAN_TABLE			0x1
+/* DG2: two packed points */
+#define     FSC_WRITE_FAN_TABLE_DUAL		0x2
 #define     FSC_READ_MAX_FAN_RPS        0x3
 #define     FSC_READ_NUM_FANS			0x4
 #define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
